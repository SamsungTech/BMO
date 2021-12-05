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
    var cardShadowView = UIView()
    var cellImageView = UIImageView()
    let dateImage = UIImageView()
    var imageContent = UILabel()
    var imageDate = UILabel()
    var months = UILabel()
    var gradientView = UIView()
    let dogFootImage = UIImageView()
    var likeButton = UIButton()
    var likeImage = UIImageView()
    var commentButton = UIButton()
    var commentImage = UIImageView()
    
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
        [ cardView, cardShadowView, dateImage, months, imageDate ].forEach() { self.addSubview($0) }
        [ dogFootImage, cellImageView, imageContent, likeButton, commentButton ].forEach() { cardView.addSubview($0) }
        likeButton.addSubview(likeImage)
        commentButton.addSubview(commentImage)
        self.bringSubviewToFront(cardView)
        
        cardView.do {
            $0.backgroundColor = .white
            $0.viewRadius(cornerRadius: 20, maskToBounds: true)
        }
        cardShadowView.do {
            $0.backgroundColor = .white
            $0.viewRadius(cornerRadius: 20, maskToBounds: false)
            $0.layer.shadowColor = UIColor.black.cgColor
            $0.layer.shadowOffset = CGSize(width: 1, height: 1)
            $0.layer.shadowRadius = 30
            $0.layer.shadowOpacity = 0.4
        }
        months.do {
            $0.text = "생후 542일"
            $0.textColor = .black
            $0.alpha = 0.9
            $0.font = UIFont.boldSystemFont(ofSize: 16)
            $0.textAlignment = .left
        }
        dogFootImage.do {
            $0.image = UIImage(named: "dogfootprints")
            $0.tintColor = .systemPink
        }
        dateImage.do {
            $0.tintColor = .systemPink
            $0.image = UIImage(systemName: "circle.fill")
        }
        imageDate.do {
            $0.font = UIFont.boldSystemFont(ofSize: 16)
            $0.textColor = .lightGray
            $0.textAlignment = .left
        }
        imageContent.do {
            $0.font = UIFont.boldSystemFont(ofSize: 15)
            $0.textColor = .black
            $0.alpha = 0.9
            $0.textAlignment = .left
        }
        likeButton.do {
            $0.addTarget(self, action: #selector(likeButtonDidTap(sender:)), for: .touchUpInside)
        }
        likeImage.do {
            $0.image = UIImage(systemName: "heart.fill")
            $0.tintColor = .systemGray
        }
        commentImage.do {
            $0.tintColor = .systemGray
            $0.image = UIImage(systemName: "ellipsis.bubble.fill")
        }
    }
    
    func layout() {
        cardView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            $0.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.maxX-40).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 400).isActive = true
        }
        cardShadowView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
            $0.centerYAnchor.constraint(equalTo: cardView.centerYAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 300).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 300).isActive = true
        }
        dateImage.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10).isActive = true
            $0.centerYAnchor.constraint(equalTo: months.centerYAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 10).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 10).isActive = true
        }
        months.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.bottomAnchor.constraint(equalTo: cardView.topAnchor, constant: -10).isActive = true
            $0.leadingAnchor.constraint(equalTo: dateImage.trailingAnchor, constant: 5).isActive = true
        }
        imageDate.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.bottomAnchor.constraint(equalTo: cardView.topAnchor, constant: -10).isActive = true
            $0.leadingAnchor.constraint(equalTo: months.trailingAnchor, constant: 10).isActive = true
        }
        cellImageView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: cardView.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: cardView.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: cardView.trailingAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -90).isActive = true
        }
        imageContent.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: cellImageView.bottomAnchor, constant: 15).isActive = true
            $0.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20).isActive = true
        }
        likeButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 15).isActive = true
            $0.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -10).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 30).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 30).isActive = true
        }
        likeImage.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: likeButton.centerXAnchor).isActive = true
            $0.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 25).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 25).isActive = true
        }
        commentButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 20).isActive = true
            $0.centerYAnchor.constraint(equalTo: likeImage.centerYAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 30).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 30).isActive = true
        }
        commentImage.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: commentButton.centerXAnchor).isActive = true
            $0.centerYAnchor.constraint(equalTo: commentButton.centerYAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 25).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 23).isActive = true
        }
    }
}
extension HomeTableViewCell {
    @objc func likeButtonDidTap(sender: UIButton) {
        likeImage.tintColor = .systemPink
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
