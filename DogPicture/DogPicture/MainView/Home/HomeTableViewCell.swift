//
//  HomeTableViewCell.swift
//  DogPicture
//
//  Created by 김동우 on 2021/09/07.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    static let identifier = "HomeCell"
    
    var cardView = UIView()
    var cellImageView = UIImageView()
    var imageContent = UILabel()
    var imageDate = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .orange
        attribute()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func attribute() {
        [ cardView ].forEach() { contentView.addSubview($0) }
        [ cellImageView, imageContent, imageDate ].forEach() { cardView.addSubview($0) }
        
        cardView.do {
            $0.backgroundColor = .white
            $0.frame = CGRect(x: 20,
                              y: 20,
                              width: 350,
                              height: 420)
            $0.viewRadius(view: cardView, cornerRadius: 30, maskToBounds: true)
            $0.viewShadow(view: cardView)
        }
        imageDate.do {
            $0.tintColor = .lightGray
            $0.font = UIFont.boldSystemFont(ofSize: 15)
            $0.text = "2021년 9월 10일"
        }
        imageContent.do {
            $0.tintColor = .black
            $0.font = UIFont.boldSystemFont(ofSize: 20)
            $0.text = "얼빡샷~"
        }
        layout()
    }
    
    func layout() {
        cellImageView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 350).isActive = true
        }
        imageDate.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: cellImageView.bottomAnchor, constant: 10).isActive = true
            $0.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10).isActive = true
        }
        imageContent.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: imageDate.bottomAnchor, constant: 10).isActive = true
            $0.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10).isActive = true
        }
    }
}
