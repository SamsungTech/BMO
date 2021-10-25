//
//  HomeEventCell.swift
//  DogPicture
//
//  Created by 김동우 on 2021/10/25.
//

import UIKit

class HomeEventCell: UITableViewCell {
    static let identifier = "HomeEventCell"
    
    let eventShadowView = UIView()
    let eventView = UIView()
    let eventColorView = UIView()
    let eventImage = UIImageView()
    let eventLabel = UILabel()
    let inviteButton = UIButton()
    
    
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
        self.addSubview(eventShadowView)
        eventShadowView.addSubview(eventView)
        [ eventColorView, eventLabel, inviteButton ].forEach() { eventView.addSubview($0) }
        eventColorView.addSubview(eventImage)
        
        eventShadowView.do {
            $0.layer.shadowOpacity = 0.5
            $0.layer.shadowColor = UIColor.gray.cgColor
            $0.layer.shadowOffset = CGSize(width: 0, height: 0)
            $0.layer.shadowRadius = 3
            $0.layer.masksToBounds = false
        }
        eventView.do {
            $0.backgroundColor = .white
            $0.viewRadius(view: eventView, cornerRadius: 20, maskToBounds: true)
        }
        eventColorView.do {
            $0.backgroundColor = .systemYellow
        }
        eventImage.do {
            $0.image = UIImage(named: "eventImage")
            $0.contentMode = .scaleAspectFit
        }
        eventLabel.do {
            $0.font = UIFont.boldSystemFont(ofSize: 14)
            $0.textAlignment = .left
            $0.textColor = .black
            $0.text = "더 많은 가족과 친구들을 초대하여 강쥐들의 소중한 추억을 안전하게 공유하세요!"
            $0.numberOfLines = 2
        }
        inviteButton.do {
            $0.setTitle("초대", for: .normal)
            $0.setTitleColor(UIColor.systemBlue, for: .normal)
        }
    }
    
    func layout() {
        eventShadowView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
            $0.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
            $0.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 140).isActive = true
        }
        eventView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
            $0.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
            $0.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 140).isActive = true
        }
        eventColorView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: eventView.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: eventView.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: eventView.trailingAnchor).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 100).isActive = true
        }
        eventImage.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: eventView.topAnchor).isActive = true
            $0.centerXAnchor.constraint(equalTo: eventView.centerXAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 150).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 100).isActive = true
        }
        eventLabel.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: eventColorView.bottomAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: eventView.leadingAnchor, constant: 10).isActive = true
            $0.trailingAnchor.constraint(equalTo: eventView.trailingAnchor, constant: -80).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        }
        inviteButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerYAnchor.constraint(equalTo: eventLabel.centerYAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: eventView.trailingAnchor, constant: -10).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 40).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 30).isActive = true
        }
    }
    
}
