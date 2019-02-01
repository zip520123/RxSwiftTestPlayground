import UIKit
import PlaygroundSupport
import RxSwift
import RxCocoa
import RxDataSources
//import AppFramework
struct CustomData {
    var anInt : Int
    var aString : String
    var aCGPoint : CGPoint
}
struct SectionOfCustomData {
    var header : String
    var items : [Item]
}
extension SectionOfCustomData : SectionModelType {
    typealias Item = CustomData
    init(original: SectionOfCustomData, items: [Item]) {
        self = original
        self.items = items
    }
}
class TableVC : UIViewController ,UITableViewDelegate{
    var disposeBag = DisposeBag()
    var tableView = UITableView()
    var itemSubject = ReplaySubject<String>.create(bufferSize: 0)
    var count = 0
    let dataSource = RxTableViewSectionedReloadDataSource<SectionOfCustomData>(
        configureCell: { (dataSource, tableView, indexPath, item) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = "Item \(item.anInt): \(item.aString) - \(item.aCGPoint.x):\(item.aCGPoint.y)"
            return cell
            }
    )
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//        let items = Observable.just((0..<20).map{"\($0)"})
//        items.bind(to: tableView.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self)){(row, element, cell) in
//            cell.textLabel?.text = "\(row) \(element)"
//        }.disposed(by: disposeBag)
        
        let sections = [SectionOfCustomData(header: "first Section", items: [CustomData(anInt: 0, aString: "Hello", aCGPoint: CGPoint.zero),
                                                                            CustomData(anInt: 1, aString: "bb", aCGPoint: CGPoint(x: 1, y: 1))]),
            			SectionOfCustomData(header: "Section section", items: [CustomData(anInt: 2, aString: "world", aCGPoint: CGPoint.zero)])]
        
        Observable.just(sections).bind(to: tableView.rx.items(dataSource: sections)).disposed(by: disposeBag)
//        itemSubject.asObserver().bind(to: tableView.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self)){(row, element, cell) in
//            cell.textLabel?.text = "\(row) \(element)"
//            }.disposed(by: disposeBag)
        

        tableView.rx.modelSelected(String.self).subscribe({ value in
            DefaultWireframe.presentAlert("value: \(value)")
        }).disposed(by: disposeBag)
        tableView.rx.itemAccessoryButtonTapped.subscribe(onNext: { indexPath in
            DefaultWireframe.presentAlert("Tapped Detail @ \(indexPath.section),\(indexPath.row)")
        }).disposed(by: disposeBag)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        let barItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: nil, action: nil)
        barItem.rx.tap.subscribe {[weak self] (_) in
            guard let self = self else {return}
            self.count += 1
            self.itemSubject.onNext("\(self.count)")
            
        }
        navigationItem.setLeftBarButton(barItem, animated: false)
    }
    
}
protocol Wireframe {
//    func open(url: URL)
    func promptFor<Action : CustomStringConvertible>(_ message: String, cancelAciton: Action, action:[Action])-> Observable<Action>
}
class DefaultWireframe : Wireframe{
    static let shared = DefaultWireframe()
    #if os(iOS)
    private static func rootViewController() -> UIViewController {
        // cheating, I know
        return UIApplication.shared.keyWindow!.rootViewController!
    }
    #endif
    
    static func presentAlert(_ message: String) {
        #if os(iOS)
        let alertView = UIAlertController(title: "RxExample", message: message, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "OK", style: .cancel) { _ in
        })
        rootViewController().present(alertView, animated: true, completion: nil)
        #endif
    }
    func promptFor<Action : CustomStringConvertible>(_ message: String, cancelAciton: Action, action actions:[Action])-> Observable<Action>{
        return Observable.create({ (observer) -> Disposable in
            let alert = UIAlertController(title: "rx", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: cancelAciton.description, style: .cancel, handler: { (_) in
                observer.on(.next(cancelAciton))
            }))
            for action in actions {
                alert.addAction(UIAlertAction(title: action.description, style: .default, handler: { (_) in
                    observer.on(.next(action))
                }))
            }
            UIApplication.shared.keyWindow!.rootViewController!.present(alert, animated: true, completion: nil)
            return Disposables.create{
                alert.dismiss(animated: false, completion: nil)
            }
            
        })
    }

}



let vc = TableVC()
let nvc = UINavigationController(rootViewController: vc)



vc.view.backgroundColor = UIColor.white
PlaygroundPage.current.liveView = nvc
