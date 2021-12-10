//
//  MultiPickerViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/12/08.
//

import Foundation
import UIKit
import Photos

class MultiPickerViewController: UIViewController {
    var presenter: MultiPickerPresenterProtocol?
    
    let collectionViewCell = UIImageView()
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        view.backgroundColor = .systemTeal
        setAllPhotoLibraryImage()
    }
    
    func updateView() {
        attribute()
        layout()
    }
    
    func attribute() {
        view.addSubview(collectionViewCell)
        view.addSubview(button)
        
        button.do {
            $0.addTarget(self, action: #selector(buttonDidtap(sender:)), for: .touchUpInside)
            $0.backgroundColor = .systemPink
            $0.viewRadius(cornerRadius: 20, maskToBounds: false)
        }
    }
    func layout() {
        collectionViewCell.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            $0.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.maxX/3).isActive = true
            $0.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.maxX/3).isActive = true
        }
        button.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: collectionViewCell.bottomAnchor, constant: 10).isActive = true
            $0.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 80).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
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
    
    private func setAllPhotoLibraryImage() {
        var allPhotos: PHFetchResult<PHAsset>?
        
        allPhotos = PHAsset.fetchAssets(with: nil)
        
        let asset = allPhotos?.objects(at: )
    }
    
    
    
    @objc func buttonDidtap(sender: UIButton) {
        setAllPhotoLibraryImage()
    }
}

extension MultiPickerViewController: MultiPickerViewControllerProtocol {
    
}

class ImageManager {
    static let shared = ImageManager()
    
    private let imageManager = PHImageManager()
    
    func requestImage(from asset: PHAsset,
                      thumnailSize: CGSize,
                      completion: @escaping (UIImage?) -> Void) {
        self.imageManager.requestImage(for: asset,
                                          targetSize: thumnailSize,
                                          contentMode: .aspectFill,
                                          options: nil) { image, info in
            completion(image)
        }
    }
}
