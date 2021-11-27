//
//  CreateViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/11/16.
//

import Foundation
import UIKit

class CreateViewController: UIViewController {
    var presenter: CreatePresenterProtocol?
    
    let dimmedView = UIView()
    let createView = UIView()
    let cameraButton = UIButton()
    let cameraButtonCircleView = UIView()
    let cameraButtonImage = UIImageView()
    let cameraButtonTitle = UILabel()
    let libraryButton = UIButton()
    let libraryButtonCircleView = UIView()
    let libraryButtonImage = UIImageView()
    let libraryButtonTitle = UILabel()
    let textButton = UIButton()
    let textButtonCircleView = UIView()
    let textButtonImage = UIImageView()
    let textButtonTitle = UILabel()
    
    var defaultHeight: CGFloat = 250
    
    private var TopConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showBottomShett()
    }
    
    func updateView() {
        attribute()
        layout()
    }
    
    func attribute() {
        [ dimmedView, createView ].forEach() { view.addSubview($0) }
        [ libraryButton, cameraButton, textButton ].forEach() { createView.addSubview($0) }
        [ libraryButtonCircleView, libraryButtonTitle ].forEach() { libraryButton.addSubview($0) }
        [ cameraButtonCircleView, cameraButtonTitle ].forEach() { cameraButton.addSubview($0) }
        [ textButtonCircleView, textButtonTitle ].forEach() { textButton.addSubview($0) }
        libraryButtonCircleView.addSubview(libraryButtonImage)
        cameraButtonCircleView.addSubview(cameraButtonImage)
        textButtonCircleView.addSubview(textButtonImage)
        
        dimmedView.do {
            let dimmedTap = UITapGestureRecognizer(target: self, action: #selector(dimmedViewDidTap(_:)))
            $0.addGestureRecognizer(dimmedTap)
            $0.isUserInteractionEnabled = true
            $0.backgroundColor = .black.withAlphaComponent(0.7)
            $0.alpha = 0.0
        }
        createView.do {
            $0.backgroundColor = .white
            $0.layer.cornerRadius = 20
            $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            $0.clipsToBounds = true
        }
        libraryButton.do {
            $0.addTarget(self, action: #selector(libraryButtonDidTap(sender:)), for: .touchUpInside)
        }
        libraryButtonCircleView.do {
            let dimmedTap = UITapGestureRecognizer(target: self, action: #selector(libraryButtonDidTap(sender:)))
            $0.addGestureRecognizer(dimmedTap)
            $0.isUserInteractionEnabled = true
            $0.backgroundColor = .systemPink
            $0.viewRadius(cornerRadius: 40, maskToBounds: true)
            $0.viewShadow()
        }
        libraryButtonImage.do {
            $0.image = UIImage(systemName: "photo.fill")
            $0.tintColor = .white
        }
        libraryButtonTitle.do {
            $0.text = "앨범"
            $0.font = UIFont.boldSystemFont(ofSize: 20)
            $0.textColor = .black
            $0.textAlignment = .center
        }
        cameraButton.do {
            $0.addTarget(self, action: #selector(cameraButtonDidTap(sender:)), for: .touchUpInside)
        }
        cameraButtonCircleView.do {
            let dimmedTap = UITapGestureRecognizer(target: self, action: #selector(cameraButtonDidTap(sender:)))
            $0.addGestureRecognizer(dimmedTap)
            $0.isUserInteractionEnabled = true
            $0.backgroundColor = .systemPink
            $0.viewRadius(cornerRadius: 40, maskToBounds: true)
            $0.viewShadow()
        }
        cameraButtonImage.do {
            $0.image = UIImage(systemName: "camera.fill")
            $0.tintColor = .white
        }
        cameraButtonTitle.do {
            $0.text = "카메라"
            $0.font = UIFont.boldSystemFont(ofSize: 20)
            $0.textColor = .black
            $0.textAlignment = .center
        }
        textButton.do {
            $0.addTarget(self, action: #selector(diaryButtonDidTap(sender:)), for: .touchUpInside)
        }
        textButtonCircleView.do {
            let dimmedTap = UITapGestureRecognizer(target: self, action: #selector(diaryButtonDidTap(sender:)))
            $0.addGestureRecognizer(dimmedTap)
            $0.isUserInteractionEnabled = true
            $0.backgroundColor = .systemPink
            $0.viewRadius(cornerRadius: 40, maskToBounds: true)
            $0.viewShadow()
        }
        textButtonImage.do {
            $0.image = UIImage(systemName: "doc.text")
            $0.tintColor = .white
        }
        textButtonTitle.do {
            $0.text = "다이어리"
            $0.font = UIFont.boldSystemFont(ofSize: 20)
            $0.textColor = .black
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
        createView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            TopConstraint = createView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                                            constant: UIScreen.main.bounds.maxY)
            TopConstraint?.isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            $0.heightAnchor.constraint(equalToConstant: defaultHeight).isActive = true
        }
        libraryButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: createView.topAnchor, constant: 30).isActive = true
            $0.leadingAnchor.constraint(equalTo: createView.leadingAnchor, constant: 30).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 90).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 150).isActive = true
        }
        libraryButtonCircleView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: libraryButton.topAnchor, constant: 10).isActive = true
            $0.centerXAnchor.constraint(equalTo: libraryButton.centerXAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 80).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 80).isActive = true
        }
        libraryButtonImage.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerYAnchor.constraint(equalTo: libraryButtonCircleView.centerYAnchor).isActive = true
            $0.centerXAnchor.constraint(equalTo: libraryButtonCircleView.centerXAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 50).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 45).isActive = true
        }
        libraryButtonTitle.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: libraryButton.centerXAnchor).isActive = true
            $0.topAnchor.constraint(equalTo: libraryButtonCircleView.bottomAnchor, constant: 10).isActive = true
        }
        cameraButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: createView.topAnchor, constant: 30).isActive = true
            $0.centerXAnchor.constraint(equalTo: createView.centerXAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 90).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 150).isActive = true
        }
        cameraButtonCircleView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: cameraButton.topAnchor, constant: 10).isActive = true
            $0.centerXAnchor.constraint(equalTo: cameraButton.centerXAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 80).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 80).isActive = true
        }
        cameraButtonImage.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerYAnchor.constraint(equalTo: cameraButtonCircleView.centerYAnchor).isActive = true
            $0.centerXAnchor.constraint(equalTo: cameraButtonCircleView.centerXAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 50).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 45).isActive = true
        }
        cameraButtonTitle.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: cameraButton.centerXAnchor).isActive = true
            $0.topAnchor.constraint(equalTo: cameraButtonCircleView.bottomAnchor, constant: 10).isActive = true
        }
        textButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: createView.topAnchor, constant: 30).isActive = true
            $0.trailingAnchor.constraint(equalTo: createView.trailingAnchor, constant: -30).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 90).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 150).isActive = true
        }
        textButtonCircleView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: textButton.topAnchor, constant: 10).isActive = true
            $0.centerXAnchor.constraint(equalTo: textButton.centerXAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 80).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 80).isActive = true
        }
        textButtonImage.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerYAnchor.constraint(equalTo: textButtonCircleView.centerYAnchor).isActive = true
            $0.centerXAnchor.constraint(equalTo: textButtonCircleView.centerXAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 45).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        textButtonTitle.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: textButton.centerXAnchor).isActive = true
            $0.topAnchor.constraint(equalTo: textButtonCircleView.bottomAnchor, constant: 10).isActive = true
        }
    }
    
    private func showBottomShett() {
        TopConstraint?.constant = UIScreen.main.bounds.maxY - defaultHeight
        
        UIView.animate(withDuration: 0.25,
                       delay: 0,
                       options: .curveEaseIn,
                       animations: {
            self.dimmedView.alpha = 0.7
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    private func hideBottomSheet() {
        TopConstraint?.constant = UIScreen.main.bounds.maxY
        
        UIView.animate(withDuration: 0.25,
                       delay: 0,
                       options: .curveEaseIn,
                       animations: {
            self.dimmedView.alpha = 0.0
            self.view.layoutIfNeeded()
        }) { _ in
            if self.presentingViewController != nil {
                self.dismiss(animated: false)
            }
        }
    }
    
    @objc private func dimmedViewDidTap(_ tapRecognizer: UITapGestureRecognizer) {
        hideBottomSheet()
    }
    @objc func libraryButtonDidTap(sender: UIButton) {
        print("앨범버튼 클릭")
        hideBottomSheet()
    }
    @objc func cameraButtonDidTap(sender: UIButton) {
        guard let presentingView = self.presentingViewController as? CustomTabBarControllerProtocol else { return }
        self.dismiss(animated: false) {
            self.presenter?.cameraButtonClicked(presentingView: presentingView)
        }
    }
    @objc func diaryButtonDidTap(sender: UIButton) {
        print("다이어리버튼 클릭")
        hideBottomSheet()
    }
}

extension CreateViewController: CreateViewControllerProtocol {
    
    
}
