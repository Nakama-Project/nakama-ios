//
//  ViewController.swift
//  nakama-ios
//
//  Created by Andy Wong on 12/23/15.
//  Copyright © 2015 Nakama Project. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var hitPointsA: UILabel!
    @IBOutlet var hitPointsB: UIView!
    @IBOutlet weak var turnTracker: UILabel!
    
    private var turnCounter = 0

    private enum Moves
    {
        case DestinyBond
        case EarthPower
        case Flamethrower
        case IceBeam
        case Protect
        case ShadowBall
        case SludgeWave
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    @IBAction func attack(sender: UIButton)
    {
        switch sender.currentTitle! {
        case "Destiny Bond":
            break
        case "Earth Power":
            break
        case "Flamethrower":
            break
        case "Ice Beam":
            break
        case "Protect":
            break
        case "Shadow Ball":
            break
        case "Sludge Wave":
            break
        default:
            break
        }
    }
}
