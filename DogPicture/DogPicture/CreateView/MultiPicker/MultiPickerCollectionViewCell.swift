//
//  MultiPickerCollectionViewCell.swift
//  DogPicture
//
//  Created by 김동우 on 2021/12/10.
//

import Foundation
import UIKit

class MultiPickerCollectionViewCell: UICollectionViewCell {
    static let identifier = "MultiPickerCollectionViewCell"
    
    var imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemRed
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    func layout() {
        self.addSubview(imageView)
        
        imageView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        }
    }
}
