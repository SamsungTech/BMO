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
    
    var timePicker = UIDatePicker()
    let saveButton = UIButton()
    let cancelButton = UIButton()
    let titleLabel = UILabel()
    
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
        [ cancelButton, titleLabel, saveButton, timePicker ].forEach() { view.addSubview($0) }
        
        cancelButton.do {
            $0.setTitle("취소", for: .normal)
            $0.setTitleColor(UIColor.systemBlue, for: .normal)
            $0.addTarget(self, action: #selector(cancelButtonDidTap(sender:)), for: .touchUpInside)
        }
        titleLabel.do {
            $0.text = "알람 편집"
            $0.textColor = .systemPink
            $0.textAlignment = .center
        }
        saveButton.do {
            $0.setTitle("저장", for: .normal)
            $0.setTitleColor(UIColor.systemBlue, for: .normal)
            $0.addTarget(self, action: #selector(saveButtonDidTap(sender:)), for: .touchUpInside)
        }
        timePicker.do {
            $0.backgroundColor = UIColor.white
            $0.datePickerMode = .time
            $0.addTarget(self, action: #selector(handleDatePicker(sender:)), for: .valueChanged)
            if #available(iOS 13.4, *) {
                $0.preferredDatePickerStyle = .automatic
            } else {
                // Fallback on earlier versions
            }
            $0.sizeToFit()
        }
    }
    
    func layout() {
        cancelButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 100).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 80).isActive = true
        }
        titleLabel.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            $0.centerYAnchor.constraint(equalTo: cancelButton.centerYAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 150).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 70).isActive = true
        }
        saveButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 100).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 80).isActive = true
        }
        timePicker.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 30).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 200).isActive = true
        }
    }
    @objc func handleDatePicker(sender: UIDatePicker) {
        print(sender.date)
    }
    @objc func saveButtonDidTap(sender: UIButton) {
        
    }
    @objc func cancelButtonDidTap(sender: UIButton) {
        presenter?.cancelButtonClicked()
    }
}

extension LocalPushViewController: LocalPushViewProtocol {
    
}
