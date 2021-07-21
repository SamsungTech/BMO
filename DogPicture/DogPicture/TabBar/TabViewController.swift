//
//  MenuViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/06/30.
//

import UIKit

class TabViewController: UITabBarController, UITabBarControllerDelegate {
    let tabHome = HomeViewRouter.createHomeModule()
    let tabCamera = CameraRouter.createCameraModule()
    let tabSetting = SettingViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createTabItem()
    }
    
    func createTabItem() {
        let tabHomeItem = UITabBarItem(title: "Tab_Home", image: UIImage(systemName: "house"), tag: 0)
        let tabCameraItem = UITabBarItem(title: "Tab_Camera", image: UIImage(systemName: "camera"), selectedImage: UIImage(named: "camera"))
        let tabSettingItem = UITabBarItem(title: "Tab_Setting", image: UIImage(systemName: "gear"), selectedImage: UIImage(named: "gear"))
        
        tabHome.tabBarItem = tabHomeItem
        tabCamera.tabBarItem = tabCameraItem
        tabSetting.tabBarItem = tabSettingItem
        
        self.viewControllers = [ tabHome, tabCamera, tabSetting ]
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected \(viewController.title!)")
    }
}
