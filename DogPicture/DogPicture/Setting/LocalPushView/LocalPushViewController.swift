//
//  LocalPushViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/10/06.
//

import Foundation
import UIKit

class LocalPushViewController: UIViewController {
    var presenter: LocalPushPresenterProtocol?
    
    var timePicker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        view.backgroundColor = .white
        updateView()
    }
    
    func updateView() {
        attribute()
        layout()
    }
    
    func attribute() {
        [ timePicker ].forEach() { view.addSubview($0) }
        
        timePicker.do {
            $0.dataSource = self
            $0.delegate = self
        }
    }
    
    func layout() {
        timePicker.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 200).isActive = true
        }
    }
    
}

extension LocalPushViewController: LocalPushViewProtocol {
    
}

extension LocalPushViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    
}

extension LocalPushViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "test"
    }
}
