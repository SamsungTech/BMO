//
//  HomeViewHeaderFooter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/09/02.
//

import UIKit

class HomeViewTableHeader: UITableViewHeaderFooterView {
    static let indentifier = "TableHeader"
    
    var randomImageView = UIImageView()
    var randomImageLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        attribute()
        self.backgroundColor = .systemPink
    }
    
    func attribute() {
        randomImageView.do {
            $0.contentMode = .scaleAspectFit
            $0.image = UIImage(named: "chu2") // 랜덤 Image 로직 추가예정
            $0.frame = CGRect(x: 0,
                              y: 0,
                              width: contentView.frame.size.width,
                              height: contentView.frame.size.height)
        }
        randomImageLabel.do {
            $0.text = "#이미지뷰#랜덤이미지" // 랜덤 text 로직 추가예정
            $0.font = .systemFont(ofSize: 22, weight: .semibold)
            $0.textAlignment = .center
            $0.sizeToFit()
            $0.frame = CGRect(x: 0,
                              y: contentView.frame.size.height-10-randomImageLabel.frame.size.height,
                              width: 100,
                              height: 50)
        }
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        [ randomImageView, randomImageLabel ].forEach() { contentView.addSubview($0) }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
