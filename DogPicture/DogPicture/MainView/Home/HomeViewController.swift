//
//  HomeViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/05/28.
//

import UIKit
import Then
import AVFoundation

class HomeViewController: UIViewController {
    var presenter: HomePresenterProtocol?
    let navigationBar = UIView()
    let sideMenuButton = UIButton()
    let segmentedButton = UISegmentedControl()
    let noticeButton = UIButton()
    var homeTableView = UITableView()
    var modelList: [Model] = []
    let dateFormatter = DateFormatter()
    let transition = AnimationTransition()
    let memoView = MemoViewController()
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        homeTableView.reloadData()
        overrideUserInterfaceStyle = .light
        view.backgroundColor = .lightGray
        navigationController?.isNavigationBarHidden = true
        updateView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        homeTableView.reloadData()
        view.imageSizeFit(view: noticeButton, buttonSize: 30)
        view.imageSizeFit(view: sideMenuButton, buttonSize: 30)
    }
    
    func updateView() {
        attribute()
        layout()
    }
    
    func attribute() {
        [ navigationBar, homeTableView ].forEach() { view.addSubview($0) }
        [ sideMenuButton, segmentedButton, noticeButton ].forEach() { navigationBar.addSubview($0) }
        
        navigationBar.do {
            $0.backgroundColor = .white
        }
        sideMenuButton.do {
            $0.setImage(UIImage(systemName: "person.fill"), for: .normal)
            $0.tintColor = .darkGray
            $0.addTarget(self, action: #selector(sideMenuButtonDidTap(sender:)), for: .touchUpInside)
        }
        segmentedButton.do {
            $0.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)], for: .normal)
            $0.insertSegment(withTitle: "타임라인", at: 0, animated: true)
            $0.insertSegment(withTitle: "캘린더", at: 1, animated: true)
            $0.backgroundColor = .lightGray
            $0.addTarget(self, action: #selector(segmentedButtonDidTap(sender:)), for: .valueChanged)
            $0.selectedSegmentIndex = 0
        }
        noticeButton.do {
            $0.setImage(UIImage(systemName: "bell.fill"), for: .normal)
            $0.tintColor = .darkGray
            $0.addTarget(self, action: #selector(noticeButtonDidTap(sender:)), for: .touchUpInside)
        }
        homeTableView.do {
            $0.separatorStyle = .none
            $0.dataSource = self
            $0.delegate = self
            $0.backgroundColor = .white
            $0.register(HomeTableViewCell.self, forCellReuseIdentifier: "HomeCell")
            $0.register(HomeProfileViewCell.self, forCellReuseIdentifier: "ProfileViewCell")
            $0.register(HomeEventCell.self, forCellReuseIdentifier: "HomeEventCell")
            $0.register(HomeFooterCell.self, forCellReuseIdentifier: "HomeFooterCell")
            $0.delaysContentTouches = false
        }
        dateFormatter.do {
            $0.dateFormat = "yyyy-MM-dd"
            $0.locale = Locale(identifier: "ko_KR")
        }
    }
    
    func layout() {
        navigationBar.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 90).isActive = true
        }
        sideMenuButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: navigationBar.topAnchor, constant: 50).isActive = true
            $0.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor, constant: 20).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 30).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 30).isActive = true
        }
        segmentedButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: navigationBar.centerXAnchor).isActive = true
            $0.centerYAnchor.constraint(equalTo: sideMenuButton.centerYAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 150).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 35).isActive = true
        }
        noticeButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: navigationBar.topAnchor, constant: 50).isActive = true
            $0.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor, constant: -20).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 30).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 30).isActive = true
        }
        homeTableView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: navigationBar.bottomAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }
    }
    
    @objc func sideMenuButtonDidTap(sender: UIButton) {
        // present side menu
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
        presenter?.sideMenuButtonClicked()
    }
    @objc func segmentedButtonDidTap(sender: UISegmentedControl) {
        
    }
    @objc func noticeButtonDidTap(sender: UIButton) {
        
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let profileCell = tableView.dequeueReusableCell(withIdentifier: HomeProfileViewCell.identifier) as! HomeProfileViewCell
            profileCell.profileImage.image = UIImage(named: "p4")
            profileCell.dogName.text = "쁘띠"
            profileCell.dogDaysAndType.text = "출생 1001일 | 말티쥬"
            profileCell.selectionStyle = .none
            
            return profileCell
        } else if indexPath.section == 1 {
            let eventCell = tableView.dequeueReusableCell(withIdentifier: HomeEventCell.identifier) as! HomeEventCell
            
            return eventCell
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier) as! HomeTableViewCell
            if let data = modelList[indexPath.row].photo,
               let memo = modelList[indexPath.row].memo,
               let date = modelList[indexPath.row].date {
                let formatDate = dateFormatter.string(from: date)
                cell.cellImageView.image = UIImage(data: data)
                cell.imageContent.text = memo
                cell.imageDate.text = formatDate
            }
            cell.selectionStyle = .none
            return cell
        } else {
            let footerCell = tableView.dequeueReusableCell(withIdentifier: HomeFooterCell.identifier) as! HomeFooterCell
            return footerCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return CGFloat(UIScreen.main.bounds.maxY*(130/844))
        } else if indexPath.section == 1 {
            return CGFloat(UIScreen.main.bounds.maxY*(160/844))
        } else if indexPath.section == 2 {
            return CGFloat(UIScreen.main.bounds.maxY*(460/844))
        } else {
            return CGFloat(UIScreen.main.bounds.maxY*(200/844))
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = homeTableView.cellForRow(at: indexPath) else { return }
        let cellOriginPoint = cell.superview?.convert(cell.center, to: nil)
        guard let cellOriginFrame = cell.superview?.convert(cell.frame, to: nil) else { return }
        transition.setPoint(point: cellOriginPoint)
        transition.setFrame(frame: cellOriginFrame)
//        memoView.transitioningDelegate = self
//        memoView.modalPresentationStyle = .custom
//        self.present(memoView, animated: true)
        presenter?.showMemo(for: modelList[indexPath.row], index: indexPath)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        } else if section == 2 {
            return modelList.count
        } else {
            return 1
        }
    }
}

extension HomeViewController: HomeViewProtocol {
    func showModels(with data: [Model]) {
        modelList = data
        homeTableView.reloadData()
    }
    
    func refershCalender(tag: Int) {
        
    }
}
