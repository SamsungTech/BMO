//
//  Extensions.swift
//  DogPicture
//
//  Created by 김동우 on 2021/11/15.
//

import Foundation
import UIKit

extension UIView {
    func viewRadius(view: UIView, cornerRadius: CGFloat, maskToBounds: Bool) {
        view.layer.cornerRadius = cornerRadius
        view.layer.masksToBounds = maskToBounds
    }
    func viewShadow(view: UIView) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 1, height: 1)
        view.layer.shadowRadius = 3
        view.layer.shadowOpacity = 0.5
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
