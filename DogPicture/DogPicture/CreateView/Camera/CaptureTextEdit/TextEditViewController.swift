//
//  TextEditViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/12/03.
//

import UIKit

class TextEditViewController: UIViewController {
    var presenter: TextEditPresenterProtocol?
    
    var topBar = UIView()
    let popButton = UIButton()
    let popLabel = UILabel()
    var dateLabel = UILabel()
    let completeButton = UIButton()
    let completeLabel = UILabel()
    
    var textFiled = UITextField()
    
    var textFiledData = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        view.backgroundColor = .white
    }
    
    func updateView() {
        attribute()
        layout()
    }
    
    func attribute() {
        [ topBar, textFiled ].forEach() { view.addSubview($0) }
        [ popButton, dateLabel, completeButton].forEach() { topBar.addSubview($0) }
        popButton.addSubview(popLabel)
        completeButton.addSubview(completeLabel)
        
        topBar.do {
            $0.backgroundColor = .white
            $0.viewShadow()
        }
        popButton.do {
            $0.addTarget(self, action: #selector(popButtonDidTap(sender:)), for: .touchUpInside)
        }
        popLabel.do {
            $0.textColor = .darkGray
            $0.font = UIFont.boldSystemFont(ofSize: 15)
            $0.text = "이전"
        }
        dateLabel.do {
            $0.text = "0000년 00월 00일"
        }
        completeButton.do {
            $0.addTarget(self, action: #selector(completeButtonDidTap(sender:)), for: .touchUpInside)
        }
        completeLabel.do {
            $0.textColor = .darkGray
            $0.font = UIFont.boldSystemFont(ofSize: 15)
            $0.text = "완료"
        }
        textFiled.do {
            $0.placeholder = "쁘띠의 이야기를 적어주세요~"
            $0.textColor = .darkGray
            $0.font = UIFont.boldSystemFont(ofSize: 15)
            $0.backgroundColor = .white
        }
    }
    
    func layout() {
        topBar.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 90).isActive = true
        }
        popButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.leadingAnchor.constraint(equalTo: topBar.leadingAnchor, constant: 5).isActive = true
            $0.bottomAnchor.constraint(equalTo: topBar.bottomAnchor, constant: -5).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 40).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        }
        popLabel.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: popButton.centerXAnchor).isActive = true
            $0.centerYAnchor.constraint(equalTo: popButton.centerYAnchor).isActive = true
        }
        dateLabel.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: topBar.centerXAnchor).isActive = true
            $0.centerYAnchor.constraint(equalTo: popButton.centerYAnchor).isActive = true
        }
        completeButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.trailingAnchor.constraint(equalTo: topBar.trailingAnchor, constant: -5).isActive = true
            $0.bottomAnchor.constraint(equalTo: topBar.bottomAnchor, constant: -5).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 40).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        }
        completeLabel.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: completeButton.centerXAnchor).isActive = true
            $0.centerYAnchor.constraint(equalTo: completeButton.centerYAnchor).isActive = true
        }
        textFiled.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: topBar.bottomAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }
    }
}

extension TextEditViewController {
    @objc func popButtonDidTap(sender: UIButton) {
        presenter?.popButtonCilcked()
    }
    @objc func completeButtonDidTap(sender: UIButton) {
        guard let text = textFiled.text else { return }
        presenter?.completeButtonCilcked(text: text)
    }
}

extension TextEditViewController: TextEditViewControllerProtocol {
    
}
