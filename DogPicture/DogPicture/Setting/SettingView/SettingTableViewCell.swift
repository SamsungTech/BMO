//
//  SettingTableViewCell.swift
//  DogPicture
//
//  Created by 김동우 on 2021/12/05.
//

import Foundation
import UIKit

class SettingTableViewCell: UITableViewCell {
    static let identifier = "SettingTableViewCell"
    
    var settingImage = UIImageView()
    var settingLabel = UILabel()
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
        [ settingImage, settingLabel, pushImage ].forEach() { self.addSubview($0) }
        
        settingImage.do {
            $0.viewRadius(cornerRadius: 8, maskToBounds: false)
        }
        settingLabel.do {
            $0.textColor = .darkGray
            $0.font = UIFont.boldSystemFont(ofSize: 17)
        }
        pushImage.do {
            $0.tintColor = .lightGray
            $0.image = UIImage(systemName: "chevron.right")
        }
    }
    func layout() {
        settingImage.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 30).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 30).isActive = true
        }
        settingLabel.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: settingImage.trailingAnchor, constant: 20).isActive = true
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
