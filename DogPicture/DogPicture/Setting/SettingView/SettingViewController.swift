//
//  SettingViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/06/25.
//

import UIKit

class SettingViewController: UIViewController {
    
    let house = UIButton()
    let verticalStackView = UIStackView()
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
    let dogTypeEditButton = UIButton()
    let termsOfUseButton = UIButton()
    let reviewButton = UIButton()
    let eventButton = UIButton()
    var versionInfoButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    override func viewWillLayoutSubviews() {
        profileEditButton.imageSizeFit(view: profileEditButton, buttonSize: 50)
    }
    
    func updateView() {
        attribute()
        layout()
    }
    
    func attribute() {
        view.addSubview(verticalStackView)
        [ backgroundView, settingTitle ].forEach() { verticalStackView.addSubview($0) }
        [ profileView, settingHeaderLabel, pushNotificationButton, dogTypeEditButton,
          eventButton, termsOfUseButton, reviewButton, versionInfoButton ].forEach() { backgroundView.addSubview($0) }
        [ profileImage, dogName, dogType, profileEditButton, dogAgeImage, dogAge,
          dogAgeDays, dogGenderImage, dogGender, neutering, dogWeightImage, dogWeight, weight ].forEach() { profileView.addSubview($0) }
        
        
        verticalStackView.do {
            $0.backgroundColor = .systemPink
            $0.axis = .vertical
            $0.alignment = .fill
            $0.distribution = .fillEqually
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
//        pushNotificationButton, dogTypeEditButton, eventButton, termsOfUseButton, reviewButton, versionInfoButton
        settingHeaderLabel.do {
            $0.text = "쁘띠오빠의 설정"
            $0.textColor = .black
            $0.font = UIFont.boldSystemFont(ofSize: 15)
        }
        pushNotificationButton.do {
            $0.setImage(UIImage(systemName: "bell.fill"), for: .normal)
            $0.tintColor = .systemPink
        }
        dogTypeEditButton.do {
            $0.backgroundColor = .white
            $0.tintColor = .white
            $0.setTitle("타입설정", for: .normal)
        }
        eventButton.do {
            $0.backgroundColor = .white
            
        }
        termsOfUseButton.do {
            $0.backgroundColor = .white
        }
        reviewButton.do {
            $0.backgroundColor = .white
        }
        versionInfoButton.do {
            $0.backgroundColor = .white
        }
    }
    func layout() {
        verticalStackView.do {
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
        //pushNotificationButton, dogTypeEditButton, eventButton, termsOfUseButton, reviewButton, versionInfoButton
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
            $0.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: 15).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 107.5).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 80).isActive = true
        }
        dogTypeEditButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: settingHeaderLabel.bottomAnchor, constant: 15).isActive = true
            $0.leadingAnchor.constraint(equalTo: pushNotificationButton.trailingAnchor, constant: 15).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 107.5).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 80).isActive = true
        }
        eventButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: settingHeaderLabel.bottomAnchor, constant: 15).isActive = true
            $0.leadingAnchor.constraint(equalTo: dogTypeEditButton.trailingAnchor, constant: 15).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 107.5).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 80).isActive = true
        }
        termsOfUseButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: pushNotificationButton.bottomAnchor, constant: 15).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: 15).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 107.5).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 80).isActive = true
        }
        reviewButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: pushNotificationButton.bottomAnchor, constant: 15).isActive = true
            $0.leadingAnchor.constraint(equalTo: termsOfUseButton.trailingAnchor, constant: 15).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 107.5).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 80).isActive = true
        }
        versionInfoButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: pushNotificationButton.bottomAnchor, constant: 15).isActive = true
            $0.leadingAnchor.constraint(equalTo: reviewButton.trailingAnchor, constant: 15).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 107.5).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 80).isActive = true
        }
    }
}
