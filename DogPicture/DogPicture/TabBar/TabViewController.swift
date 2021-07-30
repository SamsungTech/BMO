//
//  MenuViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/06/30.
//

import UIKit

class TabViewController: UITabBarController {
    let centerButton = UIButton()
    let person = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTabBarStyle()
        createTabBarItemsAttribute()
        createTabBarItemsLayout()
        createTabItem()
    }
    
    func setupTabBarStyle() {
        self.tabBar.do {
            $0.itemPositioning = .fill
            $0.itemWidth = 10
            $0.tintColor = .white
            $0.barTintColor = UIColor.lightGray
            $0.barStyle = .default
            $0.isTranslucent = true
            $0.viewRadius(view: $0, cornerRadius: 30, maskToBounds: true)
            $0.viewShadow(view: $0)
        }
    }
    
    func createTabItem() {
        guard let tabHomeImage = UIImage(systemName: "house"),
              let tabHomeSelectedImage = UIImage(systemName: "house.fill"),
              let tabCameraImage = UIImage(systemName: "camera"),
              let tabCameraSelectedImage = UIImage(systemName: "camera.fill"),
              let tabPersonImage = UIImage(systemName: "person"),
              let tabPersonSelectedImage = UIImage(systemName: "person.fill"),
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
        let tabPerson = generateNavigationAndTabBar(vc: person,
                                          title: "PersonView",
                                          image: tabPersonImage,
                                          selectedImage: tabPersonSelectedImage)
        let tabSetting = generateNavigationAndTabBar(vc: SettingViewController(),
                                          title: "SettingView",
                                          image: tabSettingImage,
                                          selectedImage: tabSettingSelectedIamge)
        
        
        UINavigationBar.appearance().prefersLargeTitles = true
        
        tabCamera.tabBarItem.titlePositionAdjustment.horizontal = -20
        tabPerson.tabBarItem.titlePositionAdjustment.horizontal = 20
        
        self.setViewControllers([tabHome, tabCamera, tabPerson, tabSetting], animated: false)
        
        
    }
    
    func createTabBarItemsAttribute() {
        centerButton.do {
            $0.backgroundColor = .darkGray
            $0.setImage(UIImage(systemName: "plus"), for: .normal)
            $0.tintColor = .white
            $0.viewRadius(view: $0, cornerRadius: 30, maskToBounds: false)
            $0.viewShadow(view: $0)
            $0.addTarget(self, action: #selector(self.centerButtonDipTap), for: .touchUpInside)
        }
    }
    
    func createTabBarItemsLayout() {
        [ centerButton ].forEach() { view.addSubview($0) }
        
        centerButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.widthAnchor.constraint(equalToConstant: 60).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 60).isActive = true
            $0.centerYAnchor.constraint(equalTo: tabBar.topAnchor).isActive = true
            $0.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor).isActive = true
        }
    }
    
    fileprivate func generateNavigationAndTabBar(vc: UIViewController,
                                                 title: String,
                                                 image: UIImage,
                                                 selectedImage: UIImage) -> UINavigationController {
        let item = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.title = title
        navigationController.tabBarItem.image = image
        navigationController.tabBarItem.image?.withTintColor(.white)
        vc.navigationItem.title = title
        vc.tabBarItem = item
        return navigationController
    }
    
    @objc func centerButtonDipTap(sender: UIButton) {
        print("press")
        // centerButton 애니메이션 넣기
        
    }
}

extension TabViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected \(viewController.title!)")
        //여기서 탭바 아이템 애니메이션 넣기
        
    }
}

//extension TabViewController: UIViewControllerAnimatedTransitioning {
//    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
//        <#code#>
//    }
//    
//    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
//        <#code#>
//    }
//}

extension UIView {
    func viewRadius(view: UIView, cornerRadius: CGFloat, maskToBounds: Bool) {
        view.layer.cornerRadius = cornerRadius
        view.layer.masksToBounds = maskToBounds
    }
    func viewShadow(view: UIView) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 1, height: 1)
        view.layer.shadowRadius = 3
        view.layer.shadowOpacity = 0.5
    }
}


