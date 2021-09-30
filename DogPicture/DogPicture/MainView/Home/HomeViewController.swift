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
    
    var headerView = UIView()
    var mainHeaderView = UIView()
    var randomImageView = UIImageView()
    var segmentedScrollView = UIScrollView()
    var segmentedScrollContentView = UIView()
    var segmentedStackView = UIStackView()
    var segmentedButton: [UIButton] = []
    let segmentedButtonTitles = ["1월", "2월", "3월", "4월", "5월",
                                 "6월", "7월", "8월", "9월", "10월",
                                 "11월", "12월"]
    var homeTableView = UITableView()
    var modelList: [Model] = []
    var textColor: UIColor = .black
    var selectroViewColor: UIColor = .red
    var selectorTextColor: UIColor = .red
    let reloadButton = UIButton()
    var tagNumber = 0
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        homeTableView.reloadData()
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
        updateView()
        view.bringSubviewToFront(reloadButton)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        homeTableView.reloadData()
    }
    
    func updateView() {
        attribute()
        layout()
    }
    
    func attribute() {
        view.addSubview(homeTableView)
        randomImageView.addSubview(reloadButton)
        headerView.addSubview(segmentedScrollView)
        segmentedScrollView.addSubview(segmentedScrollContentView)
        segmentedScrollContentView.addSubview(segmentedStackView)
        
        homeTableView.do {
            $0.separatorStyle = .none
            $0.dataSource = self
            $0.delegate = self
            $0.frame = view.bounds
            $0.backgroundColor = .systemBlue
            $0.register(HomeTableViewCell.self, forCellReuseIdentifier: "HomeCell")
        }
        
        mainHeaderView.do {
            $0.backgroundColor = .brown
        }
        
        randomImageView.do {
            $0.image = UIImage(named: "p4")
        }
        segmentedScrollView.do {
            $0.backgroundColor = .systemPink
            $0.contentSize = CGSize(width: UIScreen.main.bounds.maxX*(840/390),
                                    height: UIScreen.main.bounds.maxY*(70/844))
            $0.showsHorizontalScrollIndicator = false
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
        
        reloadButton.do {
            $0.tintColor = .darkGray
            $0.setImage(UIImage(systemName: "r.circle.fill"), for: .normal)
            $0.imageView?.contentMode = .scaleAspectFit
            $0.addTarget(self, action: #selector(reloadButtonDidTap(sender:)),
                         for: .touchUpInside)
            $0.frame = CGRect(x: 30, y: 30, width: 60, height: 60)
            $0.imageSizeFit(view: reloadButton, buttonSize: 60)
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
        headerViewLayout()
    }
    
    func headerViewLayout() {
        segmentedScrollView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.maxX).isActive = true
            $0.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.maxY*(70/844)).isActive = true
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
            $0.widthAnchor.constraint(equalToConstant: CGFloat(segmentedButtonTitles.count)*CGFloat(UIScreen.main.bounds.maxX*(70/390))).isActive = true
            $0.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.maxY*(50/844)).isActive = true
        }
    }
    
    @objc func reloadButtonDidTap(sender: AnyObject) {
        print("리로드 데이터")
        homeTableView.reloadData()
    }
    @objc func segmentLineAnimation(sender: UIButton) {
        presenter?.calenderDidTap(tag: sender.tag)
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier) as! HomeTableViewCell
        if let data = modelList[indexPath.row].photo,
           let memo = modelList[indexPath.row].memo {
            cell.cellImageView.image = UIImage(data: data)
            print(memo)
            cell.imageContent.text = memo
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(UIScreen.main.bounds.maxY*(460/844))
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showMemo(for: modelList[indexPath.row])
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 0
        case 1:
            return modelList.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return CGFloat(UIScreen.main.bounds.maxY*(300/844))
        case 1:
            return CGFloat(UIScreen.main.bounds.maxY*(70/844))
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            return randomImageView
        case 1:
            return headerView
        default:
            return nil
        }
    }
}

extension HomeViewController: HomeViewProtocol {
    func showModels(with data: [Model]) {
        modelList = data
        homeTableView.reloadData()
    }
    
    func refershCalender(tag: Int) {
        for btn in segmentedButton {
            btn.setTitleColor(textColor, for: .normal)
            if tag == btn.tag {
                btn.setTitleColor(selectorTextColor, for: .normal)
                print(btn.tag)
            }
        }
    }
}
