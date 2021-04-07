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
        $0.text = "안녕하세요."
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 26)
    }
    
    let appNameLabel = UILabel().then {
        $0.text = "심사숙소"
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 26)
    }
    
    let underlineView = UIView().then {
        $0.backgroundColor = .mainGreen
    }
    
    let lastLabel = UILabel().then {
        $0.text = "입니다 :)"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 26)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
        _ = [mainLabel,underlineView,lastLabel].map { self.view.addSubview($0)}
        _ = [appNameLabel].map {self.underlineView.addSubview($0)}
        bindConstraints()
    }

}

extension FirstViewController {
    
    private func bindConstraints(){
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(130)
            $0.leading.equalTo(view.snp.leading).offset(30)
        }
        
        appNameLabel.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(10)
            $0.leading.equalTo(mainLabel)
        }
        
        underlineView.snp.makeConstraints {
            $0.top.equalTo(appNameLabel.snp.top).offset(20)
            $0.leading.equalTo(appNameLabel).offset(-3)
            $0.trailing.equalTo(appNameLabel).offset(3)
            $0.height.equalTo(10)
        }
        
        lastLabel.snp.makeConstraints {
            $0.top.equalTo(appNameLabel)
            $0.leading.equalTo(appNameLabel.snp.trailing).offset(5)
        }
    }
}
        
