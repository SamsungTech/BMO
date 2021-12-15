//
//  MultiPickerViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/12/08.
//

import Foundation
import UIKit
import Photos
import PhotosUI

class MultiPickerViewController: UIViewController {
    var presenter: MultiPickerPresenterProtocol?
    
    var selectedImage = UIImageView()
    var selectedImageHolder: [Data] = []
    var selectedImageDateDataHolder: [Date] = []
    var bottomBar = UIView()
    var selectedPhotoCountLabel = UILabel()
    let nextButton = UIButton()
    var multiPickerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.maxX/3)-1,
                                 height: (UIScreen.main.bounds.maxX/3)-4)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return collectionView
    }()
    var allPhotos: PHFetchResult<PHAsset>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        layout()
        photoFetchAsset()
        view.backgroundColor = .systemTeal
    }
    
    func configure() {
        [ selectedImage, multiPickerCollectionView, bottomBar ].forEach() { view.addSubview($0) }
        [ selectedPhotoCountLabel, nextButton ].forEach() { bottomBar.addSubview($0) }
        
        multiPickerCollectionView.do {
            $0.backgroundColor = .blue
            $0.register(MultiPickerCollectionViewCell.self,
                        forCellWithReuseIdentifier: "MultiPickerCollectionViewCell")
            $0.dataSource = self
            $0.delegate = self
            $0.reloadData()
        }
        bottomBar.do {
            $0.backgroundColor = .white
        }
        selectedPhotoCountLabel.do {
            $0.textColor = .black
            $0.font = UIFont.boldSystemFont(ofSize: 20)
            $0.text = "0"
        }
        nextButton.do {
            $0.backgroundColor = .systemPink
            $0.viewRadius(cornerRadius: 15, maskToBounds: false)
            $0.addTarget(self, action: #selector(nextButtonDidTap(sender:)), for: .touchUpInside)
        }
    }
    
    func layout() {
        selectedImage.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 400).isActive = true
        }
        multiPickerCollectionView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: selectedImage.bottomAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70).isActive = true
        }
        bottomBar.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: multiPickerCollectionView.bottomAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }
        selectedPhotoCountLabel.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: bottomBar.topAnchor, constant: 5).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        }
        nextButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: bottomBar.topAnchor, constant: 5).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 80).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 30).isActive = true
        }
    }
    
    func photoFetchAsset() {
        let fetchOption = PHFetchOptions()
        fetchOption.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        self.allPhotos = PHAsset.fetchAssets(with: fetchOption)
    }
}

extension MultiPickerViewController {
    @objc func buttonDidtap(sender: UIButton) {
        
    }
    @objc func nextButtonDidTap(sender: UIButton) {
        presenter?.nextButtonCilcked(photo: selectedImageHolder, date: selectedImageDateDataHolder)
    }
}

extension MultiPickerViewController: UICollectionViewDataSource {
    
    // 각 section에 들어가는 아이템 갯수
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return allPhotos?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = multiPickerCollectionView.dequeueReusableCell(withReuseIdentifier: "MultiPickerCollectionViewCell", for: indexPath)
        guard let multiCell = cell as? MultiPickerCollectionViewCell else { return cell }
        let asset = self.allPhotos?[indexPath.item]
        let thumnailSize = CGSize(width: 100, height: 100)
        DispatchQueue.main.async {
            LocalImageManager.shared.requestImage(with: asset,
                                                  thumbnailSize: thumnailSize) { (image) in
                multiCell.imageView.image = image
            }
        }
        
        return multiCell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let asset = self.allPhotos?[indexPath.item]
        LocalImageManager.shared.requestImage(with: asset,
                                              thumbnailSize: selectedImage.frame.size) { (image) in
            self.selectedImage.image = image
            if let selectedImage = image {
                guard let imageData = selectedImage.pngData() else { return }
                self.selectedImageHolder.append(imageData)
                guard let createDate = asset?.creationDate else { return }
                print("선택한 사진의 생성 날짜는?? : ", createDate)
                self.selectedImageDateDataHolder.append(createDate)
            }
        }
        self.selectedPhotoCountLabel.text = String(selectedImageHolder.count)
    }
}

extension MultiPickerViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 0, bottom: 2, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

extension MultiPickerViewController: MultiPickerViewControllerProtocol {
    
}
