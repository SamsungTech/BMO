//
//  HomeCustomSegmentControl.swift
//  DogPicture
//
//  Created by 김동우 on 2021/08/18.
//

import UIKit

class HomeCustomSegmentControl: UIView {
    private var buttonTitles: [String]!
    private var buttons: [UIButton]!
    var textColor: UIColor = .black
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 기본적인 뷰 설정
        
        
    }
    
    // 데이터를 뷰에 적용 할때
    convenience init(frame: CGRect, buttonTitle: [String]) {
        self.init(frame: frame)
        self.buttonTitles = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        updateView()
        
    }
    fileprivate func updateView() {
        // 버튼 만들기
        createButton()
        // 스크롤뷰 설정하기
        configureScrollView()
        
    }
    
    fileprivate func createButton() {
        self.buttons = [UIButton]()
        // 기존 버튼들 다 지우기
        self.buttons.removeAll()
        // 하위 뷰들을 다 지운다.
        self.subviews.forEach({$0.removeFromSuperview()})
        for buttonTitleItem in buttonTitles {
            let button = UIButton(type: .system)
            button.backgroundColor = .white
            button.titleLabel?.textColor = .black
            button.setTitle(buttonTitleItem, for: .normal)
            self.buttons.append(button)
        }
    }
    
    fileprivate func configureScrollView() {
        let scrollView = UIScrollView()
        
    }
}

extension HomeCustomSegmentControl {
    
}
