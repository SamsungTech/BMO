//
//  MenuViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/06/30.
//

import UIKit
import Then

class MenuViewController: UIViewController {
    
    var menuView = UIView()
    
    var togleButton = UIButton()
    
    var homeButton = UIButton()
    var cameraButton = UIButton()
    var settingButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        layout()
    }
    
    func attribute() {
        togleButton.do {
            $0.frame = CGRect(x: 0, y: 0, width: 130, height: 130)
            $0.layer.cornerRadius = 100
            $0.layer.borderWidth = 10
            $0.layer.borderColor = UIColor.gray.cgColor
            $0.layer.shadowColor = UIColor.gray.cgColor
            $0.layer.shadowOffset = CGSize(width: 4, height: 4)
        }
    }
    
    func layout() {
        [ togleButton ].forEach { view.addSubview($0) }
        
        togleButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            $0.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 40).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
            
        }
        
    }
}
