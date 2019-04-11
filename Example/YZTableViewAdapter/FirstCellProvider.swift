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
    var model: InfoModel?
    
    var height: CGFloat = 40
    
    func cellHeight() -> CGFloat {
        return height
    }
    
    func cellClassName() -> String {
        return "FirstCell"
    }
    
    init(with model: InfoModel) {
        self.model = model
//        在这可以计算cell高度
        let contentHeight = model.content.boundingRect(with: CGSize.init(width: CGFloat.greatestFiniteMagnitude, height: 0), options: [.usesLineFragmentOrigin], attributes: nil, context: nil).height
        height += contentHeight
        height += 21
    }
    
}
