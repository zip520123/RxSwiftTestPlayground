import UIKit
import RxSwift
import RxCocoa
import SnapKit
import PlaygroundSupport
class Cell: UITableViewCell {
  let view = UIView()
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    addSubview(view)
    view.snp.makeConstraints { (make) in
      make.edges.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
      make.height.equalTo(40)
    }
//    view.backgroundColor = .red
  }
  required init?(coder aDecoder: NSCoder) {
    return nil
  }
}
class VC: UIViewController {
  let table = UITableView()
  let disposeBag = DisposeBag()
  override func viewDidLoad(){
    view = table
//    table.rowHeight = UITableView.automaticDimension
//    table.estimatedRowHeight = UITableView.automaticDimension
    table.register(Cell.self, forCellReuseIdentifier: String(describing: Cell.self))
    let items = Driver.just(
      (0..<20).map{"\($0)"}
    )
    items.drive(table.rx.items(cellIdentifier: String(describing: Cell.self), cellType: Cell.self)) { row, el, cell in
      cell.textLabel?.text = "\(el) @ row \(row)"
    }.disposed(by: disposeBag)

    table.rx.modelSelected(String.self)
      .subscribe(onNext: { (s) in
        print(s)
      }).disposed(by: disposeBag)
    table.rx.itemSelected.subscribe(onNext: {[weak self] (indexPath) in
      guard let self = self else {return}
      let cell = self.table.cellForRow(at: indexPath) as! Cell
      cell.view.snp.remakeConstraints { (make) in
        make.edges.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        make.height.equalTo(220)
      }
      cell.view.setNeedsLayout()
      self.table.beginUpdates()
      self.table.endUpdates()
      self.table.deselectRow(at: indexPath, animated: true)
    }).disposed(by: disposeBag)
  }

}

PlaygroundPage.current.liveView = VC()
