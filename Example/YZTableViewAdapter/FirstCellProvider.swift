//
//  FirstCellProvider.swift
//  YZTableViewAdapter_Example
//
//  Created by 戚译中 on 2019/4/10.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class FirstCellProvider: TableViewCellProvider {
    
    var color = UIColor.red
    
    func cellHeight() -> CGFloat {
        return 40
    }
    
    func cellClassName() -> String {
        return "FirstCell"
    }
    
}
