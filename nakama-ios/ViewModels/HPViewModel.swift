//
//  HPViewModel.swift
//  nakama-ios
//
//  Created by Stephen Wong on 2/28/16.
//  Copyright © 2016 Nakama Project. All rights reserved.
//

import Foundation
import ObjectiveDDP

class HPViewModel {
    
    typealias notificationUpdate = (String) -> Void
    
    private let nakamaUpdate: notificationUpdate
    private let hpUpdate: notificationUpdate
    private let meteor: MeteorClient
    
    private var nakama: M13MutableOrderedDictionary!
    
    init(meteorClient: MeteorClient, nakamaUpdateCallback: notificationUpdate, hpUpdateCallback: notificationUpdate) {
        meteor = meteorClient
        nakamaUpdate = nakamaUpdateCallback
        hpUpdate = hpUpdateCallback
        nakama = meteor.collections["hp"] as? M13MutableOrderedDictionary
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didReceiveNakamaUpdate:", name: "hp_added", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didReceiveHPUpdate:", name: "hp_changed", object: nil)
    }
    
    // MARK: Notification Handlers
    
    dynamic private func didReceiveNakamaUpdate(notification: NSNotification) {
        // TODO: Figure out when meteor collections actually update so I don't have to do this check
        if nakama == nil {
            nakama = meteor.collections["hp"] as? M13MutableOrderedDictionary
        }
        guard let newNakama = nakama[0]["nakama"] as? String else { return }
        nakamaUpdate(newNakama)
        guard let newHP = nakama[0]["hp"] as? Int else { return }
        hpUpdate("\(newHP)")
    }
    
    dynamic private func didReceiveHPUpdate(notification: NSNotification) {
        guard let newHP = nakama[0]["hp"] as? Int else { return }
        hpUpdate("\(newHP)")
    }
}