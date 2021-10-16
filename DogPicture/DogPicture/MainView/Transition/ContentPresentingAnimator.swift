//
//  ContentPresentingAnimator.swift
//  DogPicture
//
//  Created by 김동우 on 2021/10/14.
//

import Foundation
import UIKit

class ContentPresentingAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    var memoViewTopAnchor: NSLayoutConstraint!
    var memoViewWidthAnchor: NSLayoutConstraint!
    var memoViewHeightAnchor: NSLayoutConstraint!
    var memoViewCenterXAnchor: NSLayoutConstraint!
    
    var subDescTopAnchor: NSLayoutConstraint!
    var subDescLeadingAnchor: NSLayoutConstraint!
    
    var descTopAnchor: NSLayoutConstraint!
    var descLeadingAnchor: NSLayoutConstraint!
    
    var targetIndexPath: IndexPath?
    
    let content = MemoViewController()
    
    init(indexPath: IndexPath) {
        super.init()
        targetIndexPath = indexPath
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        containerView.alpha = 1.0
        
        guard let fromViewController = transitionContext.viewController(forKey: .from) as? TabViewController
        else { fatalError() }
        
        guard let homeViewController = fromViewController.viewControllers![0] as? HomeViewController
        else { fatalError() }
        
        guard let contentViewController = transitionContext.viewController(forKey: .to) as? MemoViewController else { fatalError() }
        
        guard let fromView = homeViewController.view else { fatalError() }
        guard let toView = contentViewController.view else { fatalError() }
        
        let targetCell = homeViewController.homeTableView.cellForRow(at: targetIndexPath!) as! HomeTableViewCell
        let startFrame = homeViewController.homeTableView.convert(targetCell.frame, to: fromView)
        let contentView = content.memoView
        
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 20
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        toView.alpha = 0.0
        contentView.alpha = 1.0
        targetCell.alpha = 0.0
        
        targetCell.resetTransform()
        
        containerView.addSubview(toView)
        containerView.addSubview(contentView)
        
//        NSLayoutConstraint.activate(makeConstraint(containerView: containerView, contentView: contentView, Originframe: startFrame))
        
    }
    
//    func makeConstraint(containerView: UIView, contentView : , Originframe: CGRect) -> [NSLayoutConstraint] {
//        memoViewCenterXAnchor = contentView.center
//    }
}
