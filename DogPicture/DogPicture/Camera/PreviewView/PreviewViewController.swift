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
    
    var captureImage = UIImage()
    
    var captureImageData: Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        updateView()
    }
    
    func updateView() {
        attribute()
        layout()
    }
    
    func attribute() {
        [ captureTopBar, captureImageView ].forEach() { view.addSubview($0) }
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
        }
        captureImageView.do {
            $0.backgroundColor = .black
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
            $0.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }
    }
}
extension PreviewViewController: PreviewViewProtocol {
    func showPreviewImage(forImage data: Data) {
        captureImageView.image = UIImage(data: data)
    }
}
