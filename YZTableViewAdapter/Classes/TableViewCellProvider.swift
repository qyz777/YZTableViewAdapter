//
//  TableViewCellProvider.swift
//  YZTableViewAdapter
//
//  Created by qyz777 on 04/10/2019.
//  Copyright (c) 2019 qyz777. All rights reserved.
//

import Foundation

public protocol TableViewCellProvider {
    
    /// 返回cell的高度
    func cellHeight() -> CGFloat
    
    /// 返回cell的类名
    func cellClassName() -> String
    
}
