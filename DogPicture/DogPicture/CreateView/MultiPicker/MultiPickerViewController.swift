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
        updateView()
        view.backgroundColor = .systemTeal
//        setAllPhotoLibraryImage()
    }
    
    func updateView() {
        attribute()
        layout()
    }
    
    func attribute() {
        [ multiPickerCollectionView ].forEach() { view.addSubview($0) }
        
        multiPickerCollectionView.do {
            $0.backgroundColor = .blue
            $0.register(MultiPickerCollectionViewCell.self,
                        forCellWithReuseIdentifier: "MultiPickerCollectionViewCell")
            $0.dataSource = self
            $0.delegate = self
            $0.reloadData()
        }
        let fetchOption = PHFetchOptions()
        fetchOption.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]

        self.allPhotos = PHAsset.fetchAssets(with: fetchOption)
    }
    func layout() {
        multiPickerCollectionView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }
    }
    
//    private func setPhotoLibraryImage() {
//        let fetchOption = PHFetchOptions()
//
//        fetchOption.fetchLimit = 1
//        fetchOption.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
//
//        let fetchPhotos = PHAsset.fetchAssets(with: fetchOption)
//
//        if let photo = fetchPhotos.firstObject {
//            DispatchQueue.main.async {
//                ImageManager.shared.requestImage(from: photo, thumnailSize: self.collectionViewCell.frame.size) { image in
//                    // 가져온 이미지로 (image 파라미터) 하고 싶은 행동
//                    self.collectionViewCell.image = image
//                }
//            }
//        } else {
//            // 사진이 없을 때, 디폴트 이미지 지정
//            self.collectionViewCell.image = UIImage(systemName: "xmark")
//        }
//    }
    
    
    
    
    @objc func buttonDidtap(sender: UIButton) {
//        setAllPhotoLibraryImage()
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
