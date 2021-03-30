//
//  FirstViewController.swift
//  MakeUs6th
//
//  Created by miori Lee on 2021/03/30.
//

import UIKit
import SnapKit
import Then

class FirstViewController: UIViewController {
    
    let mainLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.text = "안녕하세요.\n심사숙소입니다 :)"
        $0.textColor = .bwg6
        $0.font = UIFont.systemFont(ofSize: 12)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
