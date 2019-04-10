//
//  TableViewAdapter.swift
//  YZTableViewAdapter
//
//  Created by qyz777 on 04/10/2019.
//  Copyright (c) 2019 qyz777. All rights reserved.
//

import UIKit

public protocol TableViewAdapterDelegate: class {
    
    /// tableViewCell即将刷新数据
    ///
    /// - Parameters:
    ///   - cell: UITableViewCell
    ///   - indexPath: IndexPath
    func tableViewCell(_ cell: UITableViewCell, willUpdateRowAt indexPath: IndexPath)
    
    
    /// tableViewCell已经刷新数据
    ///
    /// - Parameters:
    ///   - cell: UITableViewCell
    ///   - indexPath: IndexPath
    func tableViewCell(_ cell: UITableViewCell, didUpdateRowAt indexPath: IndexPath)
    
}

public class TableViewAdapter: NSObject {
    
    /// 是否使用Section
    public var useSection = false
    
    /// 使用Section需要的dataSource
    public var sectionCellModelArray: [[TableViewCellProvider]] = []
    
    /// 不使用需要的dataSource
    public var cellModelArray: [TableViewCellProvider] = []
    
    public weak var adapterDelegate: TableViewAdapterDelegate?
    
    private weak var _tableView: UITableView?
    
    private var _delegateProxy: TableViewDelegateProxy?
    private var _dataSourceProxy: TableViewDataSourceProxy?
    
    private weak var _tableViewDelegate: UITableViewDelegate?
    
    /// 传入tableView的Delegate
    public weak var tableViewDelegate: UITableViewDelegate? {
        set {
            if !(_tableViewDelegate?.isEqual(newValue) ?? false) {
                _tableViewDelegate = newValue
                updateDelegate()
            }
        }
        get {
            return _tableViewDelegate!
        }
    }
    
    private weak var _tableViewDataSource: UITableViewDelegate?
    
    /// 传入tableView的DataSource
    public weak var tableViewDataSource: UITableViewDelegate? {
        set {
            if !(_tableViewDataSource?.isEqual(newValue) ?? false) {
                _tableViewDataSource = newValue
                updateDataSource()
            }
        }
        get {
            return _tableViewDataSource!
        }
    }
    
    private func updateDelegate() {
        _tableView?.delegate = nil
        if _tableViewDelegate != nil {
            _delegateProxy = TableViewDelegateProxy.init(with: _tableViewDelegate, for: self)
        }
        _tableView?.delegate = _delegateProxy == nil ? self : _delegateProxy
    }
    
    private func updateDataSource() {
        _tableView?.dataSource = nil
        if _tableViewDataSource != nil {
            _dataSourceProxy = TableViewDataSourceProxy.init(with: _tableViewDataSource, for: self)
        }
        _tableView?.dataSource = _dataSourceProxy == nil ? self : _dataSourceProxy
    }
    
    required public init(with tableView: UITableView, useSection: Bool = false) {
        super.init()
        self.useSection = useSection
        _tableView = tableView
        _tableView?.estimatedRowHeight = 0
        _tableView?.estimatedSectionHeaderHeight = 0
        _tableView?.estimatedSectionFooterHeight = 0
        updateDataSource()
        updateDelegate()
    }
    
    public func reloadData() {
        _tableView?.reloadData()
    }
    
    public func reloadRowsData(by array: [TableViewCellProvider]) {
        cellModelArray = array
        _tableView?.reloadData()
    }
    
    public func reloadSectionsData(by array: [[TableViewCellProvider]]) {
        useSection = true
        sectionCellModelArray = array
        _tableView?.reloadData()
    }
    
}

extension TableViewAdapter: UITableViewDelegate, UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return useSection ? sectionCellModelArray.count : 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return useSection ? sectionCellModelArray[section].count : cellModelArray.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = useSection ? sectionCellModelArray[indexPath.section][indexPath.row] : cellModelArray[indexPath.row]
        var cell = tableView.dequeueReusableCell(withIdentifier: model.cellClassName())
        if cell == nil {
            let appName = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
            let cellType = NSClassFromString(appName + "." + model.cellClassName()) as! UITableViewCell.Type
            cell = cellType.init(style: .default, reuseIdentifier: model.cellClassName())
        }
        adapterDelegate?.tableViewCell(cell!, willUpdateRowAt: indexPath)
        (cell as! TableViewCellDataReceiver).updateCell(with: model)
        adapterDelegate?.tableViewCell(cell!, didUpdateRowAt: indexPath)
        return cell!
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return useSection ? sectionCellModelArray[indexPath.section][indexPath.row].cellHeight() : cellModelArray[indexPath.row].cellHeight()
    }
    
}
