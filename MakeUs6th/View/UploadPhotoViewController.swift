//
//  UploadPhotoViewController.swift
//  MakeUs6th
//
//  Created by miori Lee on 2021/03/16.
//

import UIKit
import SnapKit
import Then

class UploadPhotoViewController: BaseViewController {
    
    
    let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
    }
    
    let progressView = UIProgressView().then {
        $0.progressViewStyle = .bar
        $0.setProgress(0.5, animated: true)
        $0.trackTintColor = .customGray
        $0.tintColor = .mainGreen
    }
    
    
    // 스크롤뷰
    //    let scrollView = UIScrollView().then {
    //        $0.showsVerticalScrollIndicator = false
    //    }
    let contentView = UIView()
    
    let view1 = UIView().then {
        $0.backgroundColor = .white
    }
    
    let title1 = UILabel().then {
        $0.text = "숙소 이름2"
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 14)
    }
    
    let ssNameTF = UITextField().then {
        $0.borderStyle = .none
        $0.textAlignment = .left
        $0.textColor = .customGray
        $0.placeholder = "숙소 이름을 적어주세요"
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.becomeFirstResponder()
    }
    
    let underLineView = UIView().then {
        $0.backgroundColor = .bwg3
        $0.borderWidth = 0
    }
    
    let photoLabel = UILabel().then {
        $0.text = "업로드한 사진"
        $0.textColor = .bwg6
        $0.font = UIFont.systemFont(ofSize: 14)
    }
    
    
    let imagePickController = UIImagePickerController()
    
    let view2 = UIView().then {
        $0.backgroundColor = .blue
    }
    
    let view3 = UIView().then {
        $0.backgroundColor = .red
    }
    
    //    override func viewDidLayoutSubviews() {
    //        ssNameTF.setUnderLine()
    //    }
    
    override func viewDidLoad() {
        
        setNavi()
        
        self.view.backgroundColor = .white
        
        // 네비게이션 바 타이틀
        self.navigationItem.title = "업로드하기"
        
        // MARK:- view 구조
        /*
         - scroll
         - content
         - view 1
         - ...
         - view 2 ..
         - progress
         */
        self.view.addSubview(scrollView)
        self.view.addSubview(progressView)
        scrollView.addSubview(contentView)
        
        _ = [view1, view2, view3].map { self.contentView.addSubview($0)}
        _ = [title1,ssNameTF,underLineView,photoLabel].map {self.view1.addSubview($0)}
        
        bindConstraints()
    }
}

// MARK: - Snapkit autolayout
extension UploadPhotoViewController {
    
    private func bindConstraints(){
        
        
        scrollView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
        
        progressView.snp.makeConstraints { (make) in
            make.bottom.equalTo(scrollView.snp.bottom)
            make.leading.trailing.equalTo(scrollView)
            make.height.equalTo(6)
        }
        
        contentView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.centerX.top.bottom.equalToSuperview()
        }
        
        view1.snp.makeConstraints { (make) in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(300)
        }
        
        title1.snp.makeConstraints {
            $0.top.equalTo(view1).offset(8)
            $0.leading.equalTo(view1).offset(16)
        }
        
        ssNameTF.snp.makeConstraints {
            $0.top.equalTo(title1.snp.bottom).offset(16)
            $0.leading.equalTo(title1)
            $0.trailing.equalTo(view1).offset(-16)
        }
        
        underLineView.snp.makeConstraints {
            $0.top.equalTo(ssNameTF.snp.bottom).offset(8)
            $0.leading.trailing.equalTo(ssNameTF)
            $0.height.equalTo(1)
        }
        
        photoLabel.snp.makeConstraints {
            $0.top.equalTo(underLineView.snp.bottom).offset(32)
            $0.leading.equalTo(underLineView)
        }
        
        view2.snp.makeConstraints { (make) in
            
            make.top.equalTo(view1.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(300)
        }
        
        view3.snp.makeConstraints { (make) in
            
            make.top.equalTo(view2.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(300)
            make.bottom.equalToSuperview() // 이것이 중요함
        }
    }
}



