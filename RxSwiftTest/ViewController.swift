//
//  ViewController.swift
//  RxSwiftTest
//
//  Created by Woody on 2018/9/19.
//  Copyright © 2018年 Woody. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
class ViewController: UIViewController {
	
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var textField2: UITextField!
    
    @IBOutlet weak var textField3: UITextField!
    
    @IBOutlet weak var label: UILabel!
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        Observable.combineLatest(textField.rx.text.orEmpty , textField2.rx.text.orEmpty , textField3.rx.text.orEmpty){
            t1, t2, t3 -> Int in
            return (Int(t1) ?? 0) + (Int(t2) ?? 0) + (Int(t3) ?? 0)
            }.map{$0.description}.bind(to:label.rx.text).disposed(by:disposeBag)
    }

}

