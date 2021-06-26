//
//  HomeTableViewCell.swift
//  DogPicture
//
//  Created by 김동우 on 2021/05/28.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    static let id = "HomeTableViewCell"
    var chuImageView = UIImageView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureImageView()
        setImageConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImageView() {
        chuImageView.do {
            $0.layer.cornerRadius = 10
            $0.clipsToBounds = true
            
        }
    }
    
    func setImageConstraints() {
        [ chuImageView ] .forEach() { addSubview($0) }
        
        chuImageView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            $0.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 190).isActive = true
            $0.widthAnchor.constraint(equalTo: chuImageView.heightAnchor).isActive = true
        }
    }
}


