//
//  MemoViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/05/28.
//

import UIKit

class MemoViewController: UIViewController {
    var presenter: MemoViewPresenterProtocol?
    var dogImageDateLabel = UILabel()
    var dogImageView = UIImageView()
    var dogImageShadowView = UIView()
    var memoEditView = UIView()
    let textEditImage = UIImageView()
    let textEditTitle = UILabel()
    var memoTextField = UITextField()
    var modelHolder: Model?
    var textHolder: String = ""
    let saveButton = UIButton()
    let deleteButton = UIButton()
    let deleteImage = UIImageView()
    let backButton = UIButton()
    let backButtonLabel = UILabel()
    let editButton = UIButton()
    let editButtonLabel = UILabel()
    let dateFormmater = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        presenter?.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override var prefersStatusBarHidden: Bool { return true }
    
    func updateView() {
        attribute()
        layout()
    }
    
    func attribute() {
        [ dogImageDateLabel, dogImageView, backButton, memoEditView, editButton, memoTextField ].forEach() { view.addSubview($0) }
        deleteButton.addSubview(deleteImage)
        dogImageView.addSubview(deleteButton)
        editButton.addSubview(editButtonLabel)
        backButton.addSubview(backButtonLabel)
        
        dogImageDateLabel.do {
            $0.textColor = .black
            $0.font = UIFont.boldSystemFont(ofSize: 23)
            $0.textAlignment = .center
        }
        dateFormmater.do {
            $0.dateFormat = "yyyy년 MM월 dd일"
            $0.locale = Locale(identifier: "ko_KR")
        }
        dogImageView.do {
            $0.backgroundColor = .systemPink
            $0.layer.masksToBounds = true
        }
        backButton.do {
            $0.addTarget(self, action: #selector(backButtonDidTap(sender:)), for: .touchUpInside)
        }
        backButtonLabel.do {
            $0.font = UIFont.boldSystemFont(ofSize: 18)
            $0.textColor = .black
            $0.alpha = 0.9
            $0.text = "취소"
        }
        memoTextField.do {
            $0.textColor = .black
            $0.font = UIFont.boldSystemFont(ofSize: 20)
            $0.placeholder = "이 모먼트에 스토리를 추가해보시개~"
            $0.viewRadius(cornerRadius: 15, maskToBounds: true)
        }
        saveButton.do {
            $0.backgroundColor = .systemRed
        }
        deleteButton.do {
            $0.addTarget(self, action: #selector(deleteButtonDidTap(sender:)), for: .touchUpInside)
        }
        deleteImage.do {
            $0.tintColor = .black
            $0.alpha = 0.8
            $0.image = UIImage(systemName: "trash.circle.fill")
        }
        editButton.do {
            $0.addTarget(self, action: #selector(editButtonDidTap(sender:)), for: .touchUpInside)
        }
        editButtonLabel.do {
            $0.text = "완료"
            $0.font = UIFont.boldSystemFont(ofSize: 18)
            $0.textColor = .black
            $0.alpha = 0.9
        }
    }
    
    func layout() {
        dogImageDateLabel.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            $0.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        dogImageView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: dogImageDateLabel.bottomAnchor, constant: 10).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            $0.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.maxX).isActive = true
        }
        memoTextField.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: dogImageView.bottomAnchor, constant: 10).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 100).isActive = true
        }
        backButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerYAnchor.constraint(equalTo: dogImageDateLabel.centerYAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 50).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        }
        backButtonLabel.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: backButton.centerXAnchor).isActive = true
            $0.centerYAnchor.constraint(equalTo: backButton.centerYAnchor).isActive = true
        }
        editButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerYAnchor.constraint(equalTo: dogImageDateLabel.centerYAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 5).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 50).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        }
        editButtonLabel.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: editButton.centerXAnchor).isActive = true
            $0.centerYAnchor.constraint(equalTo: editButton.centerYAnchor).isActive = true
        }
        deleteButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.leadingAnchor.constraint(equalTo: dogImageView.leadingAnchor, constant: 10).isActive = true
            $0.bottomAnchor.constraint(equalTo: dogImageView.bottomAnchor, constant: -10).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 40).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        }
        deleteImage.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: deleteButton.centerXAnchor).isActive = true
            $0.centerYAnchor.constraint(equalTo: deleteButton.centerYAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 40).isActive = true
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
            print("저장성공")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func deleteButtonDidTap(sender: UIButton) {
        if let model = modelHolder {
            presenter?.passDataToDelete(item: model)
        }
        presenter?.memoViewDismiss()
    }
}

extension MemoViewController: MemoViewProtocol {
    func showMemoView(for model: Model) {
        modelHolder = model
        if let photo = model.photo,
           let memo = model.memo,
           let date = model.date {
            dogImageView.image = UIImage(data: photo)
            memoTextField.text = memo
            let dateFommat = dateFormmater.string(from: date)
            dogImageDateLabel.text = dateFommat
        }
    }
}

extension MemoViewController: UIViewControllerTransitioningDelegate {
    // dismiss될때 실행애니메이션
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DisMissAnimation()
    }
}
