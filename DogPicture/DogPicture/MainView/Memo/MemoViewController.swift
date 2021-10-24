//
//  MemoViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/05/28.
//

import UIKit

class MemoViewController: UIViewController {
    var presenter: MemoViewPresenterProtocol?
    
    var dogImageHolder: UIImage?
    var dogImage = UIImageView()
    var memoEditView = UIView()
    let textEditImage = UIImageView()
    let textEditTitle = UILabel()
    var memoTextField = UITextField()
    var modelHolder: Model?
    var textHolder: String = ""
    
    let saveButton = UIButton()
    let deleteButton = UIButton()
    let backButton = UIButton()
    let editButton = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        view.backgroundColor = .white
        updateView()
    }
    
    override var prefersStatusBarHidden: Bool { return true }
    
    func updateView() {
        attribute()
        layout()
    }
    
    func attribute() {
        [ dogImage, backButton, memoEditView ].forEach() { view.addSubview($0) }
        [ textEditImage, textEditTitle, memoTextField, deleteButton, editButton ].forEach() { memoEditView.addSubview($0) }
        
        dogImage.do {
//            if let dogImageHolder = dogImageHolder {
//                $0.image = dogImageHolder
//            }
            $0.backgroundColor = .systemPink
            $0.layer.masksToBounds = false
            $0.layer.cornerRadius = 20
            $0.layer.shadowOpacity = 0.5
            $0.layer.shadowColor = UIColor.black.cgColor
            $0.layer.shadowOffset = CGSize(width: 0, height: 0)
            $0.layer.shadowRadius = 10
        }
        backButton.do {
            $0.tintColor = .systemGray6
            $0.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
            $0.addTarget(self, action: #selector(backButtonDidTap(sender:)), for: .touchUpInside)
        }
        memoEditView.do {
            $0.backgroundColor = .white
            $0.viewRadius(view: memoEditView, cornerRadius: 20, maskToBounds: true)
            $0.layer.masksToBounds = false
            $0.layer.cornerRadius = 20
            $0.layer.shadowOpacity = 0.5
            $0.layer.shadowColor = UIColor.black.cgColor
            $0.layer.shadowOffset = CGSize(width: 0, height: 0)
            $0.layer.shadowRadius = 10
        }
        textEditImage.do {
            $0.image = UIImage(systemName: "heart.text.square")
            $0.tintColor = .black
        }
        textEditTitle.do {
            $0.font = UIFont.boldSystemFont(ofSize: 15)
            $0.textAlignment = .left
            $0.textColor = .black
            $0.text = "글을 쓰라개"
        }
        memoTextField.do {
            $0.backgroundColor = .lightGray
            $0.textColor = .black
            $0.viewRadius(view: memoTextField, cornerRadius: 15, maskToBounds: true)
        }
        saveButton.do {
            $0.backgroundColor = .systemRed
        }
        deleteButton.do {
            $0.tintColor = .systemRed
            $0.backgroundColor = .systemRed
            $0.setTitle("삭제하기", for: .normal)
            $0.addTarget(self, action: #selector(deleteButtonDidTap(sender:)), for: .touchUpInside)
            $0.viewRadius(view: deleteButton, cornerRadius: 20, maskToBounds: true)
        }
        editButton.do {
            $0.backgroundColor = .systemBlue
            $0.setTitle("수정하기", for: .normal)
            $0.addTarget(self, action: #selector(editButtonDidTap(sender:)), for: .touchUpInside)
            $0.viewRadius(view: editButton, cornerRadius: 20, maskToBounds: true)
        }
    }
    
    func layout() {
        dogImage.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
            $0.bottomAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        }
        backButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 50).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        memoEditView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: dogImage.bottomAnchor, constant: 10).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 200).isActive = true
        }
        textEditImage.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: memoEditView.topAnchor, constant: 10).isActive = true
            $0.leadingAnchor.constraint(equalTo: memoEditView.leadingAnchor, constant: 10).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 30).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 30).isActive = true
        }
        textEditTitle.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerYAnchor.constraint(equalTo: textEditImage.centerYAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: textEditImage.trailingAnchor, constant: 10).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 200).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        memoTextField.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: textEditImage.bottomAnchor, constant: 10).isActive = true
            $0.leadingAnchor.constraint(equalTo: memoEditView.leadingAnchor, constant: 10).isActive = true
            $0.trailingAnchor.constraint(equalTo: memoEditView.trailingAnchor, constant: -10).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 90).isActive = true
        }
        editButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: memoTextField.bottomAnchor, constant: 10).isActive = true
            $0.trailingAnchor.constraint(equalTo: memoEditView.trailingAnchor, constant: -10).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 100).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        }
        deleteButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerYAnchor.constraint(equalTo: editButton.centerYAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: editButton.leadingAnchor, constant: -10).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 100).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        }
    }
    
    @objc func backButtonDidTap(sender: UIButton) {
        presenter?.memoViewDismiss()
        self.transitioningDelegate = self
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func editButtonDidTap(sender: UIButton) {
        textHolder = memoTextField.text ?? ""
        if let model = modelHolder {
            presenter?.passDataToUpdate(item: model, memo: textHolder)
        }
        viewWillAppear(true)
    }
    
    @objc func deleteButtonDidTap(sender: UIButton) {
        if let model = modelHolder {
            presenter?.passDataToDelete(item: model)
        }
//        self.transitioningDelegate = self
        
//        self.dismiss(animated: true, completion: nil)
        presenter?.memoViewDismiss()
    }
}

extension MemoViewController: MemoViewProtocol {
    func showMemoView(for model: Model) {
        modelHolder = model
        if let photo = model.photo,
           let memo = model.memo {
            dogImageHolder = UIImage(data: photo)
            memoTextField.text = memo
        }
    }
}

extension MemoViewController: UIViewControllerTransitioningDelegate {
    // dismiss될때 실행애니메이션
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DisMissAnimation()
    }
}
