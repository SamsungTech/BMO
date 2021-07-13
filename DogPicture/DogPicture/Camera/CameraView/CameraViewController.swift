//
//  CameraViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/06/25.
//

import UIKit

class CameraViewController: UIViewController {
    
    let captureButton = UIButton()
    let photoViewButton = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        layout()
    }
    
    func attribute() {
        captureButton.do {
            $0.frame(forAlignmentRect: CGRect(x: 0, y: 0, width: 100, height: 100))
            $0.layer.cornerRadius = 50
            $0.layer.borderWidth = 10
            $0.layer.borderColor = UIColor.white.cgColor
            
        }
        photoViewButton.do {
            $0.frame = view.bounds
        }
    }
    
    func layout() {
        [ captureButton, photoViewButton ] .forEach() { view.addSubview($0) }
        
        captureButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            
        }
        
        photoViewButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            
        }
    }
}

extension CameraViewController: CameraViewControllerProtocol {
    var presenter: CameraPresenterProtocol? {
        get {
            
        } set {
            
        }
    }
}

extension CameraViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        
    }
}



