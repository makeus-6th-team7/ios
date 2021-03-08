//
//  ViewController.swift
//  MakeUs6th
//
//  Created by miori Lee on 2021/02/15.
//

import UIKit
import SnapKit

class ViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        btnSetting()
    }
    
    
}

extension ViewController {
    func btnSetting() {
        let dismissButton = UIButton()
        self.view.addSubview(dismissButton)
        dismissButton.setTitle("뒤로가기/닫기", for: .normal)
        dismissButton.setTitleColor(.systemBlue, for: .normal)
        dismissButton.snp.makeConstraints { $0.center.equalToSuperview()
        }
    }
}

