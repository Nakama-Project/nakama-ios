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
    
    let meteor: MeteorClient
    let nakamaLabel = UILabel()
    let hpLabel = UILabel()
    let ghostImage = UIImageView()
    
    // MARK: Init
    
    init(meteorClient: MeteorClient) {
        meteor = meteorClient
        super.init(nibName: nil, bundle: nil)
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
            print("Connected to local server")
        }
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
