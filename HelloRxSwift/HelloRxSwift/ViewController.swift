//
//  ViewController.swift
//  HelloRxSwift
//
//  Created by Mohammad Azam on 3/23/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var valueLabel: UILabel!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.slider.rx.value

            .subscribe(onNext: {
                self.valueLabel.text = "\($0)"
            }).disposed(by: disposeBag)
        
    }


}

