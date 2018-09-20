//
//  VCforRx.swift
//  RxSwiftTest
//
//  Created by Woody on 2018/9/20.
//  Copyright © 2018年 Woody. All rights reserved.
//

import UIKit
import RxSwift
open class VCforRx: UIViewController {

    override open func viewDidLoad() {
        super.viewDidLoad()

        _ = Observable<String>.create { observerOfString in
            print("Observable created")
            observerOfString.on(.next("123"))
            observerOfString.on(.next("😉"))
            observerOfString.on(.completed)
            
            return Disposables.create()
            }
            .subscribe { event in
                print(event)
        }
    }


}
