//
//  SettingViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/06/25.
//

import UIKit

class SettingViewController: UIViewController {
    var presenter: SettingPresenterProtocol?
    
    let house = UIButton()
    let mainView = UIView()
    let backgroundView = UIView()
    
    var settingTitle = UILabel()
    
    var profileView = UIView()
    var profileImage = UIImageView()
    let profileEditButton = UIButton()
    var dogType = UILabel()
    var dogName = UILabel()
    
    var dogAge = UILabel()
    var dogAgeDays = UILabel()
    var dogAgeImage = UIImageView()
    
    var dogGender = UILabel()
    var neutering = UILabel()
    var dogGenderImage = UIImageView()
    
    var dogWeight = UILabel()
    var weight = UILabel()
    var dogWeightImage = UIImageView()
    
    var settingHeaderLabel = UILabel()
    
    let pushNotificationButton = UIButton()
    let dogTypeButton = UIButton()
    let termsOfUseButton = UIButton()
    let reviewButton = UIButton()
    let eventButton = UIButton()
    var versionInfoButton = UIButton()
    
    let notificationButtonImage = UIImageView()
    let notificationButtonTitle = UILabel()
    let dogTypeButtonImage = UIImageView()
    let dogTypeButtonTitle = UILabel()
    let termsOfUseButtonImage = UIImageView()
    let termsOfUseButtonTitle = UILabel()
    let reviewButtonImage = UIImageView()
    let reviewButtonTitle = UILabel()
    let eventButtonImage = UIImageView()
    let eventButtonTitle = UILabel()
    let versionInfoButtonImage = UIImageView()
    var versionInfoButtonTitle = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    override func viewWillLayoutSubviews() {
        
        pushNotificationButton.imageSizeFit(view: pushNotificationButton, buttonSize: 50)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        profileEditButton.imageSizeFit(view: profileEditButton, buttonSize: 50)
    }
    
    func updateView() {
        attribute()
        layout()
    }
    
    func attribute() {
        view.addSubview(mainView)
        [ backgroundView, settingTitle ].forEach() { mainView.addSubview($0) }
        [ profileView, settingHeaderLabel,
          pushNotificationButton, dogTypeButton, eventButton,
          termsOfUseButton, reviewButton, versionInfoButton ].forEach() { backgroundView.addSubview($0) }
        [ notificationButtonImage, notificationButtonTitle ].forEach() { pushNotificationButton.addSubview($0) }
        [ dogTypeButtonImage, dogTypeButtonTitle ].forEach() { dogTypeButton.addSubview($0) }
        [ termsOfUseButtonImage, termsOfUseButtonTitle ].forEach() { termsOfUseButton.addSubview($0) }
        [ reviewButtonImage, reviewButtonTitle ].forEach() { reviewButton.addSubview($0) }
        [ eventButtonImage, eventButtonTitle ].forEach() { eventButton.addSubview($0) }
        [ versionInfoButtonImage, versionInfoButtonTitle ].forEach() { versionInfoButton.addSubview($0) }
        [ profileImage, dogName, dogType, profileEditButton, dogAgeImage, dogAge,
          dogAgeDays, dogGenderImage, dogGender, neutering, dogWeightImage, dogWeight, weight ].forEach() { profileView.addSubview($0) }
        
        mainView.do {
            $0.backgroundColor = .systemPink
        }
        settingTitle.do {
            $0.backgroundColor = .clear
            $0.text = "설정 그렇게 하는 거 아닌데!?"
            $0.textColor = .white
            $0.font = UIFont.boldSystemFont(ofSize: 17)
            $0.textAlignment = .center
        }
        backgroundView.do {
            $0.backgroundColor = .lightGray
        }
        profileView.do {
            $0.backgroundColor = .white
            $0.viewRadius(view: profileView, cornerRadius: 10, maskToBounds: false)
        }
        profileImage.do {
            $0.image = UIImage(named: "p4")
            $0.viewRadius(view: profileImage, cornerRadius: 35, maskToBounds: false)
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
        dogName.do {
            $0.text = "쁘띠"
            $0.textColor = .black
            $0.font = UIFont.boldSystemFont(ofSize: 16)
        }
        dogType.do {
            $0.text = "말티쥬"
            $0.textColor = .darkGray
            $0.font = UIFont.systemFont(ofSize: 14)
        }
        profileEditButton.do {
            $0.setImage(UIImage(systemName: "pencil.circle.fill"), for: .normal)
            $0.tintColor = .systemPink
        }
        dogAgeImage.do {
            $0.image = UIImage(systemName: "sun.min")
            $0.tintColor = .systemPink
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.viewRadius(view: dogAgeImage, cornerRadius: 35, maskToBounds: false)
        }
        dogAge.do {
            $0.text = "만 6살"
            $0.textColor = .black
            $0.font = UIFont.boldSystemFont(ofSize: 14)
        }
        dogAgeDays.do {
            $0.text = "D-1825"
            $0.textColor = .darkGray
            $0.font = UIFont.systemFont(ofSize: 12)
        }
        dogGenderImage.do {
            $0.image = UIImage(systemName: "moon")
            $0.tintColor = .systemPink
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.viewRadius(view: dogGenderImage, cornerRadius: 35, maskToBounds: false)
        }
        dogGender.do {
            $0.text = "공주님"
            $0.textColor = .black
            $0.font = UIFont.boldSystemFont(ofSize: 14)
        }
        neutering.do {
            $0.text = "중성화 X"
            $0.textColor = .darkGray
            $0.font = UIFont.systemFont(ofSize: 12)
        }
        dogWeightImage.do {
            $0.image = UIImage(systemName: "cloud")
            $0.tintColor = .systemPink
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.viewRadius(view: dogWeightImage, cornerRadius: 35, maskToBounds: false)
        }
        dogWeight.do {
            $0.text = "몸무게"
            $0.textColor = .black
            $0.font = UIFont.boldSystemFont(ofSize: 14)
        }
        weight.do {
            $0.text = "2.3kg"
            $0.textColor = .darkGray
            $0.font = UIFont.systemFont(ofSize: 12)
        }
        settingHeaderLabel.do {
            $0.text = "쁘띠오빠의 설정"
            $0.textColor = .black
            $0.font = UIFont.boldSystemFont(ofSize: 15)
        }
        
        // MARK: 여기서부터 Setting 6 Buttons
        // UIButton 의 레이아웃만 잡고 안에 들어갈 UILabel, UIImageView 를 UIButton에 addSubView로 넣는다.
        // addSubVIew에 들어간 컴포넌트를 클릭해도 UIButton 처럼 addtarget 메소드가 실행이 될지 여부 확인
        pushNotificationButton.do {
            $0.backgroundColor = .white
            $0.tintColor = .systemPink
            $0.viewRadius(view: pushNotificationButton, cornerRadius: 10, maskToBounds: false)
            $0.addTarget(self, action: #selector(pushNotificationButtonDidTap(sender:)), for: .touchUpInside)
        }
        notificationButtonImage.do {
            $0.image = UIImage(systemName: "bell.fill")
            $0.tintColor = .systemPink
        }
        notificationButtonTitle.do {
            $0.text = "푸시 알림"
            $0.textColor = .black
            $0.textAlignment = .center
        }
        
        dogTypeButton.do {
            $0.backgroundColor = .white
            $0.tintColor = .systemPink
            $0.viewRadius(view: dogTypeButton, cornerRadius: 10, maskToBounds: false)
        }
        dogTypeButtonImage.do {
            $0.image = UIImage(systemName: "square.grid.3x3.middle.filled")
            $0.tintColor = .systemPink
        }
        dogTypeButtonTitle.do {
            $0.text = "어떤 종?"
            $0.textColor = .black
            $0.textAlignment = .center
        }
        
        eventButton.do {
            $0.backgroundColor = .white
            $0.tintColor = .systemPink
            $0.viewRadius(view: eventButton, cornerRadius: 10, maskToBounds: false)
        }
        eventButtonImage.do {
            $0.image = UIImage(systemName: "star.bubble.fill")
            $0.tintColor = .systemPink
        }
        eventButtonTitle.do {
            $0.text = "이벤트"
            $0.textColor = .black
            $0.textAlignment = .center
        }
        
        termsOfUseButton.do {
            $0.backgroundColor = .white
            $0.tintColor = .systemPink
            $0.viewRadius(view: termsOfUseButton, cornerRadius: 10, maskToBounds: false)
        }
        termsOfUseButtonImage.do {
            $0.image = UIImage(systemName: "brain.head.profile")
            $0.tintColor = .systemPink
        }
        termsOfUseButtonTitle.do {
            $0.text = "이용약관"
            $0.textColor = .black
            $0.textAlignment = .center
        }
        
        reviewButton.do {
            $0.backgroundColor = .white
            $0.tintColor = .systemPink
            $0.viewRadius(view: reviewButton, cornerRadius: 10, maskToBounds: false)
        }
        reviewButtonImage.do {
            $0.image = UIImage(systemName: "captions.bubble.fill")
            $0.tintColor = .systemPink
        }
        reviewButtonTitle.do {
            $0.text = "리뷰"
            $0.textColor = .black
            $0.textAlignment = .center
        }
        
        versionInfoButton.do {
            $0.backgroundColor = .white
            $0.tintColor = .systemPink
            $0.viewRadius(view: versionInfoButton, cornerRadius: 10, maskToBounds: false)
        }
        versionInfoButtonImage.do {
            $0.image = UIImage(systemName: "v.square")
            $0.tintColor = .systemPink
        }
        versionInfoButtonTitle.do {
            $0.text = "버전확인"
            $0.textColor = .black
            $0.textAlignment = .center
        }
    }
    func layout() {
        mainView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }
        settingTitle.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        backgroundView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: profileView.centerYAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }
        profileView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: settingTitle.bottomAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 250).isActive = true
        }
        profileImage.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: profileView.topAnchor, constant: 20).isActive = true
            $0.leadingAnchor.constraint(equalTo: profileView.leadingAnchor, constant: 20).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 70).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 70).isActive = true
        }
        dogName.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: profileView.topAnchor, constant: 20).isActive = true
            $0.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 20).isActive = true
            $0.trailingAnchor.constraint(equalTo: profileView.trailingAnchor, constant: -100).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 30).isActive = true
        }
        dogType.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: dogName.bottomAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 20).isActive = true
            $0.trailingAnchor.constraint(equalTo: profileView.trailingAnchor, constant: -100).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        }
        profileEditButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerYAnchor.constraint(equalTo: profileImage.centerYAnchor).isActive = true
            $0.centerXAnchor.constraint(equalTo: dogWeightImage.centerXAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 50).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        dogAgeImage.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 20).isActive = true
            $0.leadingAnchor.constraint(equalTo: profileView.leadingAnchor, constant: 42.5).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 50).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        dogAge.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: dogAgeImage.bottomAnchor, constant: 10).isActive = true
            $0.centerXAnchor.constraint(equalTo: dogAgeImage.centerXAnchor).isActive = true
        }
        dogAgeDays.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: dogAge.bottomAnchor, constant: 10).isActive = true
            $0.centerXAnchor.constraint(equalTo: dogAgeImage.centerXAnchor).isActive = true
        }
        dogGenderImage.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 20).isActive = true
            $0.centerXAnchor.constraint(equalTo: profileView.centerXAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 50).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        dogGender.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: dogGenderImage.bottomAnchor, constant: 10).isActive = true
            $0.centerXAnchor.constraint(equalTo: profileView.centerXAnchor).isActive = true
        }
        neutering.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: dogGender.bottomAnchor, constant: 10).isActive = true
            $0.centerXAnchor.constraint(equalTo: profileView.centerXAnchor).isActive = true
        }
        dogWeightImage.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 20).isActive = true
            $0.trailingAnchor.constraint(equalTo: profileView.trailingAnchor, constant: -42.5).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 50).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        dogWeight.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: dogWeightImage.bottomAnchor, constant: 10).isActive = true
            $0.centerXAnchor.constraint(equalTo: dogWeightImage.centerXAnchor).isActive = true
        }
        weight.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: dogWeight.bottomAnchor, constant: 10).isActive = true
            $0.centerXAnchor.constraint(equalTo: dogWeightImage.centerXAnchor).isActive = true
        }
        settingHeaderLabel.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 15).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 30).isActive = true
        }
        
        pushNotificationButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: settingHeaderLabel.bottomAnchor, constant: 15).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 105).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 140).isActive = true
        }
        notificationButtonImage.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: pushNotificationButton.topAnchor, constant: 10).isActive = true
            $0.leadingAnchor.constraint(equalTo: pushNotificationButton.leadingAnchor, constant: 10).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 85).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 85).isActive = true
        }
        notificationButtonTitle.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: notificationButtonImage.bottomAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: pushNotificationButton.leadingAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 105).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 30).isActive = true
        }
        
        dogTypeButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: settingHeaderLabel.bottomAnchor, constant: 15).isActive = true
            $0.leadingAnchor.constraint(equalTo: pushNotificationButton.trailingAnchor, constant: 15).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 105).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 140).isActive = true
        }
        dogTypeButtonImage.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: dogTypeButton.topAnchor,constant: 10).isActive = true
            $0.leadingAnchor.constraint(equalTo: dogTypeButton.leadingAnchor, constant: 10).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 85).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 85).isActive = true
        }
        dogTypeButtonTitle.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: dogTypeButtonImage.bottomAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: dogTypeButton.leadingAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 105).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 30).isActive = true
        }
        
        eventButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: settingHeaderLabel.bottomAnchor, constant: 15).isActive = true
            $0.leadingAnchor.constraint(equalTo: dogTypeButton.trailingAnchor, constant: 15).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 105).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 140).isActive = true
        }
        eventButtonImage.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: eventButton.topAnchor, constant: 10).isActive = true
            $0.leadingAnchor.constraint(equalTo: eventButton.leadingAnchor, constant: 10).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 85).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 85).isActive = true
        }
        eventButtonTitle.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: eventButtonImage.bottomAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: eventButton.leadingAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 105).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 30).isActive = true
        }
        
        termsOfUseButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: pushNotificationButton.bottomAnchor, constant: 15).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 105).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 140).isActive = true
        }
        termsOfUseButtonImage.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: termsOfUseButton.topAnchor, constant: 10).isActive = true
            $0.leadingAnchor.constraint(equalTo: termsOfUseButton.leadingAnchor, constant: 10).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 85).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 85).isActive = true
        }
        termsOfUseButtonTitle.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: termsOfUseButtonImage.bottomAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: termsOfUseButton.leadingAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 105).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 30).isActive = true
        }
        
        reviewButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: pushNotificationButton.bottomAnchor, constant: 15).isActive = true
            $0.leadingAnchor.constraint(equalTo: termsOfUseButton.trailingAnchor, constant: 15).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 105).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 140).isActive = true
        }
        reviewButtonImage.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: reviewButton.topAnchor, constant: 10).isActive = true
            $0.leadingAnchor.constraint(equalTo: reviewButton.leadingAnchor, constant: 10).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 85).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 85).isActive = true
        }
        reviewButtonTitle.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: reviewButtonImage.bottomAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: reviewButton.leadingAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 105).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 30).isActive = true
        }
        
        versionInfoButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: pushNotificationButton.bottomAnchor, constant: 15).isActive = true
            $0.leadingAnchor.constraint(equalTo: reviewButton.trailingAnchor, constant: 15).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 105).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 140).isActive = true
        }
        versionInfoButtonImage.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: versionInfoButton.topAnchor, constant: 10).isActive = true
            $0.leadingAnchor.constraint(equalTo: versionInfoButton.leadingAnchor, constant: 10).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 85).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 85).isActive = true
        }
        versionInfoButtonTitle.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: versionInfoButtonImage.bottomAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: versionInfoButton.leadingAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 105).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 30).isActive = true
        }
        
    }
    
    @objc func pushNotificationButtonDidTap(sender: UIButton) {
        presenter?.showLocalPushView()
    }
}

extension SettingViewController: SettingViewProtocol {
    
}
