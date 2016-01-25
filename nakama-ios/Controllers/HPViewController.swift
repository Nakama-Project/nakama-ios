//
//  HPViewController.swift
//  nakama-ios
//
//  Created by Stephen Wong on 1/24/16.
//  Copyright © 2016 Nakama Project. All rights reserved.
//

import UIKit
import Cartography

class HPViewController: UIViewController {

    let nakamaLabel = UILabel()
    let hpLabel = UILabel()
    let ghostImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNakamaTest()
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
