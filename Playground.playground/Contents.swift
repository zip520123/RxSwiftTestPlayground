import UIKit
import PlaygroundSupport
import RxSwift
import RxCocoa

import AppFramework

extension ObservableType {
    func addObserver(_ s: String) -> Disposable {
        return subscribe({ (e) in
            print("id:",s,e)
        })
    }
}

//let vc = UIViewController()
//let nvc = UINavigationController(rootViewController: vc)
//vc.view.backgroundColor = UIColor.white
//PlaygroundPage.current.liveView = nvc
let disposeBag = DisposeBag()
let subject = PublishRelay<String>()

subject.subscribe({ (e) in
        switch e {
        case .next(let s):
            print("next:\(s)")
        case .error(let error):
            print("Error:\(error)")
        case .completed:
            print("completed")
        }
    }
    ).disposed(by: disposeBag)
    
subject.asSingle().subscribe { (event) in
    switch event {
    case .success(let s):
        print("success:\(s)")
    case .error(let error):
        print("Error:\(error)")
    }
}.disposed(by: disposeBag)


//subject.accept("🐶")
//let subject = PublishRelay<String>()

//getRepo("ReactiveX/RxSwift")
//    .subscribe({ event in
//        switch event {
//        case .success(let json):
//            print("JSON: ", json)
//        case .error(let error):
//            print("Error: ", error)
//        }
//    })
//    .disposed(by: disposeBag)


//let s = Single<String>.create { (<#@escaping (SingleEvent<String>) -> Void#>) -> Disposable in
//
//}
//accept("🐱")
//subject.accept("🐶")
//subject.addObserver("2").disposed(by: disposeBag)
//
//subject.accept("🅰️")
//subject.accept("🅱️")

//let isLoading : Signal<Bool>


