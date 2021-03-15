//
//  UploadViewController.swift
//  MakeUs6th
//
//  Created by miori Lee on 2021/03/13.
//

import UIKit
import SnapKit
import Then

class UploadViewController : BaseViewController {
    
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
        $0.backgroundColor = .red
    }
    
    let view2 = UIView().then {
        $0.backgroundColor = .blue
    }
    
    let view3 = UIView().then {
        $0.backgroundColor = .red
    }
    
    
    override func viewDidLoad() {
        
        self.view.backgroundColor = .white
        
        self.navigationItem.title = "업로드하기"
        self.view.addSubview(scrollView)
        self.view.addSubview(progressView)// 메인뷰에
        scrollView.addSubview(contentView)
        _ = [view1, view2, view3].map { self.contentView.addSubview($0)}
        
        bindConstraints()
    }
}

// MARK: - Snapkit autolayout
extension UploadViewController {
    
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
