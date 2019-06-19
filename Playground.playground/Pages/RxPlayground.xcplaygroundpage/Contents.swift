import RxCocoa
import RxSwift
import UIKit
import PlaygroundSupport
let disposeBag = DisposeBag()
let fetch = PublishRelay<Void>()

func input(_ list: [Int]){
  print(list)

  Observable.from(list)
    .flatMap { (i) -> Observable<Int> in
      if i % 3 == 0 {
        return Observable.just(i)
      }else {
        return Observable.error(ApiError.a)
      }
    }.subscribe {
      print($0)
  }
}
enum ApiError : Error {
  case a
  case b
  case c
}
let arr = Array(0...10)
input(arr)

