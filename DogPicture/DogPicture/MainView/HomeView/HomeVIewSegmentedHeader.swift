//
//  HomeVIewSegmentedHeader.swift
//  DogPicture
//
//  Created by 김동우 on 2021/09/02.
//

import UIKit

class HomeViewSegmentedHeader: UITableViewHeaderFooterView {
    static let identifier = "SegmentedHeader"
    
    var segmentedScrollView = UIScrollView()
    var segmentedScrollContentView = UIView()
    var segmentedStackView = UIStackView()
    var segmentedButton: [UIButton] = []
    let segmentedButtonTitles = ["1월", "2월", "3월", "4월", "5월",
                                 "6월", "7월", "8월", "9월", "10월",
                                 "11월", "12월"]
    var tagNumber = 0
    var textColor: UIColor = .black
    var selectorTextColor: UIColor = .red
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        createViews()
        layout()
    }
    
    func createViews() {
        self.addSubview(segmentedScrollView)
        segmentedScrollView.addSubview(segmentedScrollContentView)
        segmentedScrollContentView.addSubview(segmentedStackView)
        
        segmentedScrollView.do {
            $0.backgroundColor = .systemBlue
            $0.contentSize = CGSize(width: 840, height: 70)
        }
        
        segmentedStackView.do {
            $0.backgroundColor = .systemGreen
            $0.axis = .horizontal
            $0.alignment = .fill
            $0.distribution = .fillEqually
        }
        for buttonTitles in segmentedButtonTitles {
            let button = UIButton(type: .system)
            button.do {
                $0.tag = tagNumber
                $0.setTitle(buttonTitles, for: .normal)
                $0.addTarget(self,
                             action: #selector(segmentLineAnimation(sender:)),
                             for: .touchUpInside)
                $0.setTitleColor(textColor, for: .normal)
            }
            segmentedStackView.addArrangedSubview(button)
            segmentedButton.append(button)
            tagNumber += 1
        }
        segmentedButton[0].setTitleColor(selectorTextColor, for: .normal)
    }
    
    func layout() {
        segmentedScrollView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 70).isActive = true
        }
        
        segmentedScrollContentView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: segmentedScrollView.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: segmentedScrollView.leadingAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: segmentedScrollView.frameLayoutGuide.bottomAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: segmentedScrollView.contentSize.width).isActive = true
        }
        
        segmentedStackView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: segmentedScrollContentView.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: segmentedScrollContentView.leadingAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: CGFloat(segmentedButtonTitles.count*70)).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
    }
    
    @objc func segmentLineAnimation(sender: UIButton) {
        for btn in segmentedButton {
            btn.setTitleColor(textColor, for: .normal)
            if tag == btn.tag {
                btn.setTitleColor(selectorTextColor, for: .normal)
            }
        }
    }
}
