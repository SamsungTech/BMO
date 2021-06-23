//
//  MemoViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/05/28.
//

import UIKit

class MemoViewController: UIViewController {
    var presenter: MemoViewPresenterProtocol?
    
    var chuImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        layout()
        attribute()
    }
    
    func layout() {
        
    }
    
    func attribute() {
        
    }
}
