//
//  UploadPhotoViewController.swift
//  MakeUs6th
//
//  Created by miori Lee on 2021/03/16.
//

import UIKit
import SnapKit
import Then

class UploadPhotoViewController: BaseViewController {
    
    let view1 = UIView().then {
        $0.backgroundColor = .white
    }
    let view2 = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        // 좌우 여백 없애
        layout.minimumLineSpacing = 0
        
        $0.backgroundColor = .none
        $0.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        $0.collectionViewLayout = layout
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
