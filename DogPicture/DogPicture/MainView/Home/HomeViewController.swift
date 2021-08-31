//
//  HomeViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/05/28.
//

import UIKit
import Then

class HomeViewController: UIViewController {
    var presenter: HomePresenterProtocol?
    
    var segmentedScrollView = UIScrollView()
    var segmentedStackView = UIStackView()
    var segmentedButton: [UIButton] = []
    
    var textColor: UIColor = .black
    var selectroViewColor: UIColor = .red
    var selectorTextColor: UIColor = .red
    var segmentedSelectorView = UIView()
    let segmentedButtonTitles = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        view.backgroundColor = .white
        createSegmentedButton()
        segmentedAttribute()
        segmentedConfigure()
    }
    
    func createSegmentedButton() {
        segmentedButton = [UIButton]()
        segmentedButton.removeAll()
        
        for buttonTitle in segmentedButtonTitles {
            let button = UIButton(type: .system)
            button.do {
                $0.setTitle(buttonTitle, for: .normal)
                $0.addTarget(self,
                             action: #selector(segmentLineAnimation(sender:)),
                             for: .touchUpInside)
                $0.setTitleColor(textColor, for: .normal)
            }
            segmentedButton.append(button)
        }
        segmentedButton[0].setTitleColor(selectorTextColor, for: .normal)
    }
    
    func segmentedAttribute() {
        let selectorWidth = CGFloat(segmentedButtonTitles.count*70) / CGFloat(self.segmentedButtonTitles.count)
        
        [ segmentedScrollView, segmentedSelectorView ].forEach() { view.addSubview($0) }
        segmentedScrollView.addSubview(segmentedStackView)
        
        segmentedScrollView.do {
            $0.backgroundColor = .systemBlue
        }
        
        segmentedStackView.do {
            $0.axis = .horizontal
            $0.alignment = .fill
            $0.distribution = .fillEqually
        }
        segmentedSelectorView.do {
            $0.backgroundColor = selectroViewColor
            $0.frame = CGRect(x: 0,
                              y: 200,
                              width: selectorWidth,
                              height: 2)
        }
        for button in segmentedButtonTitles {
            
        }
    }
    
    func segmentedConfigure() {
        segmentedScrollView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 70).isActive = true
        }
        segmentedStackView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: segmentedScrollView.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: segmentedScrollView.leadingAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: CGFloat(segmentedButtonTitles.count*70)).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
    }
    
    @objc func segmentLineAnimation(sender: UIButton) {
        for (buttonIndex, btn) in segmentedButton.enumerated() { // 여기서 버튼 인덱스와 버튼의 번호를 알 수 있는 건가?
            btn.setTitleColor(textColor, for: .normal)
            if btn == sender {
                let selectorPosition = 70 * CGFloat(buttonIndex)
                UIView.animate(withDuration: 0.3) {
                    self.segmentedSelectorView.frame.origin.x = selectorPosition
                }
                btn.setTitleColor(selectorTextColor, for: .normal)
            }
        }
    }
}


//extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return chuImage.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.id, for: indexPath) as? HomeTableViewCell
//        let image = chuImage[indexPath.row]
//        cell?.chuImageView.image = UIImage(named: image)
//        return cell ?? UITableViewCell()
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        presenter?.showMemo(for: chuImage[indexPath.row])
//    }
//
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return CGFloat(300)
//    }
//
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        cell.layoutIfNeeded()
//    }
//}

extension HomeViewController: HomeViewProtocol {
    func showChu(chu: [UIImage?]) {
        print(chu)
    }
    
    func segmentDidChanged() {
        print("뷰관련 동작인 애니메이션 등등..")
    }
    
    func segmentAnimation() {
        presenter?.segmentAnimation()
    }
}
