//
//  HomeFooterCell.swift
//  DogPicture
//
//  Created by 김동우 on 2021/10/21.
//

import UIKit

class HomeFooterCell: UITableViewCell {
    static let identifier = "HomeFooterCell"
    
    let footerView = UIView()
    let footerImage = UIImageView()
    let footerLabel = UILabel()
    
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
        self.addSubview(footerView)
        [ footerImage, footerLabel ].forEach() { footerView.addSubview($0) }
        
        footerView.do {
            $0.backgroundColor = .clear
        }
        footerImage.do {
            $0.image = UIImage(named: "footerImage")?.withRenderingMode(.alwaysTemplate)
            $0.tintColor = .lightGray
        }
        footerLabel.do {
            $0.text = "없어! 돌아가개..."
            $0.textAlignment = .center
            $0.font = UIFont.boldSystemFont(ofSize: 15)
            $0.textColor = .lightGray
        }
    }
    
    func layout() {
        footerView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        }
        footerImage.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 20).isActive = true
            $0.centerXAnchor.constraint(equalTo: footerView.centerXAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 50).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        footerLabel.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: footerImage.bottomAnchor).isActive = true
            $0.centerXAnchor.constraint(equalTo: footerView.centerXAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 200).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
    }
}
