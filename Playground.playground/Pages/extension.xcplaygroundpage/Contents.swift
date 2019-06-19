import Foundation
class A {
  func p1(){
    print(#function)
    binding()
  }

}
private extension A {
  func binding(){
    print(#function)
    bindingIn()
    bindingOut()
  }
  func bindingIn(){
    print(#function)
  }
  @objc func bindingOut(){
    print(#function)
  }

}
class B : A {

}
private extension B {
  override func bindingOut(){
    super.bindingOut()
    print(#function + "b")
  }
}

let b = B()
b.p1()
//b.p3()
