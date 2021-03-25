//
//  PopularMainViewController.swift
//  MakeUs6th
//
//  Created by miori Lee on 2021/03/23.
//

import UIKit
import SnapKit
import Then

class PopularMainViewController: UIViewController {
    
    let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
    }
    let contentView = UIView()
    
    
    let view1 = UIView().then {
        $0.backgroundColor = .white
    }
    
    let title1 = UILabel().then {
        $0.text = "인기 해시태그"
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 14)
    }
    
    let hashtagCV = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        // 좌우 여백 없애
        layout.minimumLineSpacing = 4
        
        $0.backgroundColor = .none
        $0.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
        // tag
        $0.tag = 0
    }
    
    let view2 = UIView().then {
        $0.backgroundColor = .white
    }
    
    let title2 = UILabel().then {
        $0.text = "인기 피드"
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 14)
    }
    
    let btn1 = UIButton().then {
        $0.setImage(UIImage(named: "shape1"), for: .normal)
        $0.setImage(UIImage(named: "shape1c"), for: .selected)
        $0.tag = 0
        $0.isSelected = true
    }
    
    let btn2 = UIButton().then {
        $0.setImage(UIImage(named: "shape2"), for: .normal)
        $0.setImage(UIImage(named: "shape2c"), for: .selected)
        $0.tag = 1
        $0.isSelected = false
    }
    
    
    let view3 = UIView().then {
        $0.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.addSubview(scrollView) // 메인뷰에
        scrollView.addSubview(contentView)
        scrollView.delegate = self
        _ = [view1, view2, view3].map { self.contentView.addSubview($0)}
        _ = [title1,hashtagCV].map {self.view1.addSubview($0)}
        _ = [title2,btn1,btn2].map {self.view2.addSubview($0)}
        
        bindConstraints()
        //        setUpCollecionView()
        addContainVC(myvc: BingoViewController())
        
        _ = [btn1,btn2].map {$0.addTarget(self, action: #selector(didTapLook), for: .touchUpInside)}
        
    }
    
    
}

// MARK: - Snapkit autolayout
extension PopularMainViewController {
    
    private func bindConstraints(){
        
        scrollView.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalToSuperview()
            //make.edges.equalToSuperview() // 스크롤뷰가 표현될 영역
        }
        
        contentView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.centerX.top.bottom.equalToSuperview()
        }
        
        view1.snp.makeConstraints { (make) in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(200)
        }
        
        title1.snp.makeConstraints {
            $0.top.equalTo(view1).offset(8)
            $0.leading.equalTo(view1).offset(16)
        }
        
        view2.snp.makeConstraints { (make) in
            make.top.equalTo(view1.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(32)
        }
        
        title2.snp.makeConstraints {
            $0.top.equalTo(view2).offset(8)
            $0.leading.equalTo(view2).offset(16)
        }
        
        btn1.snp.makeConstraints {
            $0.centerX.equalTo(title2)
            $0.trailing.equalToSuperview().offset(-44)
        }

        
        btn2.snp.makeConstraints {
            $0.top.equalTo(btn1)
            $0.trailing.equalToSuperview().offset(-18)
        }
        
        view3.snp.makeConstraints { (make) in
            
            make.top.equalTo(view2.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(scrollView)
            make.bottom.equalToSuperview() // 이것이 중요함
        }
    }
}


extension PopularMainViewController : UIScrollViewDelegate {
    internal func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("hello")
        print(scrollView.contentOffset.y )
        print( view2.frame.minY )
        if scrollView.contentOffset.y >= view2.frame.minY {
            scrollView.isScrollEnabled = true
            view2.frame = CGRect(x: 0 , y: 0, width: self.view.frame.width, height: 32)
            view3.frame = CGRect(x: 0 , y: 32, width: self.view.frame.width, height: scrollView.frame.size.height)
            self.scrollView.contentOffset = CGPoint(x:0, y:0)
        } else if scrollView.contentOffset.y <= 0  {
            //print("ddddd")
            scrollView.isScrollEnabled = true
            let view1_y_pos = view1.frame.origin.y + view1.frame.height
            view2.frame = CGRect(x: 0 , y:view1_y_pos, width: self.view.frame.width, height: 32)
            view3.frame = CGRect(x: 0 , y: view2.frame.origin.y + view2.frame.height, width: self.view.frame.width, height: scrollView.frame.size.height)
            self.scrollView.contentOffset = CGPoint(x:0, y:0)
        }
    }
}

//extension PopularMainViewController : UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if scrollView.contentOffset.y > view2.frame.minY {
//            view2.frame = CGRect(x:0, y: 0)
//        } else {
//            view2.frame.height = 32
//        }
//    }
//}

extension PopularMainViewController {
    func addContainVC(myvc : UIViewController){
        // Left View Controller 생성
        let leftVC = myvc
        // Left View Controller를 Child View Controller로 지정
        self.addChild(leftVC)
        
        // subview 날리기
        view3.subviews.forEach({ $0.removeFromSuperview() }) // this gets things done

        view3.addSubview((leftVC.view)!)
        leftVC.view.frame = view3.bounds
        // 이제 Left View Controller가 Container View Controller 앞으로 올라왔기 때문에 didmove(toParent:)를 실행
        leftVC.didMove(toParent: self)

    }
}


extension PopularMainViewController {
    
    @objc
    func didTapLook(btn : UIButton) {
        if btn.tag == 0 {
            btn.isSelected = true
            btn2.isSelected = false
            addContainVC(myvc: BingoViewController())
        } else {
            btn.isSelected = true
            btn1.isSelected = false
            addContainVC(myvc: UploadViewController())
        }
     }
}
