//
//  CreateViewTransition.swift
//  DogPicture
//
//  Created by 김동우 on 2021/11/16.
//

import Foundation
import UIKit

class CreateViewTransition: NSObject, UIViewControllerAnimatedTransitioning{
    var isPresenting = false
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to),
              let fromViewController = transitionContext.viewController(forKey: .from) else { return }
        
        let containerView = transitionContext.containerView
        
        let blurView = UIVisualEffectView(effect: nil)
        
        let finalWidth = toViewController.view.bounds.width
        let finalHeight = toViewController.view.bounds.height * 0.3
        
        if isPresenting {
            containerView.addSubview(toViewController.view)
            containerView.addSubview(blurView)
            containerView.bringSubviewToFront(toViewController.view)
            
            blurView.frame = containerView.frame
            blurView.alpha = 0.0
            
            toViewController.view.frame = CGRect(x: 0,
                                                 y: finalHeight,
                                                 width: finalWidth,
                                                 height: finalHeight)
        }
        
        let transform = {
            toViewController.view.transform = CGAffineTransform(translationX: 0, y: finalHeight)
        }
        
        let identity = {
            blurView.alpha = 1.0
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
