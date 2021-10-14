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
        attribute()
        layout()
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func resetTransform() {
        transform = .identity
    }
    
    func attribute() {
        [ cardView ].forEach() { self.addSubview($0) }
        [ cellImageView, imageContent, imageDate ].forEach() { cardView.addSubview($0) }
        
        cardView.do {
            $0.backgroundColor = .white
            $0.frame = CGRect(x: 20,
                              y: 20,
                              width: UIScreen.main.bounds.maxX*(350/390),
                              height: UIScreen.main.bounds.maxY*(420/844))
            $0.viewRadius(view: cardView, cornerRadius: 30, maskToBounds: true)
        }
        imageDate.do {
            $0.tintColor = .lightGray
            $0.font = UIFont.boldSystemFont(ofSize: 15)
            $0.textColor = .darkGray
        }
        imageContent.do {
            $0.tintColor = .black
            $0.font = UIFont.boldSystemFont(ofSize: 20)
            $0.textColor = .black
        }
    }
    
    func layout() {
        cellImageView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            $0.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.maxY*(350/844)).isActive = true
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

extension HomeTableViewCell {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        bounceAnimate(isTouched: true)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        bounceAnimate(isTouched: false)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        bounceAnimate(isTouched: false)
    }
    
    private func bounceAnimate(isTouched: Bool) {
        if isTouched {
            HomeTableViewCell.animate(withDuration: 0.5,
                                      delay: 0,
                                      usingSpringWithDamping: 1,
                                      initialSpringVelocity: 1,
                                      options: [.allowUserInteraction],
                                      animations: {
                self.cardView.transform = .init(scaleX: 0.96, y: 0.96)
                self.layoutIfNeeded()
            }, completion: nil)
        } else {
            HomeTableViewCell.animate(withDuration: 0.5,
                                      delay: 0,
                                      usingSpringWithDamping: 1,
                                      initialSpringVelocity: 0,
                                      options: .allowUserInteraction,
                                      animations: { self.cardView.transform = .identity },
                                      completion: nil)
        }
    }
}
