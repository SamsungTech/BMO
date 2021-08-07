//
//  MenuViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/06/30.
//

import UIKit

class TabViewController: UITabBarController {
    let centerButton = UIButton()
    let cameraButton = UIButton()
    let libraryButton = UIButton()
    var centerButtonExpanded: Bool = true
    let person = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        // 여기서 centerButton layout을 잡아주고
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UINavigationBar.appearance().prefersLargeTitles = true
        setupTabBarStyle()
        createTabBarItemsAttribute()
        createTabBarItemsLayout()
        createTabItem()
        view.bringSubviewToFront(centerButton)
    }
    override func viewDidAppear(_ animated: Bool) {
        // centerButton으로부터 좌표 가져와서 라이브러리 찍어주는 곳
    }
    
    func setupTabBarStyle() {
        self.tabBar.do {
            $0.itemPositioning = .fill
            $0.itemWidth = 10
            $0.barTintColor = UIColor.black
            $0.barStyle = .default
            $0.isTranslucent = true
            $0.tintColor = UIColor.cyan
            $0.unselectedItemTintColor = .white
            
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
        
        let tabHome = generateNavigationControllerAndTabBarController(vc: HomeViewRouter.createHomeModule(),
                                        title: "Tab_Home",
                                        image: tabHomeImage,
                                        selectedImage: tabHomeSelectedImage)
        let tabCamera = generateNavigationControllerAndTabBarController(vc: CameraRouter.createCameraModule(),
                                          title: "Tab_Camera",
                                          image: tabCameraImage,
                                          selectedImage: tabCameraSelectedImage)
        let tabPerson = generateNavigationControllerAndTabBarController(vc: person,
                                          title: "PersonView",
                                          image: tabPersonImage,
                                          selectedImage: tabPersonSelectedImage)
        let tabSetting = generateNavigationControllerAndTabBarController(vc: SettingViewController(),
                                          title: "SettingView",
                                          image: tabSettingImage,
                                          selectedImage: tabSettingSelectedIamge)
        
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
        cameraButton.do {
            $0.backgroundColor = .lightGray
            $0.setImage(UIImage(systemName: "camera"), for: .normal)
            $0.tintColor = .white
            $0.viewRadius(view: $0, cornerRadius: 27.5, maskToBounds: false)
            $0.viewShadow(view: $0)
            $0.isHidden = true
            $0.frame = CGRect(x: UIScreen.main.bounds.maxX*(167.5/390),
                              y: UIScreen.main.bounds.maxY*(733.91/844),
                              width: UIScreen.main.bounds.maxX*(55/390),
                              height: UIScreen.main.bounds.maxY*(55/844))
        }
        libraryButton.do {
            $0.backgroundColor = .lightGray
            $0.setImage(UIImage(systemName: "rectangle.on.rectangle"), for: .normal)
            $0.tintColor = .white
            $0.viewRadius(view: $0, cornerRadius: 27.5, maskToBounds: false)
            $0.viewShadow(view: $0)
            $0.isHidden = true
            $0.frame = CGRect(x: UIScreen.main.bounds.maxX*(167.5/390),
                              y: UIScreen.main.bounds.maxY*(733.91/844),
                              width: UIScreen.main.bounds.maxX*(55/390),
                              height: UIScreen.main.bounds.maxY*(55/844))
        }
    }
    
    func createTabBarItemsLayout() {
        [ centerButton, cameraButton, libraryButton ].forEach() { view.addSubview($0) }
        
        centerButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.maxX*(60/390)).isActive = true
            $0.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.maxY*(60/844)).isActive = true
            $0.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor).isActive = true
            $0.centerYAnchor.constraint(equalTo: tabBar.topAnchor).isActive = true
        }
    }
    
    fileprivate func generateNavigationControllerAndTabBarController(vc: UIViewController,
                                                 title: String,
                                                 image: UIImage,
                                                 selectedImage: UIImage) -> UINavigationController {
        let item = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.title = title
        navigationController.tabBarItem.image = image
        navigationController.tabBarItem.selectedImage = selectedImage
        navigationController.tabBarItem.image?.withTintColor(.white)
        vc.navigationItem.title = title
        vc.tabBarItem = item
        return navigationController
    }
    
    @objc func centerButtonDipTap(sender: UIButton) {
        centerButton.isUserInteractionEnabled = false
        if (centerButtonExpanded == true) {
            UIView.animate(withDuration: 2,
                           delay: 0,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 1,
                           options: .curveEaseInOut,
                           animations: {
                            self.cameraButton.isHidden = false
                            self.cameraButton.frame = CGRect(x: UIScreen.main.bounds.maxX*(130/390),
                                                             y: UIScreen.main.bounds.maxY*(680.64/844),
                                                             width: UIScreen.main.bounds.maxX*(55/390),
                                                             height: UIScreen.main.bounds.maxY*(55/844))
                            print("여기")
                           }) { _ in
                self.centerButton.isUserInteractionEnabled = true
                
            }
            UIView.animate(withDuration: 2,
                           delay: 0,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 1,
                           options: .curveEaseInOut,
                           animations: {
                            self.libraryButton.isHidden = false
                            self.libraryButton.frame = CGRect(x: UIScreen.main.bounds.maxX*(205.26/390),
                                                              y: UIScreen.main.bounds.maxY*(680.64/844),
                                                              width: UIScreen.main.bounds.maxX*(55/390),
                                                              height: UIScreen.main.bounds.maxY*(55/844))
                           }) { [weak self] _ in
                guard let self = self else {
                    return
                }
                self.centerButton.isUserInteractionEnabled = true
                self.view.isUserInteractionEnabled = true
            }
            centerButton.setImage(UIImage(systemName: "xmark"), for: .normal)
            centerButtonExpanded = false
        } else {
            UIView.animate(withDuration: 2,
                           delay: 0,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 1,
                           options: .curveEaseInOut,
                           animations: {
                            self.cameraButton.isHidden = false
                            self.cameraButton.center = self.centerButton.center
                           }) { [weak self] _ in
                guard let self = self else {
                    return
                }
                self.cameraButton.isHidden = true
                self.centerButton.isUserInteractionEnabled = true
                self.view.isUserInteractionEnabled = true
            }
            UIView.animate(withDuration: 2,
                           delay: 0,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 1,
                           options: .curveEaseInOut,
                           animations: {
                            self.libraryButton.isHidden = false
                            self.libraryButton.frame = CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
                            self.libraryButton.center = self.centerButton.center
                           }) { [weak self] _ in
                guard let self = self else {
                    return
                }
                self.libraryButton.isHidden = true
                self.centerButton.isUserInteractionEnabled = true
                self.view.isUserInteractionEnabled = true
            }
            centerButton.setImage(UIImage(systemName: "plus"), for: .normal)
            centerButtonExpanded = true
        }
    }
}

extension TabViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
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


extension UIImage {
    func selectedTabBarItemBackgroundColor() {
        
    }
}

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
