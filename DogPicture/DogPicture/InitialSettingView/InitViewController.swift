//
//  InitViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/11/02.
//
// 프로필 사진 등록
// 성별 -> segmented control

import Foundation
import UIKit
import Photos
import Alamofire


class InitViewController: UIViewController {
    var presenter: InitPresenterProtocol?
    var profileImageButton = UIButton()
    var profileImageView = UIImageView()
    var profileImageHolder: Data?
    var image = PHImageManager()
    
    var dogNameTextField = UITextField()
    var dogNameHolder: String = ""
    
    let dogTypes = [ "시고르자브종", "말티쥬", "요크셔테리어", "웰시코기", "포메라이언" ]
    var dogTypeTextField = UITextField()
    var dogTypePickerView = UIPickerView()
    var dogTypeHolder: String = ""
    
    var dogBirthDayTextField = UITextField()
    var dogBirthDayPicker = UIDatePicker()
    var dogBirthDayHolder: Date?
    
    let dogRelations = [ "집사", "엄마", "아빠", "누나", "오빠", "언니", "형", "남동생", "여동생" ]
    var dogRelationTextField = UITextField()
    var dogRelationPicker = UIPickerView()
    var dogRelationHolder: String = ""
    
    var dogGender = UILabel()
    
    let saveButton = UIButton()
    
    var infoHolder: [DogInfo]?
    var modelHolder: [Model]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        view.backgroundColor = .white
        let modelHolder = ModelDatabaseHelper.instance.getModelItems()
//        for i in 0..<modelHolder.count {
//            guard let date = modelHolder[i].date else { return }
//            print("model 안에 있는 데이트1", date)
//        }
        print(modelHolder)
//
//
//        let ready = modelHolder.sorted(by: {
//            guard let date2 = $1.date else { return false }
//            return $0.date?.compare(date2) == .orderedDescending
//        })
        
        
    }
    
    func updateView() {
        attribute()
        layout()
    }
    
    func attribute() {
        [ profileImageButton, dogNameTextField, dogTypeTextField,
          dogBirthDayTextField, dogRelationTextField, saveButton ].forEach() { view.addSubview($0) }
        profileImageButton.addSubview(profileImageView)
        
        profileImageButton.do {
            $0.addTarget(self, action: #selector(profileImageButtonDidTap(sender:)), for: .touchUpInside)
            $0.viewRadius(cornerRadius: 50, maskToBounds: true)
            $0.backgroundColor = .lightGray
            $0.viewShadow()
        }
        profileImageView.do {
            $0.image = UIImage(systemName: "pawprint.circle")
            $0.tintColor = .white
        }
        dogNameTextField.do {
            let placeholderTextColor = NSAttributedString(string: "강쥐 이름",
                                                          attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
            $0.backgroundColor = .white
            $0.textAlignment = .center
            $0.attributedPlaceholder = placeholderTextColor
            $0.textColor = .darkGray
            $0.tintColor = .clear
            $0.viewRadius(cornerRadius: 25, maskToBounds: false)
            $0.addLeftPadding()
            $0.delegate = self
            $0.viewShadow()
        }
        dogTypeTextField.do {
            let placeholderTextColor = NSAttributedString(string: "어떤 강쥐?",
                                                          attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
            $0.inputView = dogTypePickerView
            $0.backgroundColor = .white
            $0.textAlignment = .center
            $0.attributedPlaceholder = placeholderTextColor
            $0.textColor = .darkGray
            $0.tintColor = .clear
            $0.viewRadius(cornerRadius: 25, maskToBounds: false)
            $0.inputAccessoryView = createDogTypeToolbar()
            $0.viewShadow()
        }
        dogTypePickerView.do {
            $0.delegate = self
            $0.dataSource = self
        }
        dogBirthDayTextField.do {
            let placeholderTextColor = NSAttributedString(string: "생년월일",
                                                          attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
            $0.inputView = dogBirthDayPicker
            $0.backgroundColor = .white
            $0.textAlignment = .center
            $0.attributedPlaceholder = placeholderTextColor
            $0.tintColor = .clear
            $0.viewRadius(cornerRadius: 25, maskToBounds: false)
            $0.inputAccessoryView = createDogBirthDayDoneToolBar()
            $0.viewShadow()
        }
        dogBirthDayPicker.do {
            if #available(iOS 13.4, *) {
                $0.preferredDatePickerStyle = .wheels
            } else {
                // Fallback on earlier versions
            }
            $0.datePickerMode = .date
            $0.locale = Locale(identifier: "ko_KR")
        }
        dogRelationTextField.do {
            let placeholderTextColor = NSAttributedString(string: "어떤 관계인가요?",
                                                          attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
            $0.inputView = dogRelationPicker
            $0.backgroundColor = .white
            $0.textAlignment = .center
            $0.attributedPlaceholder = placeholderTextColor
            $0.textColor = .darkGray
            $0.tintColor = .clear
            $0.viewRadius(cornerRadius: 25, maskToBounds: false)
            $0.inputAccessoryView = createDogRelationDoneToolBar()
            $0.viewShadow()
        }
        dogRelationPicker.do {
            $0.dataSource = self
            $0.delegate = self
        }
        saveButton.do {
            let placeholderTextColor = NSAttributedString(string: "저장",
                                                          attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            $0.backgroundColor = .systemPink
            $0.setAttributedTitle(placeholderTextColor, for: .normal)
            $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            $0.viewRadius(cornerRadius: 25, maskToBounds: true)
            $0.addTarget(self, action: #selector(saveButtonDidTap(sedner:)), for: .touchUpInside)
        }
    }
    
    func layout() {
        profileImageButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
            $0.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 100).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 100).isActive = true
        }
        profileImageView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: profileImageButton.centerXAnchor).isActive = true
            $0.centerYAnchor.constraint(equalTo: profileImageButton.centerYAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 100).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 100).isActive = true
        }
        dogNameTextField.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: dogTypeTextField.topAnchor, constant: -10).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 200).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        dogTypeTextField.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            $0.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 200).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        dogBirthDayTextField.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: dogTypeTextField.bottomAnchor, constant: 10).isActive = true
            $0.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 200).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        dogRelationTextField.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: dogBirthDayTextField.bottomAnchor, constant: 10).isActive = true
            $0.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 200).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        saveButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 200).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
    }
    
    func createDogTypeToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done,
                                      target: nil,
                                      action: #selector(dogTypeDoneDidTap))
        toolbar.setItems([doneBtn], animated: true)
        
        return toolbar
    }
    
    func createDogBirthDayDoneToolBar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done,
                                      target: nil,
                                      action: #selector(dogBirthDoneDidTap))
        toolbar.setItems([doneBtn], animated: true)
        
        return toolbar
    }
    
    func createDogRelationDoneToolBar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done,
                                      target: nil,
                                      action: #selector(dogRelationDoneDidTap))
        toolbar.setItems([doneBtn], animated: true)
        
        return toolbar
    }
    
    @objc func profileImageButtonDidTap(sender: UIButton) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    @objc func dogTypeDoneDidTap() {
        dogTypeTextField.text = dogTypeHolder
        dogTypeTextField.resignFirstResponder()
    }
    
    @objc func dogBirthDoneDidTap() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "ko_KR")
        
        dogBirthDayTextField.text = dateFormatter.string(from: dogBirthDayPicker.date)
        dogBirthDayHolder = dogBirthDayPicker.date
        dogBirthDayTextField.resignFirstResponder()
    }
    
    @objc func dogRelationDoneDidTap() {
        dogRelationTextField.text = dogRelationHolder
        dogRelationTextField.resignFirstResponder()
    }
    
    @objc func saveButtonDidTap(sedner: UIButton) {
        print("saveButtonDidTap")
        guard let profileImage = profileImageHolder,
              let birthDayHodler = dogBirthDayHolder else { return }
        presenter?.saveButtonDidTap(image: profileImage,
                                    name: dogNameHolder,
                                    type: dogTypeHolder,
                                    birth: birthDayHodler,
                                    relation: dogRelationHolder)
    }
}

extension InitViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView == dogTypePickerView {
            return 1
        } else if pickerView == dogRelationPicker {
            return 1
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == dogTypePickerView {
            return dogTypes.count
        } else if pickerView == dogRelationPicker {
            return dogRelations.count
        }
        
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == dogTypePickerView {
            return dogTypes[row]
        } else if pickerView == dogRelationPicker {
            return dogRelations[row]
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == dogTypePickerView {
            dogTypeHolder = dogTypes[row]
        } else if pickerView == dogRelationPicker {
            dogRelationHolder = dogRelations[row]
        }
    }
}

extension InitViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == dogNameTextField {
            dogNameHolder = dogNameTextField.text ?? ""
            dogNameTextField.resignFirstResponder()
        }
        return true
    }
}

extension InitViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let date = self.getCreateDate(by: info) {
            print("이 사진의 exif 데이트 값 : ", date.toString())
            
        }
        print(info)
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            profileImageView.image = image
            guard let profileImage = image.pngData() else { return }
            profileImageHolder = profileImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func getCreateDate(by info: [UIImagePickerController.InfoKey : Any]) -> Date? {
        guard let asset = info[.phAsset] as? PHAsset else {
            return getExifDate(by: info)
        }
        return asset.creationDate
    }
    
    func getExifDate(by info: [UIImagePickerController.InfoKey : Any]) -> Date? {
        guard let url = info[.imageURL] as? NSURL else { return nil }
        guard let imageSource = CGImageSourceCreateWithURL(url, nil) else { return nil }
        let imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, nil) as Dictionary?
        let exifDict = imageProperties?[kCGImagePropertyExifDictionary]
        guard let dateTimeOriginal = exifDict?[kCGImagePropertyExifDateTimeOriginal] as? String else { return nil }
        
        let format = "yyyy-MM-dd HH:mm:ss"
        return makeExitDate(of: dateTimeOriginal, by: format)
    }
    
    func makeExitDate(of dateTimeOriginal: String, by format: String) -> Date? {
        let dateOfFirstSection = String(dateTimeOriginal.split(separator: " ").first ?? "")
        let dateOfSecondSection = String(dateTimeOriginal.split(separator: " ").last ?? "")
        var exitDate = dateOfFirstSection.replacingOccurrences(of: ":", with: "-")
        exitDate = exitDate + " " + dateOfSecondSection
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = format
        dateFormatter.date(from: exitDate)
        return Date()
    }
}

extension InitViewController: InitViewControllerProtocol {
    
}

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        
        return dateFormatter.string(from: self)
    }
}
