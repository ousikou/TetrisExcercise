//
//  GameScene.swift
//  firstSwiftGame
//
//  Created by wangzh on 2017/01/06.
//  Copyright © 2017年 Fenrir.com. All rights reserved.
//

import SpriteKit
import GameplayKit

let TickLengthLevelOne = TimeInterval(600)


class GameScene: SKScene {
    
    var tick:(() -> ())?
    
    var tickLengthMillis = TickLengthLevelOne
    
    var lastTick: NSDate?
    
    
    override init(size: CGSize) {
        super.init(size: size)
        
        anchorPoint = CGPoint(x:0, y:1.0)
        let backGound = SKSpriteNode(imageNamed: "background")
        backGound.position = CGPoint(x:0, y:0)
        backGound.anchorPoint = CGPoint(x:0, y: 1.0)
        addChild(backGound)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        guard let lastTick = lastTick else {
            return
        }
        
        let timePassed = lastTick.timeIntervalSinceNow * -1000.0
        
        if timePassed > tickLengthMillis {
            
            self.lastTick = NSDate()
        }
        
        tick?()
    }
    
    func startTicking() {
        lastTick = NSDate()
    }
    
    func stopTicking() {
        lastTick = nil
    }
}
