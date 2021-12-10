//
//  MenuViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/06/30.
//

import UIKit
import AVFoundation

protocol CustomTabBarControllerProtocol: UITabBarController {
    func attribute()
    func layout()
}

class CustomTabBarController: UITabBarController, CustomTabBarControllerProtocol {
    let centerView = UIView()
    let centerButton = UIButton()
    let homeButton = UIButton()
    let homeButtonImage = UIImageView()
    let hometButtonLabel = UILabel()
    let settingButton = UIButton()
    let settingButtonImage = UIImageView()
    let settingButtonLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.isHidden = true
        self.selectedIndex = 0
        self.setViewControllers([MainRouter.createMainModule(),
                                 SettingRouter.createSettingModule()], animated: false)
        attribute()
        layout()
    }
    
    func attribute() {
        [ centerView ].forEach() { view.addSubview($0) }
        [ centerButton, homeButton, settingButton ].forEach() { centerView.addSubview($0) }
        [ homeButtonImage, hometButtonLabel ].forEach() { homeButton.addSubview($0) }
        [ settingButtonImage, settingButtonLabel ].forEach() { settingButton.addSubview($0) }
        
        centerView.do {
            $0.backgroundColor = .white
            $0.viewShadow()
            $0.viewRadius(cornerRadius: 40, maskToBounds: false)
        }
        centerButton.do {
            $0.setImage(UIImage(systemName: "plus"), for: .normal)
            $0.tintColor = .systemPink
            $0.backgroundColor = .white
            $0.viewShadow()
            $0.viewRadius(cornerRadius: 30, maskToBounds: false)
            $0.imageView?.contentMode = .scaleAspectFit
            $0.imageSizeFit(view: centerButton, buttonSize: 60)
            $0.addTarget(self, action: #selector(centerButtonDidTap(sender:)), for: .touchUpInside)
        }
        homeButton.do {
            $0.tag = 0
            $0.addTarget(self, action: #selector(tabBarItemDidTap), for: .touchUpInside)
        }
        homeButtonImage.do {
            $0.image = UIImage(systemName: "house.fill")
            $0.tintColor = .black
        }
        hometButtonLabel.do {
            $0.text = "앨범"
            $0.textColor = .black
            $0.font = UIFont.boldSystemFont(ofSize: 15)
        }
        settingButton.do {
            $0.tag = 1
            $0.addTarget(self, action: #selector(tabBarItemDidTap), for: .touchUpInside)
        }
        settingButtonImage.do {
            $0.image = UIImage(systemName: "seal")
            $0.tintColor = .black
        }
        settingButtonLabel.do {
            $0.text = "설정"
            $0.textColor = .black
            $0.font = UIFont.boldSystemFont(ofSize: 15)
        }
    }
    
    func layout() {
        centerView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
            $0.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 80).isActive = true
        }
        centerButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: centerView.centerXAnchor).isActive = true
            $0.centerYAnchor.constraint(equalTo: centerView.centerYAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 60).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 60).isActive = true
        }
        homeButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerYAnchor.constraint(equalTo: centerView.centerYAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 50).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        homeButtonImage.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: homeButton.topAnchor).isActive = true
            $0.centerXAnchor.constraint(equalTo: homeButton.centerXAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 35).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 35).isActive = true
        }
        hometButtonLabel.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: homeButtonImage.bottomAnchor).isActive = true
            $0.centerXAnchor.constraint(equalTo: homeButton.centerXAnchor).isActive = true
        }
        settingButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerYAnchor.constraint(equalTo: centerView.centerYAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: centerView.trailingAnchor, constant: -50).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 50).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        settingButtonImage.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: settingButton.topAnchor).isActive = true
            $0.centerXAnchor.constraint(equalTo: settingButton.centerXAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 35).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 35).isActive = true
        }
        settingButtonLabel.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: settingButtonImage.bottomAnchor).isActive = true
            $0.centerXAnchor.constraint(equalTo: settingButton.centerXAnchor).isActive = true
        }
    }
    
    @objc func tabBarItemDidTap(sender: UIButton) {
        selectedIndex = sender.tag
        if sender.tag == 0 {
            homeButtonImage.image = UIImage(systemName: "house.fill")
            settingButtonImage.image = UIImage(systemName: "seal")
            navigationController?.isNavigationBarHidden = true
        } else {
            homeButtonImage.image = UIImage(systemName: "house")
            settingButtonImage.image = UIImage(systemName: "seal.fill")
            navigationController?.isNavigationBarHidden = false
        }
    }
    @objc func centerButtonDidTap(sender: UIButton) {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
        let createView = CreateRouter.createCreateViewModule()
        createView.modalPresentationStyle = .overFullScreen
        present(createView, animated: false)
        
    }
}

