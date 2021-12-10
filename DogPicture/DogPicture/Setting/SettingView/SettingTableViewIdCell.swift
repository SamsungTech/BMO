//
//  SettingTableViewIdCell.swift
//  DogPicture
//
//  Created by 김동우 on 2021/12/05.
//

import Foundation
import UIKit

class SettingTableViewIdCell: UITableViewCell {
    static let identifier = "SettingTableViewIdCell"
    
    let imageButton = UIButton()
    let image = UIImageView()
    let idLabel = UILabel()
    let idPullName = UILabel()
    let pushImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        updateView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView() {
        attribute()
        layout()
    }
    
    func attribute() {
        [ imageButton, idLabel, idPullName, pushImage ].forEach() { self.addSubview($0) }
        imageButton.addSubview(image)
        
        imageButton.do {
            $0.viewRadius(cornerRadius: 35, maskToBounds: false)
            $0.backgroundColor = .lightGray
        }
        image.do {
            $0.tintColor = .white
            $0.image = UIImage(systemName: "camera")
        }
        idLabel.do {
            $0.font = UIFont.boldSystemFont(ofSize: 20)
            $0.text = "dongou705"
            $0.textColor = .black
        }
        idPullName.do {
            $0.font = UIFont.boldSystemFont(ofSize: 15)
            $0.text = "dongou705@naver.com"
            $0.textColor = .lightGray
        }
        pushImage.do {
            $0.tintColor = .lightGray
            $0.image = UIImage(systemName: "chevron.right")
        }
    }
    func layout() {
        
        imageButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 70).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 70).isActive = true
        }
        image.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: imageButton.centerXAnchor).isActive = true
            $0.centerYAnchor.constraint(equalTo: imageButton.centerYAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 40).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 35).isActive = true
        }
        idLabel.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: image.topAnchor, constant: 5).isActive = true
            $0.leadingAnchor.constraint(equalTo: imageButton.trailingAnchor, constant: 10).isActive = true
        }
        idPullName.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: idLabel.bottomAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: imageButton.trailingAnchor, constant: 10).isActive = true
        }
        pushImage.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 20).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 20).isActive = true
        }
    }
}
