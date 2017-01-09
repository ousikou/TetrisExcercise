//
//  GameViewController.swift
//  firstSwiftGame
//
//  Created by wangzh on 2017/01/06.
//  Copyright © 2017年 Fenrir.com. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    var scene: GameScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let skView = view as! SKView
        skView.isMultipleTouchEnabled = false
        
        scene = GameScene(size: skView.bounds.size)
        
        scene.scaleMode = .aspectFill
        
        skView.presentScene(scene)
        
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}

