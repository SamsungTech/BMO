//
//  CollectionViewCell.swift
//  DogPicture
//
//  Created by 김동우 on 2021/11/22.
//

import Foundation
import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let indentifier = "HomeColletionViewCell"
    
    var dogImageView = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateView() {
        attribute()
        layout()
    }
    
    private func attribute() {
        [ dogImageView ].forEach() { contentView.addSubview($0) }
        
        contentView.do {
            $0.backgroundColor = .white
        }
    }
    
    private func layout() {
        dogImageView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        }
    }
    
}
