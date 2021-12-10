//
//  PreviewCollectionViewCell.swift
//  DogPicture
//
//  Created by 김동우 on 2021/12/02.
//

import UIKit

class PreviewCollectionViewCell: UICollectionViewCell {
    static let indentifier = "PreviewCollectionViewCell"
    
    var imageView = UIImageView()
    var selectedLine = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        [ imageView, selectedLine ].forEach() { self.addSubview($0) }
        self.bringSubviewToFront(selectedLine)
        
        selectedLine.do {
            $0.isHidden = true
            $0.backgroundColor = .clear
            $0.layer.borderWidth = 5
            $0.layer.borderColor = UIColor.systemYellow.cgColor
        }
    }
    
    func layout() {
        imageView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.maxX).isActive = true
            $0.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        }
    }
    
}
