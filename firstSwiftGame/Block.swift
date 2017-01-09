//
//  Block.swift
//  firstSwiftGame
//
//  Created by wangzh on 2017/01/09.
//  Copyright © 2017年 Fenrir.com. All rights reserved.
//

import SpriteKit

let NumberOfColors : UInt32 = 6

enum BlockColor: Int, CustomStringConvertible {
    
    case Blue = 0, Orange, Purple, Red, Teal, Yellow
    
    var spriteName: String {
        switch self {
        case .Blue:
            return "Blue"
        case .Orange:
            return "Orange"
        case .Purple:
            return "Purple"
        case .Red:
            return "Red"
        case .Teal:
            return "Teal"
        case .Yellow:
            return "Yellow"
        }
    }
    
    var description: String {
        return self.spriteName
    }
    
    static func random() -> BlockColor {
        return BlockColor(rawValue: Int(arc4random_uniform(NumberOfColors)))!
    }
    
}

class Block: Hashable, CustomStringConvertible {
    let color: BlockColor
    
    var column: Int
    var row: Int
    var sprite: SKSpriteNode?
    
    var spriteName: String {
        return color.spriteName
    }
    
    init(column: Int, row: Int, color:BlockColor) {
        self.column = column
        self.row = row
        self.color = color
    }
    
    var hashValue: Int {
        return self.column ^ self.row
    }
    
    var description: String {
        return "\(color): [\(column). \(row)]"
    }
    
    static func == (lhs: Block, rhs: Block) -> Bool {
        return
        lhs.column == rhs.column
        && lhs.row == rhs.row
        && lhs.color.rawValue == rhs.color.rawValue
    }
    
}

