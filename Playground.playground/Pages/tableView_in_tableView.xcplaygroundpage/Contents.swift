import UIKit
import RxCocoa
import RxSwift
import SnapKit
import PlaygroundSupport
let disposeBag = DisposeBag()
let vc = UIViewController()
vc.view.backgroundColor = UIColor.white
PlaygroundPage.current.liveView = vc

let tableview = UITableView()
vc.view.addSubview(tableview)

tableview.snp.makeConstraints { (make) -> Void in
  make.top.equalToSuperview().offset(20)
  make.left.equalToSuperview().offset(20)
  make.bottom.equalToSuperview().offset(-20)
  make.right.equalToSuperview().offset(-20)
}

tableview.backgroundColor = UIColor.red
tableview.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
let items = Observable.just(
  (0..<20).map { "\($0)" }
)
items
  .bind(to: tableview.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self)) { (row, element, cell) in
    cell.textLabel?.text = "\(element) @ row \(row)"
  }
  .disposed(by: disposeBag)

tableview.rx.
