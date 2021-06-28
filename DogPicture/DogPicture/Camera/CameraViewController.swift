//
//  CameraViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/06/25.
//

import UIKit

class CameraViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension CameraViewController: CameraViewControllerProtocol {
    var presenter: CameraPresenterProtocol? {
        get {
            <#code#>
        }
        set {
            <#code#>
        }
    }
    
    
}
