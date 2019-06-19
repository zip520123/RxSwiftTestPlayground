import RxCocoa
import RxSwift
import UIKit
import PlaygroundSupport
let gradient = CAGradientLayer()
gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
gradient.endPoint = CGPoint(x: 0.5, y: 1)
let whiteColor = UIColor.white
gradient.colors = [whiteColor.withAlphaComponent(0.0).cgColor,  whiteColor.withAlphaComponent(1.0).cgColor]
gradient.locations = [NSNumber(value: 0.0),NSNumber(value: 1.0)]
gradient.frame = CGRect(x: 0, y: 140 - 26 , width: 95, height: 26)

let view = UIView(frame: CGRect(x: 0, y: 0, width: 95, height: 140))
view.backgroundColor = UIColor.red
view.layer.insertSublayer(gradient, at: 0)
PlaygroundPage.current.liveView = view
