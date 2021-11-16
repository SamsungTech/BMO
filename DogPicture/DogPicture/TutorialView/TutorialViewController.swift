//
//  TutorialViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/11/01.
//

import UIKit
import Then

class TutorialViewController: UIViewController {
    
    let mainView = UIView()
    let pageViewController = UIPageViewController(transitionStyle: .scroll,
                                                  navigationOrientation: .horizontal)
    let viewControllers = [FirstViewController()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    func updateView() {
        attribute()
        layout()
    }
    
    func attribute() {
        [ mainView ].forEach() { view.addSubview($0) }
        mainView.addSubview(pageViewController.view)
        self.addChild(pageViewController)
        
        pageViewController.do {
            $0.dataSource = self
            $0.delegate = self
            $0.setViewControllers(viewControllers,
                                  direction: .reverse,
                                  animated: true,
                                  completion: nil)
            $0.view.frame = mainView.frame
        }
        mainView.do {
            $0.backgroundColor = .systemFill
        }
    }
    func layout() {
        mainView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }
    }
    
}

extension TutorialViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        print("before")
        
        if viewController as? FirstViewController != nil {
            return nil
        } else if viewController as? SecondViewController != nil {
            return FirstViewController()
        }
        return FirstViewController()
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        print("after")
        
        if viewController as? SecondViewController != nil {
            return ThirdViewController()
        } else if viewController as? ThirdViewController != nil {
            return nil
        }
        
        return SecondViewController()
    }
    
}
