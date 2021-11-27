//
//  MainViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/11/22.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    var presenter: MainPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension MainViewController: MainViewProtocol {
    
}
