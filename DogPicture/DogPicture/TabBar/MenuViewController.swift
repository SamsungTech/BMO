//
//  MenuViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/06/30.
//

import UIKit
import Then

class MenuViewController: UIViewController {
    
    weak var presenter: MenuViewPresenterProtocol?
    
    let tabBar = UITabBarController()
    let homeVC = HomeViewRouter.createHomeModule()
    let settingVC = UIViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTabBarController()
    }
    
    func createTabBarController() {
        [ tabBar.view ].forEach() { view.addSubview($0)}
        
        tabBar.do {
            $0.tabBar.tintColor = UIColor.black
        }
        
        homeVC.do {
            $0.title = "홈"
            $0.view.backgroundColor = UIColor.red
            $0.tabBarItem = UITabBarItem.init(title: "홈", image: UIImage(named: "house"), tag: 0)
        }
        
        settingVC.do {
            $0.title = "설정"
            $0.view.backgroundColor = UIColor.blue
            $0.tabBarItem = UITabBarItem.init(title: "설정", image: UIImage(named: "gearshape.fill"), tag: 0)
        }
        
        let controllerArray = [ homeVC, settingVC ]
//        tabBar.viewControllers = controllerArray.map(U)
        
        }
}

extension MenuViewController: MenuViewProtocol {
    
}
