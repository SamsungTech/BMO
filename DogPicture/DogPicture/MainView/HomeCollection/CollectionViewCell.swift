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
    var dogImageName = UILabel()
    
    var imageName: String = "" {
        didSet {
            print("imageName - didSet()")
            self.dogImageView.image = UIImage(systemName: imageName)
            self.dogImageName.text = imageName
        }
    }
    
    
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
        [ dogImageView, dogImageName ].forEach() { contentView.addSubview($0) }
        
        contentView.do {
            $0.backgroundColor = .yellow
            $0.layer.cornerRadius = 8
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.purple.cgColor
        }
        dogImageName.do {
            $0.font = .boldSystemFont(ofSize: 15)
            $0.textColor = .black
        }
    }
    
    private func layout() {
        dogImageView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
            $0.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 70).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 70).isActive = true
        }
        dogImageName.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: dogImageView.bottomAnchor).isActive = true
            $0.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        }
    }
    
}
