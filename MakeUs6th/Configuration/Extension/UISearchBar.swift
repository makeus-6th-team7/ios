//
//  UISearchBar.swift
//  MakeUs6th
//
//  Created by miori Lee on 2021/03/18.
//

import UIKit

extension UISearchBar {
    
    var textField: UITextField? {
        
        return subviews.map { $0.subviews.first(where: { $0 is UITextInputTraits}) as? UITextField }
            .compactMap { $0 }
            .first
    }
    

    func setupSearchBar(background: UIColor = .white, inputText: UIColor = .black, placeholderText: UIColor = .gray, image: UIColor = .black) {

        self.searchBarStyle = .minimal

        self.barStyle = .default

        // IOS 12 and lower:
        for view in self.subviews {

            for subview in view.subviews {
                if subview is UITextField {
                    if let textField: UITextField = subview as? UITextField {

                        // Background Color
                        textField.backgroundColor = background

                        //   Text Color
                        textField.textColor = inputText
                        
                        // font
                        textField.font = UIFont.systemFont(ofSize: 14)
                        
                        //  Placeholder Color
                        textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : placeholderText])

                        //  Default Image Color
                        if let leftView = textField.leftView as? UIImageView {
                            leftView.image = leftView.image?.withRenderingMode(.alwaysTemplate)
                            leftView.tintColor = image
                        }

                        let backgroundView = textField.subviews.first
                        backgroundView?.backgroundColor = background
                        backgroundView?.layer.cornerRadius = 10
                        backgroundView?.layer.masksToBounds = true

                    }
                }
            }

        }

        // IOS 13 only:
        if let textField = self.value(forKey: "searchField") as? UITextField {

            // Background Color
            textField.backgroundColor = background

            //   Text Color
            textField.textColor = inputText

            //  Placeholder Color
            textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : placeholderText])

            //  Default Image Color
            if let leftView = textField.leftView as? UIImageView {
                leftView.image = leftView.image?.withRenderingMode(.alwaysTemplate)
                leftView.tintColor = image
            }

        }

    }

}

