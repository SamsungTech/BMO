//
//  Extensions.swift
//  DogPicture
//
//  Created by 김동우 on 2021/11/15.
//

import Foundation
import UIKit

extension UIView {
    func viewRadius( cornerRadius: CGFloat, maskToBounds: Bool) {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = maskToBounds
    }
    func viewShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.5
    }
    func imageSizeFit(view: UIButton, buttonSize: CGFloat) {
        view.imageEdgeInsets = UIEdgeInsets(top: UIScreen.main.bounds.maxX*(buttonSize/390),
                                            left: UIScreen.main.bounds.maxX*(buttonSize/390),
                                            bottom: UIScreen.main.bounds.maxX*(buttonSize/390),
                                            right: UIScreen.main.bounds.maxX*(buttonSize/390))
    }
}

extension UITextField {
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}
