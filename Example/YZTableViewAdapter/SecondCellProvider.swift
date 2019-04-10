//
//  SecondCellProvider.swift
//  YZTableViewAdapter_Example
//
//  Created by 戚译中 on 2019/4/10.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

class SecondCellProvider: TableViewCellProvider {
    
    var color = UIColor.red
    
    func cellHeight() -> CGFloat {
        return 100
    }
    
    func cellClassName() -> String {
        return "SecondCell"
    }
    
}
