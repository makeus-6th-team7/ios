//
//  HomeViewController.swift
//  MakeUs6th
//
//  Created by miori Lee on 2021/03/08.
//

import UIKit
import SnapKit
import Then

class HomeViewController: BaseViewController {
    
    // 스크롤뷰
    let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
    }
    let contentView = UIView()
    
    let topCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        // 좌우 여백 없애
        layout.minimumLineSpacing = 0
        
        $0.backgroundColor = .none
        $0.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
        // 페이징 가능
        $0.isPagingEnabled = true
    }
    
    let pageControl = UIPageControl(frame: .zero).then {
        $0.currentPage = 0
        $0.tintColor = UIColor.gray
        $0.pageIndicatorTintColor = UIColor.gray
        $0.currentPageIndicatorTintColor = UIColor.mainGreen
        $0.numberOfPages = 3
    }
    
    let view1 = UIView().then {
        $0.backgroundColor = .white
    }
    
    let titleLabel = UILabel().then {
        $0.textColor = .black
        $0.text = "서울 TOP5 숙소"
        $0.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    let subLabel = UILabel().then {
        $0.textColor = .customGray
        $0.text = "지금 검색이 가장 많은 숙소는?!"
        $0.font = UIFont.boldSystemFont(ofSize: 12)
    }
    let view2 = UIView().then {
        $0.backgroundColor = .black
    }
    let view3 = UIView().then {
        $0.backgroundColor = .blue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 네비게이션 바 타이틀
        self.navigationItem.title = "심사숙소"
        
        self.view.addSubview(scrollView) // 메인뷰에
        scrollView.addSubview(contentView)
        _ = [topCollectionView, pageControl, view1, view2, view3].map { self.contentView.addSubview($0)}
        _ = [titleLabel,subLabel].map {self.view1.addSubview($0)}
        //view1.addSubview(titleLabel)
        
        bindConstraints()
        setUpCollecionView()
        
    }
}

// MARK: - Snapkit autolayout
extension HomeViewController {
    
    private func bindConstraints(){
        
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview() // 스크롤뷰가 표현될 영역
        }
        
        contentView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.centerX.top.bottom.equalToSuperview()
        }
        
        topCollectionView.snp.makeConstraints { (make) in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(192)
        }
        
        pageControl.snp.makeConstraints { (make) in
            make.top.equalTo(topCollectionView.snp.bottom).offset(8)
            make.centerX.equalTo(topCollectionView)
            
        }
        
        view1.snp.makeConstraints { (make) in
            make.top.equalTo(pageControl.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(300)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view1.snp.top)
            make.leading.equalTo(view1.snp.leading).offset(16)
        }
        
        subLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.leading.equalTo(titleLabel)
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
    
    private func setUpCollecionView () {
        topCollectionView.delegate = self
        topCollectionView.dataSource = self
        topCollectionView.register(HomeTopCollectionViewCell.self, forCellWithReuseIdentifier: HomeTopCollectionViewCell.registerId)
    }
}

// MARK: - Collection view delegate, datsoure
extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeTopCollectionViewCell.registerId, for: indexPath) as? HomeTopCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
    
    // MARK: - collection view 와 page control 연결
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.x
        let width = scrollView.frame.width
        let horizontalCenter = width / 2
        
        pageControl.currentPage = Int(offSet + horizontalCenter) / Int(width)
    }
}

// MARK: - Collection view delegateflowlayout (cell 크기)
extension HomeViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = CGSize()
        
        let c_width = collectionView.frame.width
        let c_size = CGSize(width: c_width, height: 192)
        size = c_size
        
        return size
    }
}
