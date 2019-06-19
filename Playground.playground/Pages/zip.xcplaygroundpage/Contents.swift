

import Foundation

let numbers = [3, 5, 9, 10 , 1]
let alphabeticNumbers = ["Three", "Five", "Nine", "Ten"]

let zipped = zip(alphabeticNumbers, numbers)

class A {
//  func p(){
//    print("A")
//  }
}
extension A {
  @objc func p() {
    print("Ae")
  }
}
class B : A {
  func p(){
    print("B")
  }
}

let b = B()
b.p()
