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
    
    let inputTF = UITextField().then {
        //$0.placeholder = "닉네임을 입력해주세요."
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.attributedPlaceholder = NSAttributedString(string:"닉네임을 입력해주세요.", attributes:[NSAttributedString.Key.foregroundColor: UIColor.bwg5])
    }
    
    let segLineView = UIView().then {
        $0.backgroundColor = UIColor(red: 0.905, green: 0.913, blue: 0.921, alpha: 1)
    }
    
    let confirmBtn = UIButton().then {
        $0.backgroundColor = .bwg5
        $0.setTitle("완료", for: .normal)
        $0.tintColor = .white
    }
    
    let repeatAlert = UILabel().then {
        $0.text = "다른 분이 사용하고 있는 닉네임이에요."
        $0.textColor = .alertRed
        $0.font = UIFont.systemFont(ofSize: 11)
        $0.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        _ = [titleLabel,confirmBtn,subLabel,inputTF,segLineView,repeatAlert].map { self.view.addSubview($0)}
        bindConstraints()
        
        inputTF.delegate = self
        
        confirmBtn.addTarget(self, action: #selector(didTapConfirm), for: .touchUpInside)
        inputTF.addTarget(self, action: #selector(didTFChanged), for: .editingChanged)
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
        inputTF.snp.makeConstraints {
            $0.leading.equalTo(titleLabel)
            $0.top.equalTo(subLabel.snp.bottom).offset(24)
        }
        segLineView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
            $0.top.equalTo(inputTF.snp.bottom).offset(8)
        }
        repeatAlert.snp.makeConstraints {
            $0.leading.equalTo(titleLabel)
            $0.top.equalTo(segLineView.snp.bottom).offset(8)
        }
    }
}

extension SetNameViewController {
    
    @objc func didTapConfirm() {
        repeatAlert.isHidden = true
        let input = NicknameInputModel(userId: inputTF.text ?? "")
        print("\(String(describing: Token.jwt!))")
        SetNicknameDataManager().postNickname(input, viewController: self)
        //self.changeRootViewController(UINavigationController(rootViewController: HomeMainViewController()))
    }
    
    @objc func didTFChanged() {
        confirmBtn.backgroundColor = .mainGreen
    }
}

extension SetNameViewController : UITextFieldDelegate {
    
    private func textFieldDidBeginEditing(textField: UITextField) -> Bool {
        if textField == inputTF {
            // myTextField was touched
            repeatAlert.isHidden = true
        }
        return true
    }
}

extension SetNameViewController {
    func didSuccess() {
        self.presentAlert(title: "🎉 가입완료 🎉", message: "\(String(describing: inputTF.text!))님, 환영합니다")
    }
    
    func alertRepeat() {
        self.repeatAlert.isHidden = false
    }
    
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
