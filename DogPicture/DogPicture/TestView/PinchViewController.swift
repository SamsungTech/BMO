//
//  PinchViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/11/23.
//

import Foundation
import UIKit

class PinchViewController: UIViewController {
    
    private let myView: UIView = {
        let myView = UIView()
        myView.backgroundColor = .systemBlue
        return myView
    }()
    
    private let size: CGFloat = 200
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        addGesture()
    }
    
    func updateView() {
        attribute()
        layout()
    }
    
    func attribute() {
        view.addSubview(myView)
        
        myView.do {
            $0.frame = CGRect(x: .zero, y: .zero, width: size, height: size)
            $0.center = view.center
        }
    }
    
    func layout() {
        
    }
    
    private func addGesture() {
        let pinchGesture = UIPinchGestureRecognizer(target: self,
                                                    action: #selector(didPinch(_:)))
        myView.addGestureRecognizer(pinchGesture)
    }
    @objc private func didPinch(_ gesture: UIPinchGestureRecognizer) {
        if gesture.state == .changed {
            let scale = gesture.scale
            myView.frame = CGRect(
                x: 0,
                y: 0,
                width: size * scale,
                height: size * scale
            )
            myView.center = view.center
        }
    }
    
}
