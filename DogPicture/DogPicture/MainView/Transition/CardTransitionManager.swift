//
//  HomeVIewTransition.swift
//  DogPicture
//
//  Created by 김동우 on 2021/10/14.
//

import Foundation
import UIKit

class CardTransitionManager: NSObject, UIViewControllerTransitioningDelegate {
    var superViewController: UIViewController?
    var indexPath: IndexPath?
    
    func presentationController(forPresented presented: UIViewController,
                                presenting: UIViewController?,
                                source: UIViewController) -> UIPresentationController? {
        return ContentPresentation(presentedViewController: presented, presenting: presenting)
    }
    
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }
}
