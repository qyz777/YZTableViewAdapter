//
//  FirstCell.swift
//  YZTableViewAdapter_Example
//
//  Created by 戚译中 on 2019/4/10.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class FirstCell: UITableViewCell, TableViewCellDataReceiver {
    
    func updateCell(with provider: TableViewCellProvider) {
        let p = provider as! FirstCellProvider
        backgroundColor = p.color
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
