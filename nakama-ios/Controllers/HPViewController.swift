//
//  HPViewController.swift
//  nakama-ios
//
//  Created by Stephen Wong on 1/24/16.
//  Copyright © 2016 Nakama Project. All rights reserved.
//

import UIKit
import Cartography
import ObjectiveDDP

private let websocketReadyKey = "websocketReady"

class HPViewController: UIViewController {
    
    private var meteor: MeteorClient
    private let nakamaLabel = UILabel()
    private let hpLabel = UILabel()
    private let ghostImage = UIImageView()
    
    private var hpViewModel: HPViewModel? = nil
    
    // MARK: Init
    
    init(meteorClient: MeteorClient) {
        meteor = meteorClient
        super.init(nibName: nil, bundle: nil)
        hpViewModel = HPViewModel(meteorClient: meteor, nakamaUpdateCallback: updateNakamaLabel, hpUpdateCallback: updateHPLabel)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    
    override func viewWillAppear(animated: Bool) {
        let observingOption = NSKeyValueObservingOptions.New
        meteor.addObserver(self, forKeyPath: websocketReadyKey, options: observingOption, context: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNakamaTest()
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if keyPath == websocketReadyKey && meteor.websocketReady {
            print("Websocket is ready")
        }
    }
    
    // MARK: UI Updates
    
    private func updateNakamaLabel(nakamaText: String) {
        nakamaLabel.text = nakamaText
    }
    
    private func updateHPLabel(hpText: String) {
        hpLabel.text = hpText
    }
    
    private func setupNakamaTest() {
        nakamaLabel.text = "Hello"
        view.addSubview(nakamaLabel)
        constrain(nakamaLabel, view) { nakamaLabel, view in
            nakamaLabel.center == view.center
        }
        
        hpLabel.text = "-1"
        view.addSubview(hpLabel)
        constrain(hpLabel, nakamaLabel) { hpLabel, nakamaLabel in
            hpLabel.centerX == nakamaLabel.centerX
            hpLabel.top == nakamaLabel.bottom + 40
        }
        
        ghostImage.image = UIImage(named: "gengar")
        view.addSubview(ghostImage)
        constrain(ghostImage, view) { ghostImage, view in
            ghostImage.centerX == view.centerX
        }
        constrain(ghostImage, nakamaLabel) { ghostImage, nakamaLabel in
            ghostImage.bottom == nakamaLabel.top - 40
        }
    }
}
