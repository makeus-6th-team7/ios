//
//  HomeMainViewController.swift
//  MakeUs6th
//
//  Created by miori Lee on 2021/03/19.
//

import UIKit

class HomeMainViewController: BaseViewController {
    
    var tabArr = ["홈","인기","최신"]
    var scrollIdx = 0
    
    let tabCV = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        // 좌우 여백 없애
        layout.minimumLineSpacing = 18
        
        $0.backgroundColor = .none
        //$0.layer.addBorder([.bottom], color: .bwg2, width: 1)
        $0.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
        // tag
        $0.tag = 0
    }
    
    let scrollView = UIScrollView().then {
        $0.isPagingEnabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    
        // MARK: - 네비게이션 바 타이틀에 로고 넣기
        //self.navigationItem.title = "심사숙소"
        let image = UIImage(named: "logo")
        let naviImageTitle = UIImageView(image: image)
        naviImageTitle.contentMode = .scaleAspectFit
        navigationItem.titleView = naviImageTitle
        
        _ = [tabCV,scrollView].map { self.view.addSubview($0)}
        
        tabCV.delegate = self
        tabCV.dataSource = self
        tabCV.register(TabCollectionViewCell.self, forCellWithReuseIdentifier: TabCollectionViewCell.registerId)
        
        scrollView.delegate = self
        self.scrollView.contentSize.width = self.view.frame.width * 3
        
        bindConstraints()
        addContainVC()
    }
    
}

// MARK: - Snapkit autolayout
extension HomeMainViewController {
    
    private func bindConstraints(){
        

        tabCV.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(45)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(tabCV.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            //$0.width.equalTo(self.view.frame.width * 3)
        }
        
    }
}

extension HomeMainViewController : UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        if collectionView.tag == 0 {
            guard let tabCell = collectionView.dequeueReusableCell(withReuseIdentifier: TabCollectionViewCell.registerId, for: indexPath) as? TabCollectionViewCell else {
                return UICollectionViewCell()
            }
            tabCell.menuLabel.text = tabArr[indexPath.row]
            if indexPath.item == 0 {
                tabCell.isSelected = true
                collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .init())
            }
            cell = tabCell
           
        }
        return cell
    }
    
    // MARK: 셀 눌렀을 때 스크롤
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        /*
         self.scrollView.setContentOffset(CGPoint.zero, animated: true)
         */
        if indexPath.row == 0 {
            self.scrollView.setContentOffset(CGPoint.zero, animated: true)
        } else if indexPath.row == 1 {
            self.scrollView.setContentOffset(CGPoint(x: self.scrollView.frame.width , y: 0), animated: true)
        } else {
            self.scrollView.setContentOffset(CGPoint(x: self.scrollView.frame.width*2 , y: 0), animated: true)
        }
    }
    
  
    
    // MARK: 스크롤뷰 페이징 인덱스
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //print("END Scrolling \(scrollView.contentOffset.x / scrollView.bounds.size.width)")
        let index = Int(scrollView.contentOffset.x / scrollView.bounds.size.width)
        scrollIdx = index
        print("index : \(index)")
        let indexPath = IndexPath(item: index, section: 0)
        tabCV.selectItem(at: indexPath, animated: true, scrollPosition: .left)
        collectionView(tabCV, didSelectItemAt: indexPath)
        
    }
    
}

extension HomeMainViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // MARK: tag 크기에 맞게 cell size
        let item = tabArr[indexPath.row]
        let width = item.size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .bold)]).width + 10
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        
    }
    
}

extension HomeMainViewController {
    func addContainVC(){
        // Left View Controller 생성
        let leftVC = HomeViewController()
        // Left View Controller를 Child View Controller로 지정
        self.addChild(leftVC)
        // Left View Controller의 View만 가져오기
        guard let leftVCView = leftVC.view else { return }
        // Left View Controller View의 Frame 지정
        leftVCView.frame = CGRect(x: 0, y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.height)
        // Scroll View에 Left View Controller의 View 넣기
        self.scrollView.addSubview(leftVCView)
        // 이제 Left View Controller가 Container View Controller 앞으로 올라왔기 때문에 didmove(toParent:)를 실행
        leftVC.didMove(toParent: self)
        
        // Right View Controller도 동일.
        let rightVC = PopularMainViewController()
        self.addChild(rightVC)
        guard let rightVCView = rightVC.view else { return }
        print("rerer:\(self.view.frame.width)")
        rightVCView.frame = CGRect(x: self.view.frame.width, y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.height)
        self.scrollView.addSubview(rightVCView)
        rightVC.didMove(toParent: self)
        
        // Right View Controller도 동일.
        let thirdVC = HomeViewController()
        self.addChild(thirdVC)
        guard let thirdVCView = thirdVC.view else { return }
        thirdVCView.frame = CGRect(x: self.view.frame.width*2, y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.height)
        self.scrollView.addSubview(thirdVCView)
        thirdVC.didMove(toParent: self)
        
    }
}
