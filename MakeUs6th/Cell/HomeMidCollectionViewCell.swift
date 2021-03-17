//
//  HomeMidCollectionViewCell.swift
//  MakeUs6th
//
//  Created by miori Lee on 2021/03/18.
//

import UIKit

class HomeMidCollectionViewCell: UICollectionViewCell {
    
    static let registerId = "\(HomeMidCollectionViewCell.self)"
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(containView)
        _ = [imageView,imageLabel].map {self.containView.addSubview($0)}
        bindConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.addSubview(containView)
        _ = [imageView,imageLabel].map {self.containView.addSubview($0)}
        bindConstraints()
    }

    
    private func bindConstraints() {
        containView.snp.makeConstraints { (make) in
            make.top.bottom.right.left.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { (make) in
            make.top.right.left.equalTo(containView)
            make.height.equalTo(150)
            //make.width.equalTo(150)
        }
        
        imageLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.leading.equalTo(imageView)
            make.bottom.equalTo(containView)
        }
    }
}
