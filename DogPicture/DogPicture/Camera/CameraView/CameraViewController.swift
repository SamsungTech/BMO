//
//  CameraViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/06/25.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {
    var presenter: CameraPresenterProtocol?
    
    let captureSession = AVCaptureSession()
    let captureButton = UIButton()
    let photoView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        self.view.backgroundColor = .white
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func updateView() {
        attribute()
        layout()
    }
    
    func attribute() {
        [ photoView ].forEach() { view.addSubview($0) }
        [ captureButton ].forEach() { photoView.addSubview($0) }
        
        photoView.do {
            $0.backgroundColor = .black
        }
        
        captureButton.do {
            $0.layer.cornerRadius = 50
            $0.layer.borderWidth = 10
            $0.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    func layout() {
        photoView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }
        captureButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 100).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 100).isActive = true
        }
    }
}

extension CameraViewController: CameraViewProtocol {
    
}

extension CameraViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        
    }
}



