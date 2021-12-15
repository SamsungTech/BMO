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
    var selectedPhotoLayerView = UIView()
    var isTouched: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemRed
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    func attribute() {
        [ imageView, selectedPhotoLayerView ].forEach() { self.addSubview($0) }
        
        selectedPhotoLayerView.do {
            $0.backgroundColor = .clear
            $0.layer.borderWidth = 5.0
            $0.layer.borderColor = UIColor.systemYellow.cgColor
            $0.isHidden = true
            self.bringSubviewToFront(selectedPhotoLayerView)
        }
    }
    
    func layout() {
        imageView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        }
        selectedPhotoLayerView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        }
    }
    
    
    func selectedCell() {
        
    }
}

extension MultiPickerCollectionViewCell {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if isTouched == false {
            selectedCellAnimate(isTouched: true)
            isTouched = true
        } else {
            selectedCellAnimate(isTouched: false)
            isTouched = false
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        selectedCellAnimate(isTouched: false)
    }
    
    private func selectedCellAnimate(isTouched: Bool) {
        if isTouched {
            MultiPickerCollectionViewCell.animate(withDuration: 0.5,
                                      delay: 0,
                                      usingSpringWithDamping: 1,
                                      initialSpringVelocity: 1,
                                      options: [.allowUserInteraction],
                                      animations: {
                self.selectedPhotoLayerView.isHidden = false
                self.layoutIfNeeded()
            }, completion: nil)
        } else {
            MultiPickerCollectionViewCell.animate(withDuration: 0.5,
                                      delay: 0,
                                      usingSpringWithDamping: 1,
                                      initialSpringVelocity: 0,
                                      options: .allowUserInteraction,
                                      animations: { self.selectedPhotoLayerView.isHidden = true },
                                      completion: nil)
        }
    }
}
