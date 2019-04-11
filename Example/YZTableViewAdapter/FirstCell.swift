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
        let model = p.model!
        titleLabel.text = model.title
        contentLabel.text = model.content
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(contentLabel)
        titleLabel.frame = CGRect.init(x: 11, y: 11, width: 120, height: 21)
        contentLabel.frame = CGRect.init(x: 11, y: 42, width: 300, height: bounds.height - 42)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        return view
    }()
    
    lazy var contentLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        return view
    }()

}
