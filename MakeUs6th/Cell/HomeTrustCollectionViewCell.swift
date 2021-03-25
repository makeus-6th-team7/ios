//
//  HomeTrustCollectionViewCell.swift
//  MakeUs6th
//
//  Created by miori Lee on 2021/03/23.
//

import UIKit
import SnapKit
import Then

class HomeTrustCollectionViewCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    static let registerId = "\(HomeTrustCollectionViewCell.self)"
    
    var tagArr : [String] = ["가성비 최고","뷰 맛집","힐링","우정여행"]
    
    let containView = UIView().then {
        $0.backgroundColor = .white
    }
    
    let imageView = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "example1")
        $0.contentMode = .scaleAspectFill
    }
    
    let imageLabel = UILabel().then {
        $0.text = "테스트 숙소"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 12)
    }
    
    let exView = UIView().then {
        $0.backgroundColor = .systemPink
    }
    
    let tagCV = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        // 좌우 여백 없애
        layout.minimumLineSpacing = 10
        
        $0.backgroundColor = .none
        $0.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(containView)
        _ = [imageView,imageLabel,tagCV].map {self.containView.addSubview($0)}
        bindConstraints()
        setupViews()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.addSubview(containView)
        _ = [imageView,imageLabel,tagCV].map {self.containView.addSubview($0)}
        bindConstraints()
        setupViews()
    }
    
    func setupViews() {
        tagCV.delegate = self
        tagCV.dataSource = self
        tagCV.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: TagCollectionViewCell.registerId)
    }
    
    private func bindConstraints() {
        containView.snp.makeConstraints { (make) in
            make.top.bottom.right.left.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { (make) in
            make.top.left.bottom.equalTo(containView)
            make.height.equalTo(80)
            make.width.equalTo(80)
            //make.width.equalTo(150)
        }
        
        imageLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.top).offset(16)
            make.leading.equalTo(imageView.snp.trailing).offset(16)
        }
        
        tagCV.snp.makeConstraints {
            $0.top.equalTo(imageLabel.snp.bottom).offset(8)
            $0.leading.equalTo(imageLabel)
            $0.height.equalTo(23)
            $0.trailing.equalTo(contentView).offset(-16)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tagArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        guard let tagCell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.registerId, for: indexPath) as? TagCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell = tagCell
        tagCell.tagLabel.text = tagArr[indexPath.row]
        

        return cell
    }
    
    
}

extension HomeTrustCollectionViewCell : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var size = CGSize()
        let item = tagArr[indexPath.row]
        let c_width = item.size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 11)]).width + 12
        let c_size = CGSize(width: c_width, height: 23)
        size = c_size
        
        return size
        
    }
}

