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
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewDidLoad()
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
        [ dogImage, backButton, deleteButton, memoTextView, editButton ] .forEach() { memoStackView.addSubview($0) }
        
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
            $0.viewRadius(view: backButton, cornerRadius: 10, maskToBounds: true)
        }
        deleteButton.do {
            $0.tintColor = .systemRed
            $0.backgroundColor = .systemRed
            $0.setTitle("삭제하기", for: .normal)
            $0.addTarget(self, action: #selector(deleteButtonDidTap(sender:)), for: .touchUpInside)
        }
        memoTextView.do {
            $0.backgroundColor = .white
            $0.textColor = .black
        }
        editButton.do {
            $0.backgroundColor = .systemBlue
            $0.setTitle("수정하기", for: .normal)
            $0.addTarget(self, action: #selector(editButtonDidTap(sender:)), for: .touchUpInside)
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
        memoTextView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: dogImage.bottomAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 70).isActive = true
        }
        editButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: memoTextView.bottomAnchor, constant: 10).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        deleteButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 10).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
    }
    
    @objc func backButtonDidTap(sender: UIButton) {
        presenter?.memoViewDismiss()
    }
    @objc func editButtonDidTap(sender: UIButton) {
        textHolder = memoTextView.text ?? ""
        if let model = modelHolder {
            presenter?.passDataToUpdate(item: model, memo: textHolder)
        }
        viewWillAppear(true)
    }
    @objc func deleteButtonDidTap(sender: UIButton) {
        print("삭제버튼 클릭!")
        if let model = modelHolder {
            presenter?.passDataToDelete(item: model)
        }
        presenter?.memoViewDismiss()
    }
}

extension MemoViewController: MemoViewProtocol {
    func showMemoView(for model: Model) {
        modelHolder = model
        print("홀더에 담긴 model 내용 =",modelHolder)
        if let photo = model.photo,
           let memo = model.memo {
            dogImage.image = UIImage(data: photo)
            memoTextView.text = memo
        }
    }
}
