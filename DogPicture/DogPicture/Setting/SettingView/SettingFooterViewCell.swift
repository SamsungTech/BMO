//
//  SettingFooterView.swift
//  DogPicture
//
//  Created by 김동우 on 2021/12/08.
//

import Foundation
import UIKit

class SettingFooterViewCell: UITableViewCell {
    
    static let identifier = "SettingFooterViewCell"
    
    let dogPictureImageView = UIImageView()
    let dogPictureLabel = UILabel()
    var versionLabel = UILabel()
    
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
        [ dogPictureImageView, dogPictureLabel, versionLabel ].forEach() { self.addSubview($0) }
        
        dogPictureImageView.do {
            $0.image = UIImage(named: "footerImage")?.withRenderingMode(.alwaysTemplate)
            $0.tintColor = .lightGray
        }
        dogPictureLabel.do {
            $0.font = UIFont.boldSystemFont(ofSize: 13)
            $0.text = "Dog Picture"
            $0.textColor = .lightGray
        }
        versionLabel.do {
            $0.font = UIFont.boldSystemFont(ofSize: 12)
            $0.text = "1.0.0"
            $0.textColor = .lightGray
        }
    }
    
    func layout() {
        dogPictureImageView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
            $0.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 80).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 80).isActive = true
        }
        dogPictureLabel.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: dogPictureImageView.bottomAnchor).isActive = true
            $0.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        }
        versionLabel.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: dogPictureLabel.bottomAnchor).isActive = true
            $0.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        }
    }
}
