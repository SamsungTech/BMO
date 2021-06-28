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
        chuImage.do {
            $0.frame = view.bounds
        }
    }
    
    func attribute() {
        [ chuImage ] .forEach() { view.addSubview($0) }
        
        chuImage.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
            $0.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 100).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 200).isActive = true
        }
    }
}

extension MemoViewController: MemoViewProtocol {
    func showMemoView(forImage name: String) {
        chuImage.image = UIImage(named: name)
    }
}
