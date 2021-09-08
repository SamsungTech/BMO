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
        cardView.addSubview(cellImageView)
        
        cardView.do {
            $0.backgroundColor = .systemPink
            $0.frame = CGRect(x: 20,
                              y: 20,
                              width: 350,
                              height: 350)
            $0.viewRadius(view: cardView, cornerRadius: 30, maskToBounds: true)
            $0.viewShadow(view: cardView)
        }
        layout()
        
    }
    func layout() {
        cellImageView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        }
    }
}
