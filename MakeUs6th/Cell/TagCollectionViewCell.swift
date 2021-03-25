//
//  TagCollectionViewCell.swift
//  MakeUs6th
//
//  Created by miori Lee on 2021/03/23.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    
    static let registerId = "\(TagCollectionViewCell.self)"
    
    let containView = UIView().then {
        $0.backgroundColor = .white
       $0.layer.cornerRadius = 4
       $0.layer.borderWidth = 1
       $0.layer.borderColor = UIColor(red: 0.905, green: 0.913, blue: 0.921, alpha: 1).cgColor
    }
    
    var tagLabel = UILabel().then {
        $0.text = "태그1"
        $0.textColor = .mainGreen
        $0.font = UIFont.systemFont(ofSize: 11)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(containView)
        _ = [tagLabel].map {self.containView.addSubview($0)}
        bindConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.addSubview(containView)
        _ = [tagLabel].map {self.containView.addSubview($0)}
        bindConstraints()
    }

    
    private func bindConstraints() {
        containView.snp.makeConstraints { (make) in
            make.top.bottom.right.left.equalToSuperview()
        }
        
        tagLabel.snp.makeConstraints {
            $0.trailing.leading.equalTo(containView).offset(6)
            $0.top.equalTo(containView.snp.top).offset(4)
            $0.bottom.equalTo(containView.snp.bottom).offset(-4)
        }
    }
}
