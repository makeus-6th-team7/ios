//
//  TabCollectionViewCell.swift
//  MakeUs6th
//
//  Created by miori Lee on 2021/03/18.
//

import UIKit

class TabCollectionViewCell: UICollectionViewCell {
    
    static let registerId = "\(TabCollectionViewCell.self)"
    
    let menuLabel = UILabel().then {
        $0.font = UIFont.boldSystemFont(ofSize: 14)
        $0.textColor = .bwg6
    }
    
    let menuUnderLine = UIView().then {
        $0.backgroundColor = .mainGreen
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        menuUnderLine.isHidden = true
        // Initialization code
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .none
        _ = [menuLabel,menuUnderLine].map {self.addSubview($0)}
        menuUnderLine.isHidden = true
        bindConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = .none
        _ = [menuLabel,menuUnderLine].map {self.addSubview($0)}
        menuUnderLine.isHidden = true
        bindConstraints()
    }

    
    private func bindConstraints() {
        
        menuLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        menuUnderLine.snp.makeConstraints {
            $0.leading.trailing.equalTo(menuLabel)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(2)
        }
    }
    
    var collectionView : UICollectionView?

//    override var isHighlighted: Bool {
//            didSet {
//                menuLabel.font = isSelected ? .boldSystemFont(ofSize: 17) : .boldSystemFont(ofSize: 15)
//
//                UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseOut, animations: {
//                    self.menuUnderLine.layoutIfNeeded()
//                    self.menuUnderLine.alpha = self.isSelected ? 1 : 0
//
//                }, completion: nil)
//            }
//        }
    
    override var isSelected: Bool {
            didSet {
                menuLabel.font = isSelected ? .boldSystemFont(ofSize: 14) : .boldSystemFont(ofSize: 14)
                menuLabel.textColor = isSelected ? .black : .bwg6
                menuUnderLine.isHidden = isSelected ? false : true
//                UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
//                    self.menuUnderLine.layoutIfNeeded()
//                    self.menuUnderLine.alpha = self.isSelected ? 1 : 0
//                }, completion: nil)
            }
        }

}

