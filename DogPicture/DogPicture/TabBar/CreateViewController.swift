//
//  CreateViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/11/16.
//

import Foundation
import UIKit

class CreateViewController: UIViewController {
    let dimmedView = UIView()
    let createView = UIView()
    let cameraButton = UIButton()
    let cameraButtonImage = UIImageView()
    let cameraButtonTitle = UILabel()
    let libraryButton = UIButton()
    let libraryButtonImage = UIImageView()
    let libraryButtonTitle = UILabel()
    let textButton = UIButton()
    let textButtonImage = UIImageView()
    let textButtonTitle = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    func updateView() {
        attribute()
        layout()
    }
    
    func attribute() {
        [ dimmedView, createView ].forEach() { view.addSubview($0) }
        [ libraryButton, cameraButton, textButton ].forEach() { createView.addSubview($0) }
        [ cameraButtonImage, cameraButtonTitle ].forEach() { cameraButton.addSubview($0) }
        [ libraryButtonImage, libraryButtonTitle ].forEach() { libraryButton.addSubview($0) }
        [ textButtonImage, textButtonTitle ].forEach() { textButton.addSubview($0) }
        
        dimmedView.do {
            $0.backgroundColor = .darkGray.withAlphaComponent(0.7)
        }
        createView.do {
            $0.backgroundColor = .systemPink
            $0.viewRadius(cornerRadius: 20, maskToBounds: false)
        }
        libraryButton.do {
            $0.tag = 0
            $0.addTarget(self, action: #selector(createButtonDidTap(sender:)), for: .touchUpInside)
        }
        libraryButtonImage.do {
            $0.image = UIImage(systemName: "camera.fill")
            $0.tintColor = .white
            $0.backgroundColor = .systemBlue
        }
        libraryButtonTitle.do {
            $0.text = "카메라"
            $0.font = UIFont.boldSystemFont(ofSize: 20)
            $0.textColor = .white
            $0.textAlignment = .center
        }
        cameraButton.do {
            $0.tag = 1
            $0.addTarget(self, action: #selector(createButtonDidTap(sender:)), for: .touchUpInside)
        }
        cameraButtonImage.do {
            $0.image = UIImage(systemName: "camera.fill")
            $0.tintColor = .white
            $0.backgroundColor = .systemBlue
        }
        cameraButtonTitle.do {
            $0.text = "카메라"
            $0.font = UIFont.boldSystemFont(ofSize: 20)
            $0.textColor = .white
            $0.textAlignment = .center
        }
        textButton.do {
            $0.tag = 2
            $0.addTarget(self, action: #selector(createButtonDidTap(sender:)), for: .touchUpInside)
        }
        textButtonImage.do {
            $0.image = UIImage(systemName: "camera.fill")
            $0.tintColor = .white
            $0.backgroundColor = .systemBlue
        }
        textButtonTitle.do {
            $0.text = "카메라"
            $0.font = UIFont.boldSystemFont(ofSize: 20)
            $0.textColor = .white
            $0.textAlignment = .center
        }
    }
    
    func layout() {
        dimmedView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }
    }
    
    @objc func createButtonDidTap(sender: UIButton) {
        if sender.tag == 0 {
            
        } else if sender.tag == 1 {
            
        } else {
            
        }
    }
}
