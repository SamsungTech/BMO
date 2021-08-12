//
//  MenuViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/06/30.
//

import UIKit

class TabViewController: UITabBarController {
    let centerView = UIView()
    let centerButton = UIButton()
    
    let homeButton = UIButton()
    let cameraButton = UIButton()
    let libraryButton = UIButton()
    let settingButton = UIButton()
    let writeButton = UIButton()
    
    var centerButtonExpanded: Bool = true
    let person = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 여기서 centerButton layout을 잡아주고
        self.tabBar.isHidden = true
        self.onTabBarItemClick(self.homeButton)
        createCustomTabBarController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UINavigationBar.appearance().prefersLargeTitles = true
        setupTabBarStyle()
        createTabBarItemsAttribute()
        createTabItem()
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
    
    func createCustomTabBarController() {
        self.createCustomTabBarItem(btn: self.homeButton, title: "첫번째 버튼", tag: 0)
        self.createCustomTabBarItem(btn: self.cameraButton, title: "두번째 버튼", tag: 1)
        self.createCustomTabBarItem(btn: self.settingButton, title: "세번째 버튼", tag: 2)
    }
    
    func createCustomTabBarItem(btn: UIButton, title: String, tag: Int) {
        btn.tag = tag
        btn.setTitleColor(.white, for: .normal)
        btn.setTitleColor(.yellow, for: .selected)
        btn.addTarget(self, action: #selector(onTabBarItemClick(_:)), for: .touchUpInside)
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
        
        [ centerView, centerButton, homeButton, cameraButton, libraryButton, settingButton, writeButton ].forEach()
        { view.addSubview($0) }
        
        centerView.do {
            $0.backgroundColor = .darkGray
            $0.tintColor = .white
            $0.viewRadius(view: $0, cornerRadius: (UIScreen.main.bounds.maxX*(70/390))/2, maskToBounds: false)
            $0.viewShadow(view: $0)
            $0.frame = CGRect(x: UIScreen.main.bounds.maxX*(160/390),
                              y: UIScreen.main.bounds.maxY*(9/10),
                              width: UIScreen.main.bounds.maxX*(70/390),
                              height: UIScreen.main.bounds.maxY*(70/844))
        }
        centerButton.do {
            $0.setImage(UIImage(systemName: "plus"), for: .normal)
            $0.tintColor = .white
            $0.viewRadius(view: $0, cornerRadius: (UIScreen.main.bounds.maxX*(70/390))/2, maskToBounds: false)
            $0.viewShadow(view: $0)
            $0.addTarget(self, action: #selector(self.centerButtonDipTap), for: .touchUpInside)
            $0.frame = CGRect(x: UIScreen.main.bounds.maxX*(160/390),
                              y: UIScreen.main.bounds.maxY*(9/10),
                              width: UIScreen.main.bounds.maxX*(70/390),
                              height: UIScreen.main.bounds.maxY*(70/844))
            $0.imageView?.contentMode = .scaleAspectFit
            $0.imageEdgeInsets = UIEdgeInsets(top: UIScreen.main.bounds.maxX*(60/390),
                                              left: UIScreen.main.bounds.maxX*(60/390),
                                              bottom: UIScreen.main.bounds.maxX*(60/390),
                                              right: UIScreen.main.bounds.maxX*(60/390))
        }
        homeButton.do {
            $0.setImage(UIImage(systemName: "house"), for: .normal)
            $0.tintColor = .white
            $0.viewRadius(view: $0, cornerRadius: (UIScreen.main.bounds.maxX*(55/390))/2, maskToBounds: false)
            $0.viewShadow(view: $0)
            $0.alpha = 0.0
            $0.isHidden = true
            $0.frame = CGRect(x: UIScreen.main.bounds.maxX*(30/390),
                              y: UIScreen.main.bounds.maxY*(9.1/10),
                              width: UIScreen.main.bounds.maxX*(55/390),
                              height: UIScreen.main.bounds.maxY*(55/844))
            $0.imageView?.contentMode = .scaleAspectFit
            $0.imageEdgeInsets = UIEdgeInsets(top: 45, left: 45, bottom: 45, right: 45)
        }
        cameraButton.do {
            $0.setImage(UIImage(systemName: "camera"), for: .normal)
            $0.tintColor = .white
            $0.viewRadius(view: $0, cornerRadius: (UIScreen.main.bounds.maxX*(55/390))/2, maskToBounds: false)
            $0.viewShadow(view: $0)
            $0.alpha = 0.0
            $0.isHidden = true
            $0.frame = CGRect(x: UIScreen.main.bounds.maxX*(93.75/390),
                              y: UIScreen.main.bounds.maxY*(9.1/10),
                              width: UIScreen.main.bounds.maxX*(55/390),
                              height: UIScreen.main.bounds.maxY*(55/844))
            $0.imageView?.contentMode = .scaleAspectFit
            $0.imageEdgeInsets = UIEdgeInsets(top: 45, left: 45, bottom: 45, right: 45)
        }
        libraryButton.do {
            $0.setImage(UIImage(systemName: "rectangle.on.rectangle"), for: .normal)
            $0.tintColor = .white
            $0.viewRadius(view: $0, cornerRadius: (UIScreen.main.bounds.maxX*(55/390))/2, maskToBounds: false)
            $0.viewShadow(view: $0)
            $0.alpha = 0.0
            $0.isHidden = true
            $0.frame = CGRect(x: UIScreen.main.bounds.maxX*(236.25/390),
                              y: UIScreen.main.bounds.maxY*(9.1/10),
                              width: UIScreen.main.bounds.maxX*(55/390),
                              height: UIScreen.main.bounds.maxY*(55/844))
            $0.imageView?.contentMode = .scaleAspectFit
            $0.imageEdgeInsets = UIEdgeInsets(top: 45, left: 45, bottom: 45, right: 45)
        }
        settingButton.do {
            $0.setImage(UIImage(systemName: "gearshape"), for: .normal)
            $0.tintColor = .white
            $0.viewRadius(view: $0, cornerRadius: (UIScreen.main.bounds.maxX*(55/390))/2, maskToBounds: false)
            $0.viewShadow(view: $0)
            $0.alpha = 0.0
            $0.isHidden = true
            $0.frame = CGRect(x: UIScreen.main.bounds.maxX*(305/390),
                              y: UIScreen.main.bounds.maxY*(9.1/10),
                              width: UIScreen.main.bounds.maxX*(55/390),
                              height: UIScreen.main.bounds.maxY*(55/844))
            $0.imageView?.contentMode = .scaleAspectFit
            $0.imageEdgeInsets = UIEdgeInsets(top: UIScreen.main.bounds.maxX*(45/390),
                                              left: UIScreen.main.bounds.maxX*(45/390),
                                              bottom: UIScreen.main.bounds.maxX*(45/390),
                                              right: UIScreen.main.bounds.maxX*(45/390))
            
        }
        writeButton.do {
            $0.backgroundColor = .lightGray
            $0.setImage(UIImage(systemName: "pencil"), for: .normal)
            $0.tintColor = .white
            $0.viewRadius(view: $0, cornerRadius: (UIScreen.main.bounds.maxX*(55/390))/2, maskToBounds: false)
            $0.viewShadow(view: $0)
            $0.isHidden = true
            $0.frame = CGRect(x: UIScreen.main.bounds.maxX*(305/390),
                              y: UIScreen.main.bounds.maxY*(9.1/10),
                              width: UIScreen.main.bounds.maxX*(55/390),
                              height: UIScreen.main.bounds.maxY*(55/844))
            $0.imageView?.contentMode = .scaleAspectFit
            $0.imageEdgeInsets = UIEdgeInsets(top: UIScreen.main.bounds.maxX*(45/390),
                                              left: UIScreen.main.bounds.maxX*(45/390),
                                              bottom: UIScreen.main.bounds.maxX*(45/390),
                                              right: UIScreen.main.bounds.maxX*(45/390))
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
    
    
    
    @objc func onTabBarItemClick(_ sender: UIButton) {
        homeButton.isSelected = false
        cameraButton.isSelected = false
        settingButton.isSelected = false
        sender.isSelected = true
        selectedIndex = sender.tag
        
        contractCenterTabViewAndCenterButton(view: centerView, button: centerButton)
        homeButton.isHidden = true
        cameraButton.isHidden = true
        libraryButton.isHidden = true
        settingButton.isHidden = true
        centerView.isUserInteractionEnabled = true
        view.isUserInteractionEnabled = true
        centerButton.setImage(UIImage(systemName: "plus"), for: .normal)
        centerButtonExpanded = true
    }
    
    @objc func centerButtonDipTap(sender: UIButton) {
        centerView.isUserInteractionEnabled = false
        view.isUserInteractionEnabled = false
        
        if (centerButtonExpanded == true) {
            view.isUserInteractionEnabled = true
            xmarkButton(button: centerButton)
            shakeCenterTabView(view: self.centerView)
            spinTabBarItem(button: homeButton)
            spinTabBarItem(button: cameraButton)
            spinTabBarItem(button: libraryButton)
            spinTabBarItem(button: settingButton)
            homeButton.isHidden = false
            cameraButton.isHidden = false
            libraryButton.isHidden = false
            settingButton.isHidden = false
            centerButtonExpanded = false
            
        } else {
            contractCenterTabViewAndCenterButton(view: centerView, button: centerButton)
            homeButton.isHidden = true
            cameraButton.isHidden = true
            libraryButton.isHidden = true
            settingButton.isHidden = true
            homeButton.alpha = 0.0
            cameraButton.alpha = 0.0
            libraryButton.alpha = 0.0
            settingButton.alpha = 0.0
            view.isUserInteractionEnabled = true
            centerButton.setImage(UIImage(systemName: "plus"), for: .normal)
            centerButtonExpanded = true
        }
    }
}

extension TabViewController {
    func xmarkButton(button: UIButton) {
        UIView.animate(withDuration: 0.6,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 1,
                       options: .curveEaseOut,
                       animations: {
                        button.setImage(UIImage(systemName: "xmark"), for: .normal)
                        button.imageView?.contentMode = .scaleAspectFit
                        button.imageEdgeInsets = UIEdgeInsets(top: UIScreen.main.bounds.maxX*(55/390),
                                                              left: UIScreen.main.bounds.maxX*(55/390),
                                                              bottom: UIScreen.main.bounds.maxX*(55/390),
                                                              right: UIScreen.main.bounds.maxX*(55/390))
                       })
    }
    func contractCenterTabViewAndCenterButton(view: UIView, button: UIButton) {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 1,
                       options: .curveEaseInOut,
                       animations: {
                        view.frame = CGRect(x: UIScreen.main.bounds.maxX*(160/390),
                                            y: UIScreen.main.bounds.maxY*(9/10),
                                            width: UIScreen.main.bounds.maxX*(70/390),
                                            height: UIScreen.main.bounds.maxY*(70/844))
                        button.imageView?.contentMode = .scaleAspectFit
                        button.imageEdgeInsets = UIEdgeInsets(top: UIScreen.main.bounds.maxX*(60/390),
                                                              left: UIScreen.main.bounds.maxX*(60/390),
                                                              bottom: UIScreen.main.bounds.maxX*(60/390),
                                                              right: UIScreen.main.bounds.maxX*(60/390))
                       })
    }
    
    func shakeCenterTabView(view: UIView) {
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.2, animations: {
                view.frame = CGRect(x: UIScreen.main.bounds.maxX*(5/390),
                                    y: UIScreen.main.bounds.maxY*(9/10),
                                    width: UIScreen.main.bounds.maxX*(380/390),
                                    height: UIScreen.main.bounds.maxY*(70/844))
                
            })
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.3, animations: {
                view.frame = CGRect(x: UIScreen.main.bounds.maxX*(12.5/390),
                                    y: UIScreen.main.bounds.maxY*(9/10),
                                    width: UIScreen.main.bounds.maxX*(365/390),
                                    height: UIScreen.main.bounds.maxY*(70/844))
            })
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.3, animations: {
                view.frame = CGRect(x: UIScreen.main.bounds.maxX*(8/390),
                                    y: UIScreen.main.bounds.maxY*(9/10),
                                    width: UIScreen.main.bounds.maxX*(374/390),
                                    height: UIScreen.main.bounds.maxY*(70/844))
            })
            UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.3, animations: {
                view.frame = CGRect(x: UIScreen.main.bounds.maxX*(10/390),
                                    y: UIScreen.main.bounds.maxY*(9/10),
                                    width: UIScreen.main.bounds.maxX*(370/390),
                                    height: UIScreen.main.bounds.maxY*(70/844))
            })
        })
    }
    
    func shakeButton(button: UIButton) {
        
    }
    
    func spinTabBarItem(button: UIButton) {
        UIView.animate(withDuration: 0.5, animations: {
            UIView.animateKeyframes(withDuration: 0.4, delay: 0.5, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
                    button.transform = CGAffineTransform(rotationAngle: (180.0 * .pi) / 180)
                    button.alpha = 0.7
                }
                UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.3) {
                    button.transform = CGAffineTransform(rotationAngle: -((270.0 * .pi) / 180))
                    button.alpha = 0.8
                }
                UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.1) {
                    button.transform = CGAffineTransform(rotationAngle: -(360.0 * .pi) / 180)
                    button.alpha = 0.9
                }
                UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 0.1) {
                    button.transform = CGAffineTransform.identity
                    button.alpha = 1.0
                }
            })
        })
    }
    func rollingTabBarItemFromLeftside(button: UIButton) {
        
    }
    func rollingTabBarItemFromLightside(button: UIButton) {
        
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
