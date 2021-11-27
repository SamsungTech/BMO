//
//  CaptureViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/09/14.
//

import UIKit

class PreviewViewController: UIViewController {
    var presenter: PreviewPresenterProtocol?
    
    var captureTopBar = UIView()
    var cancelButton = UIButton()
    var saveButton = UIButton()
    var captureImageView = UIImageView()
    var previewTextField = UITextField()
    var tabView = CustomTabBarController()
    var captureImage = UIImage()
    var captureImageData = Data()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        updateView()
        view.backgroundColor = .white
    }
    
    func updateView() {
        attribute()
        layout()
    }
    
    func attribute() {
        [ captureTopBar, captureImageView, previewTextField ].forEach() { view.addSubview($0) }
        [ cancelButton, saveButton ].forEach() { captureTopBar.addSubview($0) }
        
        captureTopBar.do {
            $0.backgroundColor = .white
        }
        cancelButton.do {
            $0.setTitle("취소", for: .normal)
            $0.titleLabel?.font = .boldSystemFont(ofSize: 15)
            $0.setTitleColor(.systemRed, for: .normal)
            $0.frame = CGRect(x: 20,
                              y: 10,
                              width: 50,
                              height: 50)
        }
        saveButton.do {
            $0.setTitle("저장", for: .normal)
            $0.titleLabel?.font = .boldSystemFont(ofSize: 15)
            $0.setTitleColor(.systemBlue, for: .normal)
            $0.frame = CGRect(x: 300,
                              y: 10,
                              width: 50,
                              height: 50)
            $0.addTarget(self, action: #selector(saveButtonDidTap(sender:)), for: .touchUpInside)
        }
        captureImageView.do {
            $0.backgroundColor = .black
        }
        previewTextField.do {
            $0.backgroundColor = .white
            $0.textColor = .black
        }
    }
    
    func layout() {
        captureTopBar.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 70).isActive = true
        }
        captureImageView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: captureTopBar.bottomAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 500).isActive = true
        }
        previewTextField.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: captureImageView.bottomAnchor, constant: 10).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 70).isActive = true
        }
    }
    
    @objc func saveButtonDidTap(sender: UIButton) {
        presenter?.handOverImageData(photo: captureImageData, memo: previewTextField.text ?? "")
        print("saveButtonDidTap")
//        dismiss(animated: true, completion: nil)
        // 다시 짜기
        tabView.modalPresentationStyle = .fullScreen
        present(tabView, animated: true, completion: nil)
    }
}
extension PreviewViewController: PreviewViewProtocol {
    func showPreviewImage(forImage data: Data) {
        captureImageView.image = UIImage(data: data)
        captureImageData = data
    }
}

