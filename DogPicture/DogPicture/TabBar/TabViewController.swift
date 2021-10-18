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
        createTabBarItemsAttribute()
        self.selectedIndex = 0
    }
    
    func createTabBarItemsAttribute() {
        [ centerView, centerButton, homeButton, cameraButton, libraryButton, settingButton ]
            .forEach() { view.addSubview($0) }
        
        self.setViewControllers([HomeViewRouter.createHomeModule(),
                                 CameraRouter.createCameraModule(),
                                 person,
                                 SettingRouter.createSettingModule()],
                                animated: false)
        
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
            $0.imageSizeFit(view: centerButton, buttonSize: 60)
        }
        homeButton.do {
            $0.tag = 0
            $0.setImage(UIImage(systemName: "house"), for: .normal)
            $0.setImage(UIImage(systemName: "house.fill"), for: .selected)
            $0.tintColor = .white
            $0.viewRadius(view: $0, cornerRadius: (UIScreen.main.bounds.maxX*(55/390))/2, maskToBounds: false)
            $0.viewShadow(view: $0)
            $0.alpha = 0.0
            $0.isHidden = true
            $0.addTarget(self, action: #selector(onTabBarItemClick(_:)), for: .touchUpInside)
            $0.frame = CGRect(x: UIScreen.main.bounds.maxX*(30/390),
                              y: UIScreen.main.bounds.maxY*(9.1/10),
                              width: UIScreen.main.bounds.maxX*(55/390),
                              height: UIScreen.main.bounds.maxY*(55/844))
            $0.imageView?.contentMode = .scaleAspectFit
            $0.imageSizeFit(view: homeButton, buttonSize: 45)
        }
        cameraButton.do {
            $0.tag = 1
            $0.setImage(UIImage(systemName: "camera"), for: .normal)
            $0.setImage(UIImage(systemName: "camera.fill"), for: .selected)
            $0.tintColor = .white
            $0.viewRadius(view: $0, cornerRadius: (UIScreen.main.bounds.maxX*(55/390))/2, maskToBounds: false)
            $0.viewShadow(view: $0)
            $0.alpha = 0.0
            $0.isHidden = true
            $0.addTarget(self, action: #selector(cameraViewDidTap(sender:)), for: .touchUpInside)
            $0.frame = CGRect(x: UIScreen.main.bounds.maxX*(93.75/390),
                              y: UIScreen.main.bounds.maxY*(9.1/10),
                              width: UIScreen.main.bounds.maxX*(55/390),
                              height: UIScreen.main.bounds.maxY*(55/844))
            $0.imageView?.contentMode = .scaleAspectFit
            $0.imageSizeFit(view: cameraButton, buttonSize: 45)
        }
        libraryButton.do {
            $0.tag = 2
            $0.setImage(UIImage(systemName: "rectangle.3.offgrid"), for: .normal)
            $0.setImage(UIImage(systemName: "rectangle.3.offgrid.fill"), for: .selected)
            $0.tintColor = .white
            $0.viewRadius(view: $0, cornerRadius: (UIScreen.main.bounds.maxX*(55/390))/2, maskToBounds: false)
            $0.viewShadow(view: $0)
            $0.alpha = 0.0
            $0.isHidden = true
            $0.addTarget(self, action: #selector(onTabBarItemClick(_:)), for: .touchUpInside)
            $0.frame = CGRect(x: UIScreen.main.bounds.maxX*(236.25/390),
                              y: UIScreen.main.bounds.maxY*(9.1/10),
                              width: UIScreen.main.bounds.maxX*(55/390),
                              height: UIScreen.main.bounds.maxY*(55/844))
            $0.imageView?.contentMode = .scaleAspectFit
            $0.imageSizeFit(view: libraryButton, buttonSize: 45)
        }
        settingButton.do {
            $0.tag = 3
            $0.setImage(UIImage(systemName: "gearshape"), for: .normal)
            $0.setImage(UIImage(systemName: "gearshape.fill"), for: .selected)
            $0.tintColor = .white
            $0.viewRadius(view: $0, cornerRadius: (UIScreen.main.bounds.maxX*(55/390))/2, maskToBounds: false)
            $0.viewShadow(view: $0)
            $0.alpha = 0.0
            $0.isHidden = true
            $0.addTarget(self, action: #selector(onTabBarItemClick(_:)), for: .touchUpInside)
            $0.frame = CGRect(x: UIScreen.main.bounds.maxX*(305/390),
                              y: UIScreen.main.bounds.maxY*(9.1/10),
                              width: UIScreen.main.bounds.maxX*(55/390),
                              height: UIScreen.main.bounds.maxY*(55/844))
            $0.imageView?.contentMode = .scaleAspectFit
            $0.imageSizeFit(view: settingButton, buttonSize: 45)
        }
    }
    
    @objc func cameraViewDidTap(sender: UIButton) {
        centerView.isHidden = true
        centerButton.isHidden = true
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
            animateRotatingCenterButtonWhenCenterViewExpands(button: centerButton)
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
    
    func animateRotatingCenterButtonWhenCenterViewExpands(button: UIButton) {
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
                        UIView.animateKeyframes(withDuration: 1,
                                                delay: 0.1,
                                                options: [],
                                                animations: {
                            UIView.addKeyframe(withRelativeStartTime: 0,
                                               relativeDuration: 0.6) {
                                button.transform = CGAffineTransform.identity
                            }
                            UIView.addKeyframe(withRelativeStartTime: 0.60,
                                               relativeDuration: 0.1) {
                                button.transform = CGAffineTransform(rotationAngle: (5.0 * .pi) / 180)
                            }
                            UIView.addKeyframe(withRelativeStartTime: 0.7,
                                               relativeDuration: 0.1) {
                                button.transform = CGAffineTransform(rotationAngle: -(5.0 * .pi) / 180)
                            }
                            UIView.addKeyframe(withRelativeStartTime: 0.8,
                                               relativeDuration: 0.1) {
                                button.transform = CGAffineTransform(rotationAngle: (3.0 * .pi) / 180)
                            }
                            UIView.addKeyframe(withRelativeStartTime: 0.9,
                                               relativeDuration: 0.1) {
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
    func imageSizeFit(view: UIButton, buttonSize: CGFloat) {
        view.imageEdgeInsets = UIEdgeInsets(top: UIScreen.main.bounds.maxX*(buttonSize/390),
                                            left: UIScreen.main.bounds.maxX*(buttonSize/390),
                                            bottom: UIScreen.main.bounds.maxX*(buttonSize/390),
                                            right: UIScreen.main.bounds.maxX*(buttonSize/390))
    }
}
