//
//  FirstViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/11/01.
//

//@NSManaged public var dogBirthday: Date? 필수
//@NSManaged public var dogGender: Bool
//@NSManaged public var dogName: String? 필수
//@NSManaged public var dogType: Int16 필수
//@NSManaged public var dogWeight: Double
//@NSManaged public var neutering: Bool
//@NSManaged public var userName: String? 필수
//@NSManaged public var dogImage: Data?

import UIKit

class FirstViewController: UIViewController {
    
    let navigationBar = UIView()
    let nextButton = UIButton()
    let nextLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        view.backgroundColor = .systemBlue
    }
    
    func updateView() {
        attribute()
        layout()
    }
    
    func attribute() {
        view.addSubview(navigationBar)
        navigationBar.addSubview(nextButton)
        nextButton.addSubview(nextLabel)
        
        navigationBar.do {
            $0.backgroundColor = .lightGray
        }
        nextLabel.do {
            $0.text = "다음"
            $0.font = UIFont.boldSystemFont(ofSize: 15)
            $0.textColor = .systemBlue
            $0.textAlignment = .center
        }
        nextButton.do {
            $0.addTarget(self,
                         action: #selector(nextButtonDidTap(sender:)),
                         for: .touchUpInside)
        }
        
    }
    
    func layout() {
        navigationBar.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 65).isActive = true
        }
        nextButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerYAnchor.constraint(equalTo: navigationBar.centerYAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 30).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 50).isActive = true
        }
        nextLabel.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerYAnchor.constraint(equalTo: nextButton.centerYAnchor).isActive = true
            $0.centerXAnchor.constraint(equalTo: nextButton.centerXAnchor).isActive = true
        }
    }
    
    @objc func nextButtonDidTap(sender: UIButton) {
        
    }
    
}
