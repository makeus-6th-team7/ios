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
    
    let subLabel = UILabel().then {
        $0.text = "심사숙소로 숙소 후기를 한 번에 확인해보세요."
        $0.textColor = .bwg7
        $0.font = UIFont.systemFont(ofSize: 14)
    }
    
    let imgView = UIImageView().then {
        $0.image = (#imageLiteral(resourceName: "main"))
        $0.contentMode = .scaleToFill
        //$0.clipsToBounds = false
    }
    
    let divisonView = UIView().then {
        $0.backgroundColor = .bwg2
    }
    
    let signUpLabel = UILabel().then {
        $0.text = "쉽고 빠른 회원가입!"
        $0.font = UIFont.systemFont(ofSize: 11)
        $0.textColor = .bwg7
    }
    
    let kakaoCircle = UIView().then {
        $0.backgroundColor = UIColor(red: 0.996, green: 0.898, blue: 0, alpha: 1)
        $0.cornerRadius = 22
        $0.tag = 0
    }
    
    let kakaoIV = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "kakao")
        $0.contentMode = .scaleToFill
    }
    
    let appleCircle = UIView().then {
        $0.backgroundColor = .black
        $0.cornerRadius = 22
        $0.tag = 1
    }
    
    let appleIV = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "apple")
        $0.contentMode = .scaleToFill
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
        _ = [mainLabel,underlineView,lastLabel,subLabel,imgView,divisonView,signUpLabel,kakaoCircle,appleCircle].map { self.view.addSubview($0)}
        _ = [appNameLabel].map {self.underlineView.addSubview($0)}
        _ = [kakaoIV].map {self.kakaoCircle.addSubview($0)}
        _ = [appleIV].map {self.appleCircle.addSubview($0)}
        _ = [kakaoCircle,appleCircle].map {self.didTapLogin($0)}
        bindConstraints()
    }

}

extension FirstViewController {
    
    private func bindConstraints(){
        mainLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(130)
            $0.leading.equalToSuperview().offset(30)
        }
        
        appNameLabel.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(5)
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
        
        subLabel.snp.makeConstraints {
            $0.top.equalTo(underlineView.snp.bottom).offset(18)
            $0.leading.equalTo(mainLabel)
        }
        
        imgView.snp.makeConstraints {
            $0.top.equalTo(subLabel.snp.bottom).offset(35)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(divisonView.snp.top).offset(-30)
        }
        
        divisonView.snp.makeConstraints {
            $0.bottom.equalTo(view.snp.bottom).offset(-141)
            $0.height.equalTo(1)
            $0.leading.trailing.equalToSuperview()
        }
        
        signUpLabel.snp.makeConstraints {
            $0.top.equalTo(divisonView.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        kakaoCircle.snp.makeConstraints {
            $0.top.equalTo(signUpLabel.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(115)
            $0.width.equalTo(44)
            $0.height.equalTo(44)
        }
        
        kakaoIV.snp.makeConstraints {
            $0.top.equalTo(kakaoCircle.snp.top).offset(12)
            $0.leading.equalTo(kakaoCircle.snp.leading).offset(10)
        }
        
        appleCircle.snp.makeConstraints {
            $0.top.equalTo(signUpLabel.snp.bottom).offset(24)
            $0.trailing.equalToSuperview().offset(-115)
            $0.width.equalTo(44)
            $0.height.equalTo(44)
        }
        
        appleIV.snp.makeConstraints {
            $0.top.equalTo(appleCircle.snp.top).offset(11)
            $0.leading.equalTo(appleCircle.snp.leading).offset(14)
        }
    }
    
    private func didTapLogin(_ inputView : UIView) {
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(checkAction))
        //self.myView.addGestureRecognizer(gesture)
        if inputView.tag == 0 {
            print("tapped")
            kakaoCircle.addGestureRecognizer(gesture)
        } else if inputView.tag == 1 {
            appleCircle.addGestureRecognizer(gesture)
        }
    }
}
        
extension FirstViewController {
    @objc func checkAction(sender : UITapGestureRecognizer) {
        // Do what you want
        self.changeRootViewController(UINavigationController(rootViewController: HomeMainViewController()))
    }
}
