# YZTableViewAdapter

[![CI Status](https://img.shields.io/travis/qyz777/YZTableViewAdapter.svg?style=flat)](https://travis-ci.org/qyz777/YZTableViewAdapter)
[![Version](https://img.shields.io/cocoapods/v/YZTableViewAdapter.svg?style=flat)](https://cocoapods.org/pods/YZTableViewAdapter)
[![License](https://img.shields.io/cocoapods/l/YZTableViewAdapter.svg?style=flat)](https://cocoapods.org/pods/YZTableViewAdapter)
[![Platform](https://img.shields.io/cocoapods/p/YZTableViewAdapter.svg?style=flat)](https://cocoapods.org/pods/YZTableViewAdapter)

## Introduction

YZTableViewAdapter是一个用来快速组装多种Cell的轻量级工具

## Example

### 快速使用

#### 1. 实现TableViewCellProvider协议

你需要用一个类来计算cell需要的高度以及提供cell的类名

```swift
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
```

#### 2. 让你的Cell实现TableViewCellDataReceiver协议

```swift
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

```

#### 3. 组装不同的Cell提供给Adapter

```swift
adapter = TableViewAdapter.init(with: tableView)

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
```

### 使用Section

```swift
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
```

### 使用TableViewDelegate或TableViewDataSource

实现adapter的tableViewDelegate协议即可

```swift
adapter?.tableViewDelegate = self

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset)
    }
    
}
```

## Requirements

Swift >= 4.0

## Installation

YZTableViewAdapter is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'YZTableViewAdapter'
```

## Author

qyz777, qyizhong1998@gmail.com

## License

YZTableViewAdapter is available under the MIT license. See the LICENSE file for more info.
