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
    var segmentedScrollContentView = UIView()
    var segmentedStackView = UIStackView()
    var segmentedButton: [UIButton] = []
    let segmentedButtonTitles = ["1월", "2월", "3월", "4월", "5월",
                                 "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
    
    var homeTableView = UITableView()
    
    var homeTableViewFooter = UITableViewHeaderFooterView()
    var headerContentLabel = UILabel()
    var headerDateLabel = UILabel()
    let models = ["쁘디1", "쁘띠2", "쁘띠3", "쁘띠4", "쁘띠5",
                  "쁘띠6", "쁘띠7", "쁘띠8", "쁘띠9", "쁘띠10",
                  "쁘띠11", "쁘띠12", "쁘띠13", "쁘띠14", "쁘띠15",
                  "쁘띠16", "쁘띠17", "쁘띠18", "쁘띠19", "쁘띠20",
                  "쁘띠21", "쁘띠22", "쁘띠23", "쁘띠24", "쁘띠25",
                  "쁘띠26", "쁘띠27", "쁘띠28", "쁘띠29", "쁘띠30"]
    
    var textColor: UIColor = .black
    var selectroViewColor: UIColor = .red
    var selectorTextColor: UIColor = .red
    
    
    var tagNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
        
//        segmentedUpdateView()
        
        attribute()
        layout()
    }
    
    func attribute() {
        view.addSubview(homeTableView)
        
        
        homeTableView.do {
            $0.dataSource = self
            $0.delegate = self
            $0.frame = view.bounds
            $0.backgroundColor = .systemBlue
            $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//            $0.register(HomeViewSegmentedHeader.self, forHeaderFooterViewReuseIdentifier: "SegmentedHeader")
//            $0.tableHeaderView = header
        }
    }
    
    func layout() {
        homeTableView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }
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

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = models[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let header = HomeViewStickyHeaderView()
//        header.randomImageView.image = UIImage(named: "chu3")
        
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "StickyHeader")
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
}

extension HomeViewController: HomeViewProtocol {
    func showChu(chu: [UIImage?]) {
        print(chu)
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
