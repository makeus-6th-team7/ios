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
        // tag
        $0.tag = 0
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
    
    let secondCV = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        // 좌우 여백 없애
        layout.minimumLineSpacing = 4
        
        $0.backgroundColor = .none
        $0.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
        // tag
        $0.tag = 1
    }
    
    let midLeadingView = UIView().then {
        $0.backgroundColor = .white
    }
    
    let midLeadingTitleLabel = UILabel().then {
        $0.text = "급상승 숙소는?"
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    let midLeadingSubLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.text = "심사숙소가 추천하는\n숙소는 어디일까요 :)"
        $0.textColor = .bwg6
        $0.font = UIFont.systemFont(ofSize: 12)
    }

    let thirdCV = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        // 좌우 여백 없애
        layout.minimumLineSpacing = 10
        
        $0.backgroundColor = .none
        $0.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
        // tag
        $0.tag = 2
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
        _ = [titleLabel,subLabel,secondCV,midLeadingView,thirdCV].map {self.view1.addSubview($0)}
        _ = [midLeadingTitleLabel,midLeadingSubLabel].map {self.midLeadingView.addSubview($0)}
        //view1.addSubview(titleLabel)
        
        bindConstraints()
        setUpCollecionView()
        
    }
}

// MARK: - Snapkit autolayout
extension HomeViewController {
    
    private func bindConstraints(){
        
        scrollView.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalToSuperview()
            //make.edges.equalToSuperview() // 스크롤뷰가 표현될 영역
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
            //make.height.equalTo(500)
            make.bottom.equalTo(thirdCV).offset(5)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view1.snp.top)
            make.leading.equalTo(view1.snp.leading).offset(16)
        }
        
        subLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.leading.equalTo(titleLabel)
        }
        
        secondCV.snp.makeConstraints {
            $0.top.equalTo(subLabel.snp.bottom).offset(16)
            $0.leading.equalTo(titleLabel)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(180)
        }
        
        midLeadingView.snp.makeConstraints {
            $0.top.equalTo(secondCV.snp.bottom).offset(32)
            $0.height.equalTo(210)
            $0.leading.equalTo(secondCV)
            $0.width.equalTo(150)
        }
        
        midLeadingTitleLabel.snp.makeConstraints {
            $0.top.leading.equalTo(midLeadingView)
        }
        
        midLeadingSubLabel.snp.makeConstraints {
            $0.top.equalTo(midLeadingTitleLabel.snp.bottom).offset(16)
            $0.leading.equalTo(midLeadingTitleLabel)
        }
        
        thirdCV.snp.makeConstraints {
            $0.top.equalTo(midLeadingView)
            $0.leading.equalTo(midLeadingView.snp.trailing).offset(4)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(230)
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
        _ = [topCollectionView,secondCV,thirdCV].map { $0.delegate = self; $0.dataSource = self}
        
        topCollectionView.register(HomeTopCollectionViewCell.self, forCellWithReuseIdentifier: HomeTopCollectionViewCell.registerId)
        
        secondCV.register(HomeMidCollectionViewCell.self, forCellWithReuseIdentifier: HomeMidCollectionViewCell.registerId)
        
        thirdCV.register(HomeMid2CollectionViewCell.self, forCellWithReuseIdentifier: HomeMid2CollectionViewCell.registerId)
        
    }
}

// MARK: - Collection view delegate, datsoure
extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 0:
            return 3
        case 1:
            return 3
        case 2:
            return 3
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        if collectionView.tag == 0 {
            guard let imageCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeTopCollectionViewCell.registerId, for: indexPath) as? HomeTopCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell = imageCell
        } else if collectionView.tag == 1 {
            guard let secondCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeMidCollectionViewCell.registerId, for: indexPath) as? HomeMidCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell = secondCell
        } else if collectionView.tag == 2 {
            guard let thirdCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeMid2CollectionViewCell.registerId, for: indexPath) as? HomeMid2CollectionViewCell else {
                return UICollectionViewCell()
            }
            cell = thirdCell
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
        
        if collectionView.tag == 0 {
            let c_width = collectionView.frame.width
            let c_size = CGSize(width: c_width, height: 192)
            size = c_size
        } else if collectionView.tag == 1 {
            //let c_width = 150
            let c_height = collectionView.frame
            let c_size = CGSize(width: 150, height: 176)
            size = c_size
        } else if collectionView.tag == 2 {
            //let c_width = 150
            let c_height = collectionView.frame.height
            let c_size = CGSize(width: 150, height: c_height)
            size = c_size
        }
        
        return size
    }
    
    
}
