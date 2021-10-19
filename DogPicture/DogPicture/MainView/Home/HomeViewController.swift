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
    
    let navigationBar = UIView()
    let changeIdButton = UIButton()
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
        view.backgroundColor = .lightGray
        navigationController?.isNavigationBarHidden = true
        updateView()
        dateFormatter.do {
            $0.dateFormat = "yyyy-MM-dd"
            $0.locale = Locale(identifier: "ko_KR")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        homeTableView.reloadData()
        view.imageSizeFit(view: noticeButton, buttonSize: 30)
        view.imageSizeFit(view: changeIdButton, buttonSize: 30)
    }
    
    func updateView() {
        attribute()
        layout()
    }
    
    func attribute() {
        [ navigationBar, homeTableView ].forEach() { view.addSubview($0) }
        [ changeIdButton, segmentedButton, noticeButton ].forEach() { navigationBar.addSubview($0) }
        
        navigationBar.do {
            $0.backgroundColor = .white
        }
        changeIdButton.do {
            $0.setImage(UIImage(systemName: "person.fill"), for: .normal)
            $0.tintColor = .darkGray
        }
        segmentedButton.do {
            $0.insertSegment(withTitle: "타임라인", at: 0, animated: true)
            $0.insertSegment(withTitle: "캘린더", at: 1, animated: true)
            $0.backgroundColor = .lightGray
            $0.addTarget(self, action: #selector(segmentedButtonDidTap(sender:)), for: .valueChanged)
        }
        noticeButton.do {
            $0.setImage(UIImage(systemName: "bell.fill"), for: .normal)
            $0.tintColor = .darkGray
        }
        homeTableView.do {
            $0.separatorStyle = .none
            $0.dataSource = self
            $0.delegate = self
            $0.frame = view.bounds
            $0.backgroundColor = .white
            $0.register(HomeTableViewCell.self, forCellReuseIdentifier: "HomeCell")
            $0.delaysContentTouches = false
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
        changeIdButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: navigationBar.topAnchor, constant: 50).isActive = true
            $0.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor, constant: 20).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 30).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 30).isActive = true
        }
        segmentedButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: navigationBar.centerXAnchor).isActive = true
            $0.centerYAnchor.constraint(equalTo: changeIdButton.centerYAnchor).isActive = true
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
    
    @objc func segmentedButtonDidTap(sender: UISegmentedControl) {
//        switch sender.selectedSegmentIndex {
//        case 0:
//            nil
//        case 1:
//            nil
//        default:
//            nil
//        }
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(UIScreen.main.bounds.maxY*(460/844))
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = homeTableView.cellForRow(at: indexPath) else { return }
        let cellOriginPoint = cell.superview?.convert(cell.center, to: nil)
        guard let cellOriginFrame = cell.superview?.convert(cell.frame, to: nil) else { return }
        transition.setPoint(point: cellOriginPoint)
        transition.setFrame(frame: cellOriginFrame)
        memoView.transitioningDelegate = self
        memoView.modalPresentationStyle = .custom
        self.present(memoView, animated: true)
//        presenter?.showMemo(for: modelList[indexPath.row], index: indexPath)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1 // 쁘띠 프로필 넣기
        case 1:
            return modelList.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return CGFloat(UIScreen.main.bounds.maxY*(70/844))
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            return nil
        case 1:
            return nil
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
    }
}

extension HomeViewController: UIViewControllerTransitioningDelegate {
    // present될때 실행애니메이션
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return transition
    }
    
    // Presenting usually doesn't have any interactivity
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }
}
