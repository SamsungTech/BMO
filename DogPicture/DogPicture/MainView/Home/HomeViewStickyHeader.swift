//
//  HomeViewStickyHeader.swift
//  DogPicture
//
//  Created by 김동우 on 2021/09/02.
//

import Foundation
import UIKit

class HomeViewStickyHeaderView: UIView {
    static let identifier = "StickyHeader"
    
    private var containerView = UIView()
    private var imageViewHeight = NSLayoutConstraint()
    private var imageViewBottom = NSLayoutConstraint()
    private var containerViewHeight = NSLayoutConstraint()
    
    var randomImageView = UIImageView()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createViews()
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func createViews() {
        addSubview(containerView)
        containerView.addSubview(randomImageView)
        
        randomImageView.do {
            $0.clipsToBounds = true
            $0.contentMode = .scaleAspectFill
        }
        
        
    }
    func layout() {
        containerView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.heightAnchor.constraint(equalToConstant: 450).isActive = true
            $0.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            $0.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        }
        randomImageView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 450).isActive = true
            $0.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        }
    }
    
    public func scrollViewDidScroll(scrollView: UIScrollView) {
        containerViewHeight.constant = scrollView.contentInset.top
        let offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
        containerView.clipsToBounds = offsetY <= 0
        imageViewBottom.constant = offsetY >= 0 ? 0 : -offsetY / 2
        imageViewHeight.constant = max(offsetY + scrollView.contentInset.top, scrollView.contentInset.top)
    }
}
