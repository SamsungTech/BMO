//
//  SlideInTransition.swift
//  DogPicture
//
//  Created by 김동우 on 2021/10/22.
//

import Foundation
import UIKit

class SlideInTransition: NSObject, UIViewControllerAnimatedTransitioning{
    var isPresenting = false
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to),
              let fromViewController = transitionContext.viewController(forKey: .from) else { return }
        
        let containerView = transitionContext.containerView
        
        let blurView = UIVisualEffectView(effect: nil)
        
        let finalWidth = toViewController.view.bounds.width * 0.8
        let finalHeight = toViewController.view.bounds.height
        
        if isPresenting {
            containerView.addSubview(toViewController.view)
            containerView.addSubview(blurView)
            containerView.bringSubviewToFront(toViewController.view)
            
            blurView.frame = containerView.frame
            blurView.alpha = 0.0
            
            toViewController.view.frame = CGRect(x: -finalWidth,
                                                 y: 0,
                                                 width: finalWidth,
                                                 height: finalHeight)
        }
        
        let transform = {
            toViewController.view.transform = CGAffineTransform(translationX: finalWidth, y: 0)
        }
        
        let identity = {
            fromViewController.view.transform = .identity
        }
        
        let blurform = {
            blurView.effect = UIBlurEffect(style: .dark)
            blurView.alpha = 0.7
        }
        
        let blurIdentity = {
            blurView.alpha = 0.0
            blurView.removeFromSuperview()
        }
        
        let duration = transitionDuration(using: transitionContext)
        let isCancelled = transitionContext.transitionWasCancelled
        UIView.animate(withDuration: duration,
                       animations: {
            self.isPresenting ? blurform() : blurIdentity()
            self.isPresenting ? transform() : identity()
        }) { (_) in
            transitionContext.completeTransition(!isCancelled)
        }
    }
}
