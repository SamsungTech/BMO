//
//  MemoViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/05/28.
//

import UIKit

class MemoViewController: UIViewController {
    var presenter: MemoViewPresenterProtocol?
    
    var dogImage = UIImageView()
    var mainView = UIView()
    var memoStackView = UIStackView()
    var memoTextView = UITextField()
    
    let saveButton = UIButton()
    let backButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        view.backgroundColor = .white
        updateView()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func updateView() {
        attribute()
        layout()
    }
    
    func attribute() {
        [ memoStackView ].forEach() { view.addSubview($0) }
        [ dogImage, backButton ] .forEach() { memoStackView.addSubview($0) }
        
        memoStackView.do {
            $0.backgroundColor = .systemGreen
            $0.axis = .vertical
            $0.alignment = .fill
            $0.distribution = .fillEqually
        }
        dogImage.do {
            $0.backgroundColor = .systemPink
        }
        saveButton.do {
            $0.backgroundColor = .systemRed
        }
        backButton.do {
            $0.tintColor = .systemGray6
            $0.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
            $0.addTarget(self, action: #selector(backButtonDidTap(sender:)), for: .touchUpInside)
        }
    }
    
    func layout() {
        memoStackView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }

        dogImage.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        }

        backButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 50).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
    }
    
    @objc func backButtonDidTap(sender: UIButton) {
        presenter?.memoViewDismiss()
    }
}

extension MemoViewController: MemoViewProtocol {
    func showMemoView(for model: Model) {
        if let photo = model.photo {
            dogImage.image = UIImage(data: photo)
        }
    }
}
