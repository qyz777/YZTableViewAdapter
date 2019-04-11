//
//  ViewController.swift
//  YZTableViewAdapter
//
//  Created by qyz777 on 04/10/2019.
//  Copyright (c) 2019 qyz777. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var adapter: TableViewAdapter?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "不使用Section"
        view.addSubview(tableView)
        tableView.frame = view.bounds
        
        adapter = TableViewAdapter.init(with: tableView)
        
//        如果你需要使用其他tableView的Delegate你需要这么写
        adapter?.tableViewDelegate = self
//        DataSource也一样
//        adapter?.tableViewDataSource = self
        
        let model = InfoModel()
        var dataArray: [TableViewCellProvider] = []
        for i in 0..<30 {
            if i % 2 == 0 {
                let p = FirstCellProvider.init(with: model)
                p.color = .lightGray
                dataArray.append(p)
            } else {
                let p = SecondCellProvider()
                p.color = .white
                dataArray.append(p)
            }
        }
        
        adapter?.reloadRowsData(by: dataArray)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "next", style: .done, target: self, action: #selector(nextController))
    }
    
    @objc func nextController() {
        navigationController?.pushViewController(SecondViewController(), animated: true)
    }

    lazy var tableView: UITableView = {
        let view = UITableView()
        return view
    }()

}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset)
    }
    
}
