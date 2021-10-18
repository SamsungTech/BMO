//
//  DisMissAnimation.swift
//  DogPicture
//
//  Created by 김동우 on 2021/10/18.
//

import Foundation
import UIKit

class DisMissAnimation: UIPercentDrivenInteractiveTransition, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.view(forKey: .from) else { return }
        UIView.animate(withDuration: 0.2, animations: {
            fromView.alpha = 0
        }) { (completed) in
            transitionContext.completeTransition(completed)
        }
    }
}
