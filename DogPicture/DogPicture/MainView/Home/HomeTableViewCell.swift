//
//  HomeTableViewCell.swift
//  DogPicture
//
//  Created by 김동우 on 2021/05/28.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    static let id = "HomeTableViewCell"
    var ImageView: UIImageView?
    var label: UILabel?
    
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "chu2")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .orange
        contentView.addSubview(myImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let imageSize = contentView.frame.size.height-5
        
        myImageView.frame = CGRect(x: contentView.frame.size.width-imageSize, y: 3, width: imageSize, height: imageSize)
    }
//    
//    func setData(data: 정보들) {
//        imageView?.image = data.imageURL
//        label?.text = data.tex
//    }
}
