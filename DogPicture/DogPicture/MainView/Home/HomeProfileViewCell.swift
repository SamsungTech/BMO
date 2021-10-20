//
//  HomeProfileViewCell.swift
//  DogPicture
//
//  Created by 김동우 on 2021/10/20.
//

import UIKit

class HomeProfileViewCell: UITableViewCell {
    static let identifier = "ProfileViewCell"
    
    let profileView = UIView()
    var profileImage = UIImageView()
    var dogName = UILabel()
    var dogDaysAndType = UILabel()
    let gradient = CAGradientLayer()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        updateView()
        self.do {
            $0.gradient.frame = profileView.frame
            $0.gradient.colors = [UIColor.systemRed.cgColor, UIColor.systemPink.cgColor,
                                  UIColor.systemYellow.cgColor]
            $0.profileView.layer.addSublayer(self.gradient)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView() {
        attribute()
        layout()
    }
    
    func attribute() {
        self.addSubview(profileView)
        [ profileImage, dogName, dogDaysAndType ].forEach() { profileView.addSubview($0) }
        
        profileView.do {
            $0.backgroundColor = .systemPink
            $0.viewRadius(view: profileView, cornerRadius: 20, maskToBounds: true)
            $0.layer.shadowOpacity = 0.5
            $0.layer.shadowColor = UIColor.black.cgColor
            $0.layer.shadowOffset = CGSize(width: 0, height: 0)
            $0.layer.shadowRadius = 5
            $0.layer.masksToBounds = false
        }
        profileImage.do {
            $0.viewRadius(view: profileImage, cornerRadius: 30, maskToBounds: true)
            $0.layer.borderColor = UIColor.white.cgColor
            $0.layer.borderWidth = 3
        }
        dogName.do {
            $0.textAlignment = .left
            $0.textColor = .white
            $0.font = UIFont.boldSystemFont(ofSize: 19)
        }
        dogDaysAndType.do {
            $0.textAlignment = .left
            $0.textColor = .white
            $0.font = UIFont.boldSystemFont(ofSize: 15)
        }
    }
    
    func layout() {
        profileView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
            $0.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
            $0.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 80).isActive = true
        }
        profileImage.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerYAnchor.constraint(equalTo: profileView.centerYAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: profileView.leadingAnchor, constant: 20).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 60).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 60).isActive = true
        }
        dogName.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: profileView.topAnchor, constant: 10).isActive = true
            $0.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 15).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 100).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 30).isActive = true
        }
        dogDaysAndType.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: dogName.bottomAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 15).isActive = true
            $0.trailingAnchor.constraint(equalTo: profileView.trailingAnchor).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 30).isActive = true
        }
    }
}
