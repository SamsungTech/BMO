//
//  HomeVIewTransition.swift
//  DogPicture
//
//  Created by 김동우 on 2021/10/14.
//

import Foundation
import UIKit

class AnimationTransition: UIPercentDrivenInteractiveTransition, UIViewControllerAnimatedTransitioning {
    
    var originPoint: CGPoint?
    var originFrame = CGRect()
    
    func setPoint(point: CGPoint?) {
        self.originPoint = point
        
    }
    
    func setFrame(frame: CGRect) {
        self.originFrame = frame
    }
    
    // 애니메이션 동작 시간
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    // 애니메이션 효과 정의
    // animation될 뷰 지정
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        // 다음 보여질뷰 참조
        guard let toView = transitionContext.view(forKey: .to) else { return }
        
        // 보여질 뷰의 위치 잡기 (Cell의 frame)
        toView.frame = originFrame
        
        // MARK: CGAffineTransform을 이용한 효과
        toView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        
        containerView.addSubview(toView)
        
        containerView.bringSubviewToFront(toView)
        
        toView.layer.masksToBounds = true
        toView.layer.cornerRadius = 20
        toView.alpha = 0
        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 0.2,
                       options: .curveEaseOut,
                       animations: {
            toView.transform = .identity
            toView.alpha = 1
        }) { _ in
            toView.do {
                $0.translatesAutoresizingMaskIntoConstraints = false
                $0.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
                $0.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
                $0.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
                $0.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
            }
            
            UIView.animate(withDuration: 0.5) {
                containerView.layoutIfNeeded()
            }
        }
        transitionContext.completeTransition(true)
    }
}
