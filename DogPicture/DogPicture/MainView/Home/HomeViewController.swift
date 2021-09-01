//
//  HomeViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/05/28.
//

import UIKit
import Then

// 컬렉션 뷰 ㄴㄴ
//

class HomeViewController: UIViewController {
    var presenter: HomePresenterProtocol?
    
    var segmentedScrollView = UIScrollView()
    var segmentedScrollContentView = UIView()
    var segmentedStackView = UIStackView()
    var segmentedButton: [UIButton] = []
    var segmentedSelectorView = UIView()
    let segmentedButtonTitles = ["1월", "2월", "3월", "4월", "5월",
                                 "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
    
    var textColor: UIColor = .black
    var selectroViewColor: UIColor = .red
    var selectorTextColor: UIColor = .red
    
    var tagNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        view.backgroundColor = .white
        segmentedUpdateView()
    }
    
    
    func segmentedUpdateView() {
        attributeSegmentedControl()
        configSegmentedControl()
    }
    
    func attributeSegmentedControl() {
        view.addSubview(segmentedScrollView)
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
    
    func configSegmentedControl() {
        segmentedScrollView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 70).isActive = true
        }
        
        segmentedScrollContentView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: segmentedScrollView.safeAreaLayoutGuide.topAnchor).isActive = true
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
        presenter?.calenderDidTap(tag: sender.tag)
    }
}

extension HomeViewController: HomeViewProtocol {
    func showChu(chu: [UIImage?]) {
        print(chu)
    }
    
    func segmentDidChanged() {
        print("뷰관련 동작인 애니메이션 등등..")
    }
    
    func segmentAnimation() { // viper 재정리
        presenter?.segmentAnimation()
    }
    
    func refershCalender(tag: Int) {
        for btn in segmentedButton {
            btn.setTitleColor(textColor, for: .normal)
            if tag == btn.tag {
                btn.setTitleColor(selectorTextColor, for: .normal)
            }
        }
    }
}
