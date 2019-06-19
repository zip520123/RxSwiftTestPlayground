
import UIKit
import SnapKit
import PlaygroundSupport
let vc = UIViewController()
vc.view.backgroundColor = UIColor.white
let view = UIView()
vc.view.addSubview(view)
view.backgroundColor = UIColor.lightGray
view.snp.makeConstraints { (make) in
  make.center.equalToSuperview()
  make.height.width.equalTo(300)
}
fileprivate func setShadow(_ view: UIView) {
  view.layer.masksToBounds = false
  view.layer.shadowOffset = CGSize(width: 0, height: 0)
  view.layer.shadowRadius = 2
  view.layer.shadowOpacity = 0.5
}

setShadow(view)
PlaygroundPage.current.liveView = vc

