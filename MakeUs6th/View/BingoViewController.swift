//
//  BingoViewController.swift
//  MakeUs6th
//
//  Created by miori Lee on 2021/03/24.
//

import UIKit
import SnapKit
import Then

class BingoViewController: UIViewController {
    
    let bingoCV = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        // 상하 여백
        layout.minimumLineSpacing = 2
        // 좌우 여백 (중요 이거 없으면 안됨)
        layout.minimumInteritemSpacing = 2
        
        $0.backgroundColor = .none
        $0.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        $0.showsHorizontalScrollIndicator = true
        $0.collectionViewLayout = layout
        // 페이징 불가능
        $0.isPagingEnabled = false
        // tag
        $0.tag = 0
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.addSubview(bingoCV) // 메인뷰에
        // Do any additional setup after loading the view.
        
        bindConstraints()
        setUpCollecionView()
    }
    
}

// MARK: - Snapkit autolayout
extension BingoViewController {
    
    private func bindConstraints(){
        
        bingoCV.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalToSuperview()
            //make.edges.equalToSuperview() // 스크롤뷰가 표현될 영역
        }
    }
    
    
    private func setUpCollecionView () {
        _ = [bingoCV].map { $0.delegate = self; $0.dataSource = self}
        
        bingoCV.register(HomeTopCollectionViewCell.self, forCellWithReuseIdentifier: HomeTopCollectionViewCell.registerId)
        
    }
}

// MARK: - Collection view delegate, datsoure
extension BingoViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        var cell = UICollectionViewCell()
        if collectionView.tag == 0 {
            guard let imageCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeTopCollectionViewCell.registerId, for: indexPath) as? HomeTopCollectionViewCell else {
                return UICollectionViewCell()
            }
            imageCell.imageView.image = #imageLiteral(resourceName: "example3")
            cell = imageCell
        }
        return cell
    }

}


// MARK: - Collection view delegateflowlayout (cell 크기)
extension BingoViewController : UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = CGSize()

        if collectionView.tag == 0 {

            let itemspacing : CGFloat = 2
            let c_width = (collectionView.frame.width - itemspacing * 2) / 3
            //let c_width = (collectionView.frame.width-4)/3
            let c_size = CGSize(width: c_width, height: c_width)
            size = c_size
        }

        return size
    }
}
