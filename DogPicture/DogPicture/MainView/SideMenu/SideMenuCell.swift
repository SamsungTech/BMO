//
//  SideMenuCell.swift
//  DogPicture
//
//  Created by 김동우 on 2021/10/22.
//

import Foundation
import UIKit

class SideMenuCell: UITableViewCell {
    static let identifier = "SideMenuCell"
    
    let sideCellView = UIView()
    var sideImage = UIImageView()
    var sideDogName = UILabel()
    var sideDogDays = UILabel()
    
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
        self.addSubview(sideCellView)
        [ sideImage, sideDogName, sideDogDays ].forEach() { sideCellView.addSubview($0) }
        
        sideCellView.do {
            $0.backgroundColor = .systemPink
            $0.viewRadius(view: sideCellView, cornerRadius: 10, maskToBounds: true)
        }
        sideImage.do {
            $0.image = UIImage(named: "p4")
            $0.viewRadius(view: sideImage, cornerRadius: 30, maskToBounds: true)
            $0.layer.borderColor = UIColor.systemBlue.cgColor
            $0.layer.borderWidth = 3
        }
        sideDogName.do {
            $0.text = "쁘띠"
            $0.textAlignment = .left
            $0.textColor = .white
            $0.font = UIFont.boldSystemFont(ofSize: 20)
        }
        sideDogDays.do {
            $0.text = "생후 2040일"
            $0.textAlignment = .left
            $0.textColor = .lightGray
            $0.font = UIFont.boldSystemFont(ofSize: 15)
        }
    }
    
    func layout() {
        sideCellView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
            $0.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
            $0.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        }
        sideImage.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerYAnchor.constraint(equalTo: sideCellView.centerYAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: sideCellView.leadingAnchor, constant: 10).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 60).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 60).isActive = true
        }
        sideDogName.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: sideCellView.topAnchor, constant: 20).isActive = true
            $0.leadingAnchor.constraint(equalTo: sideImage.trailingAnchor, constant: 10).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 100).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 30).isActive = true
        }
        sideDogDays.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: sideDogName.bottomAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: sideImage.trailingAnchor, constant: 10).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 100).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 30).isActive = true
        }
    }
}
