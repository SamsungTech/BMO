//
//  HomeViewCollectionViewCell.swift
//  DogPicture
//
//  Created by 김동우 on 2021/08/15.
//

import UIKit

class HomeViewCollectionViewCell: UICollectionViewCell {
    static let identifier = "HomeViewCollectionViewCell"
    
    private let myImageView = UIImageView()
    private let myLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemPink
        contentView.clipsToBounds = true
        createImageViewAndLabel()
    }
    
    func createImageViewAndLabel() {
        [ myImageView, myLabel ].forEach() { contentView.addSubview($0) }
        
        myImageView.do {
            $0.image = UIImage(systemName: "house")
            $0.backgroundColor = .yellow
            $0.contentMode = .scaleAspectFit
            $0.clipsToBounds = true
            
        }
        myLabel.do {
            $0.text = "Custom"
            $0.backgroundColor = .green
            $0.textAlignment = .center
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init gas not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews() // ??
        
        myLabel.frame = CGRect(x: 5,
                               y: contentView.frame.size.height-50,
                               width: contentView.frame.size.width-10,
                               height: 50)
        
        myImageView.frame = CGRect(x: 5,
                               y: 0,
                               width: contentView.frame.size.width-10,
                               height: contentView.frame.size.height-50)
    }
    
    public func configure(label: String) {
        myLabel.text = label
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myLabel.text = nil
    }
}
