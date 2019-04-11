//
//  SecondViewController.swift
//  YZTableViewAdapter_Example
//
//  Created by 戚译中 on 2019/4/10.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var adapter: TableViewAdapter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "使用Section"
        view.addSubview(tableView)
        tableView.frame = view.bounds
        
        adapter = TableViewAdapter.init(with: tableView)
        
        let model = InfoModel()
        var dataArray: [[TableViewCellProvider]] = []
        var d1: [TableViewCellProvider] = []
        var d2: [TableViewCellProvider] = []
        for i in 0..<30 {
            if i < 15 {
                let p = FirstCellProvider.init(with: model)
                p.color = .lightGray
                d1.append(p)
            } else {
                let p = SecondCellProvider()
                p.color = .white
                d2.append(p)
            }
        }
        dataArray.append(d1)
        dataArray.append(d2)
        adapter?.reloadSectionsData(by: dataArray)
    }
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        return view
    }()

}
