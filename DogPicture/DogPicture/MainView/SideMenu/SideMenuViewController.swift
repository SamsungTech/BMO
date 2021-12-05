//
//  SideMenuViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/10/21.
//

import Foundation
import UIKit

class SideMenuViewController: UIViewController {
    var presenter: SideMenuPresenterProtocol?
    
    let dimmedView = UIView()
    var defaultWidth: CGFloat = 300
    
    var sideView = UIView()
    let sideMenuTitle = UILabel()
    let sideMenuChangeButton = UIButton()
    var sideTableView = UITableView()
    let dogRegisterButton = UIButton()
    let registerButtonImage = UIImageView()
    let registerButtonLabel = UILabel()
    
    private var sideConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        view.backgroundColor = .clear
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showSideMenu()
    }
    
    func updateView() {
        attribute()
        layout()
    }
    
    func attribute() {
        [ dimmedView, sideView ].forEach() { view.addSubview($0) }
        [ sideMenuTitle, sideMenuChangeButton, sideTableView, dogRegisterButton ].forEach() { sideView.addSubview($0) }
        [ registerButtonImage, registerButtonLabel ].forEach() { dogRegisterButton.addSubview($0) }
        
        dimmedView.do {
            let dimmedTap = UITapGestureRecognizer(target: self, action: #selector(dimmedViewDidTap(_:)))
            $0.addGestureRecognizer(dimmedTap)
            $0.isUserInteractionEnabled = true
            $0.backgroundColor = .black.withAlphaComponent(0.7)
            $0.alpha = 0.0
        }
        sideView.do {
            $0.backgroundColor = .white
        }
        sideMenuTitle.do {
            $0.text = "갱쥐스"
            $0.font = UIFont.boldSystemFont(ofSize: 30)
            $0.textColor = .systemPink
            $0.textAlignment = .left
        }
        sideMenuChangeButton.do {
            $0.setImage(UIImage(systemName: "arrow.up.arrow.down"), for: .normal)
            $0.tintColor = .darkGray
        }
        sideTableView.do {
            $0.register(SideMenuCell.self, forCellReuseIdentifier: "SideMenuCell")
            $0.separatorStyle = .none
            $0.dataSource = self
            $0.delegate = self
            $0.backgroundColor = .white
        }
        dogRegisterButton.do {
            $0.backgroundColor = .white
            $0.layer.shadowOpacity = 0.5
            $0.layer.shadowColor = UIColor.gray.cgColor
            $0.layer.shadowOffset = CGSize(width: 0, height: 0)
            $0.layer.shadowRadius = 3
            $0.layer.masksToBounds = false
        }
        registerButtonImage.do {
            $0.image = UIImage(systemName: "plus.circle.fill")
            $0.tintColor = .systemPink
        }
        registerButtonLabel.do {
            $0.text = "강쥐 등록하기"
            $0.textAlignment = .left
            $0.font = UIFont.boldSystemFont(ofSize: 17)
            $0.textColor = .black
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
        sideView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            sideConstraint = $0.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                                constant: -UIScreen.main.bounds.maxX)
            sideConstraint?.isActive = true
            $0.widthAnchor.constraint(equalToConstant: defaultWidth).isActive = true
        }
        sideMenuTitle.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: sideView.leadingAnchor, constant: 20).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 100).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        sideMenuChangeButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: sideView.trailingAnchor, constant: -15).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 50).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        dogRegisterButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.leadingAnchor.constraint(equalTo: sideView.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: sideView.trailingAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: sideView.bottomAnchor).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 100).isActive = true
        }
        registerButtonImage.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: dogRegisterButton.topAnchor, constant: 10).isActive = true
            $0.leadingAnchor.constraint(equalTo: dogRegisterButton.leadingAnchor, constant: 20).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 30).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 30).isActive = true
        }
        registerButtonLabel.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerYAnchor.constraint(equalTo: registerButtonImage.centerYAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: registerButtonImage.trailingAnchor, constant: 10).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 200).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        sideTableView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: sideMenuTitle.bottomAnchor, constant: 10).isActive = true
            $0.leadingAnchor.constraint(equalTo: sideView.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: sideView.trailingAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: dogRegisterButton.topAnchor).isActive = true
        }
    }
}

extension SideMenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SideMenuCell.identifier) as! SideMenuCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.dismiss()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

extension SideMenuViewController: SideMenuViewProtocol {
    
}

extension SideMenuViewController {
    @objc private func dimmedViewDidTap(_ tapRecongnizer: UITapGestureRecognizer) {
        hideSideMenu()
    }
}

extension SideMenuViewController {
    private func showSideMenu() {
        sideConstraint?.constant = -UIScreen.main.bounds.maxX + defaultWidth
        
        UIView.animate(withDuration: 0.25,
                       delay: 0,
                       options: .curveEaseIn,
                       animations: {
            self.dimmedView.alpha = 0.7
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    private func hideSideMenu() {
        sideConstraint?.constant = -UIScreen.main.bounds.maxX
        
        UIView.animate(withDuration: 0.25,
                       delay: 0,
                       options: .curveEaseIn,
                       animations: {
            self.dimmedView.alpha = 0.0
            self.view.layoutIfNeeded()
        }) { _ in
            if self.presentingViewController != nil {
                self.presenter?.dismiss()
            }
        }
    }
}
