//
//  Shape.swift
//  firstSwiftGame
//
//  Created by wangzh on 2017/01/09.
//  Copyright © 2017年 Fenrir.com. All rights reserved.
//

import SpriteKit


let NumOrientations: UInt32 = 4

enum Orientation: Int, CustomStringConvertible {
    case Zero = 0, Ninety, OneEighty, TwoSeventy
    
    var description: String {
        switch self {
            
        case .Zero:
            return "0"
        case .Ninety:
            return "90"
        case .OneEighty:
            return "180"
        case .TwoSeventy:
            return "270"
        }
    }
    
    static func random() -> Orientation {
        return Orientation(rawValue:Int(arc4random_uniform(NumOrientations)))!
    }
    
    static func rotate(orientation: Orientation, clockWise: Bool) -> Orientation {
        var temp = clockWise ? 1 : -1
        var rotated = Orientation.RawValue + temp
        if rotated > Orientation.TwoSeventy.rawValue {
            rotated = Orientation.Zero
        } else if rotated < 0 {
            rotated = Orientation.TwoSeventy
        }
        return Orientation(rawValue: rotated)!
    }
}


// --Shape--
let NumShapeTypes: UInt32 = 7

let FirstBlockIdx: Int = 0
let SecondBlockIdx: Int = 0
let ThirdBlockIdx: Int = 0
let FourthBlockIdx: Int = 0


class Shape: Hashable, CustomStringConvertible {
    
    let color: BlockColor
    
    var blocks = Array<Block>()
    
    var orientation: Orientation
    
    var column, row : Int
    
    var description: String {
         return "\(color) block facing \(orientation): \(blocks[FirstBlockIdx]), \(blocks[SecondBlockIdx]), \(blocks[ThirdBlockIdx]), \(blocks[FourthBlockIdx])"
    }
    
    // Override
    var blockRowColumnPositions: [Orientation: Array<(columnDiff: Int, rowDiff: Int)>] {
        return [:]
    }
    
    var bottomBlocksForOrientations : [Orientation : Array<Block>] {
        return [:]
    }
    
    var bottomBlocks : Array<Block> {
        guard let bottomBlocks = bottomBlocksForOrientations[orientation] else {
            return []
        }
        return bottomBlocks
    }
    
    var hashValue: Int {
         return blocks.reduce(0) { $0.hashValue ^ $1.hashValue }
    }
    
    init(column: Int, row: Int, color: BlockColor, orientation: Orientation) {
        self.column = column
        self.row = row
        self.color = color
        self.orientation = orientation
        
    }
    
    convenience init(column: Int, row: Int) {
        self.init(column: column, row: row, color: BlockColor.random(), orientation: Orientation.random())
    }
    
    static func == (lhs: Shape, rhs: Shape) -> Bool {
        return lhs.row == rhs.row && lhs.column == lhs.column
    }
}





