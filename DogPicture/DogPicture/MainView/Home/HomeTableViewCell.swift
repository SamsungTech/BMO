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
    var months = UILabel()
    var gradientView = UIView()
    let dogFootImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        updateView()
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView() {
        attribute()
        layout()
    }
    
    func attribute() {
        [ cardView ].forEach() { self.addSubview($0) }
        [ dogFootImage, months, cellImageView, imageContent, imageDate ].forEach() { cardView.addSubview($0) }
        
        cardView.do {
            $0.backgroundColor = .white
            $0.viewRadius(cornerRadius: 20, maskToBounds: false)
            $0.layer.shadowOpacity = 0.5
            $0.layer.shadowColor = UIColor.gray.cgColor
            $0.layer.shadowOffset = CGSize(width: 0, height: 0)
            $0.layer.shadowRadius = 3
            $0.layer.masksToBounds = false
        }
        months.do {
            $0.text = "2년 4개월 25일"
            $0.textColor = .black
            $0.font = UIFont.boldSystemFont(ofSize: 20)
            $0.textAlignment = .left
        }
        dogFootImage.do {
            $0.image = UIImage(named: "dogfootprints")
            $0.tintColor = .systemPink
        }
        cellImageView.do {
            $0.viewRadius(cornerRadius: 25, maskToBounds: true)
        }
        imageDate.do {
            $0.tintColor = .lightGray
            $0.font = UIFont.boldSystemFont(ofSize: 15)
            $0.textColor = .lightGray
            $0.textAlignment = .left
        }
        imageContent.do {
            $0.tintColor = .black
            $0.font = UIFont.boldSystemFont(ofSize: 35)
            $0.textColor = .white
            $0.textAlignment = .left
        }
    }
    
    func layout() {
        cardView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
            $0.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
            $0.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 400).isActive = true
        }
        dogFootImage.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20).isActive = true
            $0.leadingAnchor.constraint(equalTo: cardView.leadingAnchor,constant: 20).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 25).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 25).isActive = true
        }
        months.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerYAnchor.constraint(equalTo: dogFootImage.centerYAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: dogFootImage.trailingAnchor, constant: 10).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 170).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 30).isActive = true
        }
        imageDate.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerYAnchor.constraint(equalTo: months.centerYAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: months.trailingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: cardView.trailingAnchor).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 35).isActive = true
        }
        cellImageView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 60).isActive = true
            $0.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20).isActive = true
            $0.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20).isActive = true
            $0.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -10).isActive = true
        }
        imageContent.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: imageDate.bottomAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20).isActive = true
            $0.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
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
