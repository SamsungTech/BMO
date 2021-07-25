//
//  MenuViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/06/30.
//

import UIKit

class TabViewController: UITabBarController, UITabBarControllerDelegate {
    
    let centerButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createTabItem()
        setupTabBarStyle()
        createTabBarCenterButton()
    }
    
    func setupTabBarStyle() {
        self.do {
            $0.tabBar.barStyle = .black
        }
    }
    
    func createTabItem() {
        guard let tabHomeImage = UIImage(systemName: "house"),
              let tabHomeSelectedImage = UIImage(systemName: "house.fill"),
              let tabCameraImage = UIImage(systemName: "camera"),
              let tabCameraSelectedImage = UIImage(systemName: "camera.fill"),
              let tabSettingImage = UIImage(systemName: "gearshape"),
              let tabSettingSelectedIamge = UIImage(systemName: "gearshape.fill") else { return }
        
        let tabHome = generateNavigationAndTabBar(vc: HomeViewRouter.createHomeModule(),
                                        title: "Tab_Home",
                                        image: tabHomeImage,
                                        selectedImage: tabHomeSelectedImage)
        let tabCamera = generateNavigationAndTabBar(vc: CameraRouter.createCameraModule(),
                                          title: "Tab_Camera",
                                          image: tabCameraImage,
                                          selectedImage: tabCameraSelectedImage)
        let tabSetting = generateNavigationAndTabBar(vc: SettingViewController(),
                                          title: "SettingView",
                                          image: tabSettingImage,
                                          selectedImage: tabSettingSelectedIamge)
        centerButton.do {
            $0.buttonRadius(view: $0, cornerRadius: 50, maskToBounds: false)
            $0.backgroundColor = .white
            
        }
        UINavigationBar.appearance().prefersLargeTitles = true
        
        self.viewControllers = [ tabHome, tabCamera, tabSetting ]
    }
    
    func createTabBarCenterButton() {
        tabBar.addSubview(centerButton)
        centerButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.widthAnchor.constraint(equalToConstant: 50).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
            $0.centerYAnchor.constraint(equalTo: tabBar.topAnchor).isActive = true
            $0.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor).isActive = true
        }
    }
    
    fileprivate func generateNavigationAndTabBar(vc: UIViewController, title: String, image: UIImage, selectedImage: UIImage) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: vc)
        let item = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
        navigationController.title = title
        navigationController.tabBarItem.image = image
        vc.navigationItem.title = title
        vc.tabBarItem = item
        return navigationController
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected \(viewController.title!)")
        
    }
}

extension UITabBar {
    
}
extension UIView {
    func buttonRadius(view: UIView, cornerRadius: Int, maskToBounds: Bool) {
        view.layer.cornerRadius = CGFloat(cornerRadius)
        view.layer.masksToBounds = maskToBounds
    }
}
