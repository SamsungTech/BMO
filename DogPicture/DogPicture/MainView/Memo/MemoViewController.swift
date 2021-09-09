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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        updateView()
        
    }
    
    func updateView() {
        layout()
        attribute()
    }
    
    func attribute() {
        dogImage.do {
            $0.frame = view.bounds
        }
    }
    
    func layout() {
        [ dogImage ] .forEach() { view.addSubview($0) }
        
        dogImage.do {
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
        dogImage.image = UIImage(named: name)
    }
}
