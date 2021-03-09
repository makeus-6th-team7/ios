//
//  HomeTopCollectionViewCell.swift
//  MakeUs6th
//
//  Created by miori Lee on 2021/03/08.
//

import UIKit

class HomeTopCollectionViewCell: UICollectionViewCell {
    
    static let registerId = "\(HomeTopCollectionViewCell.self)"
    
    let imageView = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "topex")
        $0.contentMode = .scaleAspectFill
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageView)
        bindConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.addSubview(imageView)
        bindConstraints()
    }

    
    private func bindConstraints() {
        imageView.snp.makeConstraints { (make) in
            make.bottom.top.right.left.equalToSuperview()
        }
    }
}


