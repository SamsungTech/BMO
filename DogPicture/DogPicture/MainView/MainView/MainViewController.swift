//
//  MainViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/11/22.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    var presenter: MainPresenterProtocol?
    
    let navigationBar = UIView()
    let sideMenuButton = UIButton()
    let segmentedButton = UISegmentedControl()
    let noticeButton = UIButton()
    var views = [UIViewController]()
    let pageView = UIPageViewController(transitionStyle: .scroll,
                                        navigationOrientation: .horizontal)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    func updateView() {
        attribute()
        layout()
    }
    
    func attribute() {
        [ navigationBar, pageView.view ].forEach() { view.addSubview($0) }
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
        pageView.do {
            views.append(HomeViewRouter.createHomeModule())
            views.append(CollectionRouter.createCollectionModule())
            
            $0.setViewControllers([views[0]], direction: .forward, animated: false, completion: nil)
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
        pageView.view.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: navigationBar.bottomAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }
    }
}

extension MainViewController {
    @objc func sideMenuButtonDidTap(sender: UIButton) {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
        presenter?.sideMenuButtonClicked()
    }
    @objc func segmentedButtonDidTap(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            pageView.setViewControllers([views[0]], direction: .reverse, animated: true, completion: nil)
        } else {
            pageView.setViewControllers([views[1]], direction: .forward, animated: true, completion: nil)
        }
    }
    @objc func noticeButtonDidTap(sender: UIButton) {
        
    }
}

extension MainViewController: MainViewProtocol {
    
}
