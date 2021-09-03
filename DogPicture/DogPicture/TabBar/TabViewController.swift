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
    
    var isCenterButtonExpanded: Bool = false
    var isAnimationRan: Bool = false
    let person = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.isHidden = true
        createCustomTabBarController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createTabBarItemsAttribute()
        createTabItem()
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
        
        self.setViewControllers([tabHome, tabCamera, tabPerson, tabSetting], animated: false)
    }
    
    func createTabBarItemsAttribute() {
        
        [ centerView, centerButton, homeButton, cameraButton, libraryButton, settingButton ]
            .forEach() { view.addSubview($0) }
        
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
            $0.setImage(UIImage(systemName: "house.fill"), for: .selected)
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
            $0.imageEdgeInsets = UIEdgeInsets(top: UIScreen.main.bounds.maxX*(45/390),
                                              left: UIScreen.main.bounds.maxX*(45/390),
                                              bottom: UIScreen.main.bounds.maxX*(45/390),
                                              right: UIScreen.main.bounds.maxX*(45/390))
        }
        cameraButton.do {
            $0.setImage(UIImage(systemName: "camera"), for: .normal)
            $0.setImage(UIImage(systemName: "camera.fill"), for: .selected)
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
            $0.imageEdgeInsets = UIEdgeInsets(top: UIScreen.main.bounds.maxX*(45/390),
                                              left: UIScreen.main.bounds.maxX*(45/390),
                                              bottom: UIScreen.main.bounds.maxX*(45/390),
                                              right: UIScreen.main.bounds.maxX*(45/390))
        }
        libraryButton.do {
            $0.setImage(UIImage(systemName: "rectangle.3.offgrid"), for: .normal)
            $0.setImage(UIImage(systemName: "rectangle.3.offgrid.fill"), for: .selected)
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
            $0.imageEdgeInsets = UIEdgeInsets(top: UIScreen.main.bounds.maxX*(45/390),
                                              left: UIScreen.main.bounds.maxX*(45/390),
                                              bottom: UIScreen.main.bounds.maxX*(45/390),
                                              right: UIScreen.main.bounds.maxX*(45/390))
        }
        settingButton.do {
            $0.setImage(UIImage(systemName: "gearshape"), for: .normal)
            $0.setImage(UIImage(systemName: "gearshape.fill"), for: .selected)
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
        animateCenterButtonRotatedAndSmallerAnimation(view: centerView, button: centerButton)
        selectedIndex = sender.tag
        homeButton.isHidden = true
        cameraButton.isHidden = true
        libraryButton.isHidden = true
        settingButton.isHidden = true
        homeButton.alpha = 0.0
        cameraButton.alpha = 0.0
        libraryButton.alpha = 0.0
        settingButton.alpha = 0.0
        centerView.isUserInteractionEnabled = true
        view.isUserInteractionEnabled = true
        isCenterButtonExpanded = false
    }
    
    @objc func centerButtonDipTap(sender: UIButton) {
        centerView.isUserInteractionEnabled = false
        view.isUserInteractionEnabled = false
        
        if (isCenterButtonExpanded == false) {
            view.isUserInteractionEnabled = true
            animateCenterTabViewShakeWhenCenterTabViewExpanded(view: self.centerView)
            animationThatRotatingCenterButtonWhenCenterViewExpands(button: centerButton)
            animateSpinAndShakeTabBarItemWhenTabViewExpanded(button: homeButton)
            animateSpinAndShakeTabBarItemWhenTabViewExpanded(button: cameraButton)
            animateSpinAndShakeTabBarItemWhenTabViewExpanded(button: libraryButton)
            animateSpinAndShakeTabBarItemWhenTabViewExpanded(button: settingButton)
            homeButton.isHidden = false
            cameraButton.isHidden = false
            libraryButton.isHidden = false
            settingButton.isHidden = false
            isCenterButtonExpanded = true
        } else {
            animateCenterButtonRotatedAndSmallerAnimation(view: centerView, button: centerButton)
            homeButton.isHidden = true
            cameraButton.isHidden = true
            libraryButton.isHidden = true
            settingButton.isHidden = true
            homeButton.alpha = 0.0
            cameraButton.alpha = 0.0
            libraryButton.alpha = 0.0
            settingButton.alpha = 0.0
            view.isUserInteractionEnabled = true
            isCenterButtonExpanded = false
        }
    }
}

extension TabViewController {
    
    func animationThatRotatingCenterButtonWhenCenterViewExpands(button: UIButton) {
        UIView.animateKeyframes(withDuration: 0.9, delay: 0.1, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25) {
                button.transform = CGAffineTransform(rotationAngle: (180.0 * .pi) / 180)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.1) {
                button.transform = CGAffineTransform(rotationAngle: -((270.0 * .pi) / 180))
            }
            UIView.addKeyframe(withRelativeStartTime: 0.35, relativeDuration: 0.15) {
                button.transform = CGAffineTransform(rotationAngle: -(360.0 * .pi) / 180)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.1) {
                button.transform = CGAffineTransform(rotationAngle: -(405.0 * .pi) / 180)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.60, relativeDuration: 0.15) {
                button.transform = CGAffineTransform(rotationAngle: -(395.0 * .pi) / 180)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.125) {
                button.transform = CGAffineTransform(rotationAngle: -(408.0 * .pi) / 180)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.775, relativeDuration: 0.05) {
                button.transform = CGAffineTransform(rotationAngle: -(405.0 * .pi) / 180)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 0.1) {
                button.transform = CGAffineTransform(rotationAngle: -(405.0 * .pi) / 180)
            }
        })
    }
    
    func animateCenterButtonRotatedAndSmallerAnimation(view: UIView, button: UIButton) {
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
                        UIView.animateKeyframes(withDuration: 1, delay: 0.1, options: [], animations: {
                            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.6) {
                                button.transform = CGAffineTransform.identity
                            }
                            UIView.addKeyframe(withRelativeStartTime: 0.60, relativeDuration: 0.1) {
                                button.transform = CGAffineTransform(rotationAngle: (5.0 * .pi) / 180)
                            }
                            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.1) {
                                button.transform = CGAffineTransform(rotationAngle: -(5.0 * .pi) / 180)
                            }
                            UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.1) {
                                button.transform = CGAffineTransform(rotationAngle: (3.0 * .pi) / 180)
                            }
                            UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 0.1) {
                                button.transform = CGAffineTransform.identity
                            }
                        })
                       })
    }
    
    func animateCenterTabViewShakeWhenCenterTabViewExpanded(view: UIView) {
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
    
    func animateSpinAndShakeTabBarItemWhenTabViewExpanded(button: UIButton) {
        UIView.animateKeyframes(withDuration: 0.9, delay: 0.15, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25) {
                button.transform = CGAffineTransform(rotationAngle: (180.0 * .pi) / 180)
                button.alpha = 0.7
            }
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.1) {
                button.transform = CGAffineTransform(rotationAngle: -((270.0 * .pi) / 180))
                button.alpha = 0.8
            }
            UIView.addKeyframe(withRelativeStartTime: 0.35, relativeDuration: 0.15) {
                button.transform = CGAffineTransform(rotationAngle: -(360.0 * .pi) / 180)
                button.alpha = 0.9
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.1) {
                button.transform = CGAffineTransform(rotationAngle: -(370.0 * .pi) / 180)
                button.alpha = 1.0
            }
            UIView.addKeyframe(withRelativeStartTime: 0.60, relativeDuration: 0.15) {
                button.transform = CGAffineTransform(rotationAngle: -(350.0 * .pi) / 180)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.125) {
                button.transform = CGAffineTransform(rotationAngle: -(363.0 * .pi) / 180)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.775, relativeDuration: 0.05) {
                button.transform = CGAffineTransform(rotationAngle: -(360.0 * .pi) / 180)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 0.1) {
                button.transform = CGAffineTransform.identity
            }
        })
    }
    
    func animationWhenRollingTabBarItemFromLeftside(button: UIButton) {
        
    }
    
    func animationWhenRollingTabBarItemFromLightside(button: UIButton) {
        
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
