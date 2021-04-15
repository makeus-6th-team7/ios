//
//  SetNameViewController.swift
//  MakeUs6th
//
//  Created by miori Lee on 2021/04/12.
//

import UIKit
import SnapKit
import Then

class SetNameViewController: BaseViewController {
    
    let titleLabel = UILabel().then {
        $0.text = "심사숙소에서 사용할 닉네임을 정해주세요."
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    let subLabel = UILabel().then {
        $0.text = "영문 / 숫자 포함 8자 이내 , 확인 후 변경 불가"
        $0.textColor = .bwg7
        $0.font = UIFont.systemFont(ofSize: 12)
    }
    
    let confirmBtn = UIButton().then {
        $0.backgroundColor = .bwg5
        $0.setTitle("완료", for: .normal)
        $0.tintColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        _ = [titleLabel,confirmBtn,subLabel].map { self.view.addSubview($0)}
        bindConstraints()
        
        confirmBtn.addTarget(self, action: #selector(didTapConfirm), for: .touchUpInside)
    }
}

extension SetNameViewController {
    
    private func bindConstraints(){
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(88)
            $0.leading.equalToSuperview().offset(16)
        }
        confirmBtn.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(76)
        }
        subLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel)
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
        }
    }
}

extension SetNameViewController {
    
    @objc func didTapConfirm() {
        self.changeRootViewController(UINavigationController(rootViewController: HomeMainViewController()))
    }
}