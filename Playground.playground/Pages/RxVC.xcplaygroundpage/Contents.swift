import RxCocoa
import RxSwift
import PlaygroundSupport
import UIKit
extension ObservableType {
//  func mapVoid() -> Observable<Void> {
//    return self.mapConst(())
//  }
  func mapConst<T>(_ value: T) -> Observable<T> {
    return self.map { _ in value }
  }
}
public extension Reactive where Base: UIViewController {

  var viewDidLoad: Signal<Void> {
    return base.rx.methodInvoked(#selector(UIViewController.viewDidLoad))
      .mapConst(())
      .asSignal(onErrorJustReturn: ())
  }
  var viewWillAppear: Signal<Bool> {
    return base.rx.methodInvoked(#selector(UIViewController.viewWillAppear(_:)))
      .map { $0[0] as! Bool }
      .asSignal(onErrorJustReturn: false)
  }

  var viewDidAppear: Signal<Bool> {
    return base.rx.methodInvoked(#selector(UIViewController.viewDidAppear(_:)))
      .map { $0[0] as! Bool }
      .asSignal(onErrorJustReturn: false)
  }

  var viewWillDisappear: Signal<Bool> {
    return base.rx.methodInvoked(#selector(UIViewController.viewWillDisappear(_:)))
      .map { $0[0] as! Bool }
      .asSignal(onErrorJustReturn: false)
  }

  var viewDidDisAppear: Signal<Bool> {
    return base.rx.methodInvoked(#selector(UIViewController.viewWillDisappear(_:)))
      .map { $0[0] as! Bool }
      .asSignal(onErrorJustReturn: false)
  }

}
let disposeBag = DisposeBag()
let vc = UIViewController()
vc.rx.viewDidLoad.emit(onNext: { (_) in
  print("viewDidLoad")
}).disposed(by: disposeBag)
PlaygroundPage.current.liveView = vc
vc.view.backgroundColor = .white
//vc.rx.viewDidLoad.subscribe(onNext: { (bool) in
//  print("viewDidLoad")
//}).disposed(by: disposeBag)
//vc.rx.viewWillAppear.subscribe(onNext: { (bool) in
//  print("viewWillAppear")
//}).disposed(by: disposeBag)

