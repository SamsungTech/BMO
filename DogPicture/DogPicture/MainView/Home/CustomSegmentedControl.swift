//
//  CustomSegmentedControl.swift
//  DogPicture
//
//  Created by 김동우 on 2021/08/24.
//

import UIKit

protocol CustomSegmentedControlDelegate: AnyObject {
    func changeToIndex(index: Int)
}

class CustomSegmentedControl: UIView {
    weak var delegate: CustomSegmentedControlDelegate? // 여기서 왜 weak var 가 들어가는지??
    // 옵셔널 바인딩
    private var buttonTitles:[String]!
    private var buttons: [UIButton] = []
    private var selectorView: UIView!
    private var scrollView = UIScrollView()
    
    var textColor:UIColor = .black
    var selectorViewColor: UIColor = .red
    var selectorTextColor: UIColor = .red
    
    // 데이터를 뷰에 적용 할때
    convenience init(frame: CGRect, buttonTitle:[String]) { // 얘도 뭐하는애일까?
        self.init(frame: frame)
        self.buttonTitles = buttonTitle
    }
    
    override func draw(_ rect: CGRect) { // 얜 뭐하는애일까?
        super.draw(rect)
        updateView()
    }
    
    func setButtonTitles(buttonTitles: [String]) {
        self.buttonTitles = buttonTitles
        updateView()
    }
    
    private func updateView() {
        createButton()
        configSelectorView()
        configStackView()
    }
    
    private func configStackView() {
        let stackView = UIStackView(arrangedSubviews: buttons)
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        scrollView.do {
            $0.backgroundColor = .blue
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 70).isActive = true
        }
        stackView.do {
            $0.axis = .horizontal
            $0.alignment = .fill
            $0.distribution = .fillEqually
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: CGFloat(90*buttonTitles.count)).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
    }
    
    private func configSelectorView() {
        let selectorWidth = frame.width / CGFloat(self.buttonTitles.count)
        
        selectorView = UIView(frame: CGRect(x: 0,
                                            y: self.frame.height,
                                            width: selectorWidth,
                                            height: 2))
        selectorView.backgroundColor = selectorViewColor
        addSubview(selectorView)
    }
    
    private func createButton() {
        buttons = [UIButton]() // () 이게 뭔뜻이야?
        buttons.removeAll() // ()?? 매번 재생성 되니깐 항상 지웠다가 다시 생성하기위해?
        subviews.forEach({$0.removeFromSuperview()})
        
        for buttonTitle in buttonTitles {
            let button = UIButton(type: .system)
            button.do {
                $0.setTitle(buttonTitle, for: .normal)
                $0.addTarget(self,
                             action: #selector(CustomSegmentedControl.buttonAction(sender:)),
                             for: .touchUpInside)
                $0.setTitleColor(textColor, for: .normal)
            }
            buttons.append(button)
        }
        buttons[0].setTitleColor(selectorTextColor, for: .normal)
    }
    
    @objc func buttonAction(sender: UIButton) {
        print("클릭")
        for (buttonIndex, btn) in buttons.enumerated() {
            btn.setTitleColor(textColor, for: .normal)
            if btn == sender {
                let selectorPosition = frame.width/CGFloat(buttonTitles.count) * CGFloat(buttonIndex)
                delegate?.changeToIndex(index: buttonIndex)
                UIView.animate(withDuration: 0.3) {
                    self.selectorView.frame.origin.x = selectorPosition
                }
                btn.setTitleColor(selectorTextColor, for: .normal)
            }
        }
    }
    
    func setIndex(index: Int) {
        
    }
}
