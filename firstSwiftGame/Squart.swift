//
//  Squart.swift
//  firstSwiftGame
//
//  Created by wzhnopc on 2017/1/9.
//  Copyright © 2017年 Fenrir.com. All rights reserved.
//

import Foundation

class Squart: Shape {
    
    override var bottomBlocksForOrientations: [Orientation : Array<Block>] {
        return [
        Orientation.Zero:[blocks[ThirdBlockIdx], blocks[FourthBlockIdx]],
        Orientation.OneEighty : [blocks[ThirdBlockIdx], blocks[FourthBlockIdx]],
        Orientation.Ninety : [blocks[ThirdBlockIdx], blocks[FourthBlockIdx]],
        Orientation.TwoSeventy : [blocks[ThirdBlockIdx], blocks[FourthBlockIdx]]
        ]
    }
    
    
    override var blockRowColumnPositions: [Orientation : Array<(columnDiff: Int, rowDiff: Int)>] {
        
        return [
            Orientation.Zero : [(0, 0), (1,0), (0,1), (1,1)],
            Orientation.OneEighty : [(0, 0), (1,0), (0,1), (1,1)],
            Orientation.Ninety : [(0, 0), (1,0), (0,1), (1,1)],
            Orientation.TwoSeventy : [(0, 0), (1,0), (0,1), (1,1)],
        ]
        
    }
}
