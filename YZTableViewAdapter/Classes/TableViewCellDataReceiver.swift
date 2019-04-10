//
//  TableViewCellDataReceiver.swift
//  YZTableViewAdapter
//
//  Created by qyz777 on 04/10/2019.
//  Copyright (c) 2019 qyz777. All rights reserved.
//

import Foundation

public protocol TableViewCellDataReceiver {
    
    func updateCell(with provider: TableViewCellProvider)
    
}
