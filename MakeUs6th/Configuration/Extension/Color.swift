//
//  Color.swift
//  MakeUs6th
//
//  Created by miori Lee on 2021/03/04.
//

import UIKit

extension UIColor {
    // MARK: hex code를 이용하여 정의
    // ex. UIColor(hex: 0xF5663F)
    convenience init(hex: UInt, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
    
    // MARK: 메인 테마 색 또는 자주 쓰는 색을 정의
    // ex. label.textColor = .mainOrange
    class var mainGreen: UIColor { UIColor(hex: 0x00D7AB) }
    class var tabUnSelected : UIColor {UIColor(hex: 0xAEB5BC) }
    class var customGray : UIColor {UIColor(hex: 0x999DA4) }
    class var bwg2 : UIColor {UIColor(hex: 0xECECEC)}
    class var bwg3 : UIColor {UIColor(hex: 0xE7E9EB) }
    class var bwg5 : UIColor {UIColor(hex: 0xA6B0BA)}
    class var bwg6 : UIColor {UIColor(hex: 0x999DA4)}
    class var bwg7 : UIColor {UIColor(hex: 0x40484E)}
}
