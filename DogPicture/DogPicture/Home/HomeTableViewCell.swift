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
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    
//    func setData(data: 정보들) {
//        imageView?.image = data.imageURL
//        label?.text = data.tex
//    }
}
