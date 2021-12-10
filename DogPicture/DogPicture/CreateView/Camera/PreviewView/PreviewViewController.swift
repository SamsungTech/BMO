//
//  CaptureViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/09/14.
//

import UIKit

class PreviewViewController: UIViewController {
    var presenter: PreviewPresenterProtocol?
    var topBar = UIView()
    let popButton = UIButton()
    let popLabel = UILabel()
    var photoCount = UILabel()
    var nextButton = UIButton()
    var nextButtonLabel = UILabel()
    var bottomBar = UIView()
    var previewCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        return collectionView
    }()
    var captureImageHolder = [UIImage]()
    var captureImageDataHolder = [Data]()
    var captureImageData = Data()
    var captureIndexPath: Int = 0
    var selectedImageData = Data()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        updateView()
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func updateView() {
        attribute()
        layout()
    }
    
    func attribute() {
        [ previewCollectionView, topBar ].forEach() { view.addSubview($0) }
        [ popButton, photoCount, nextButton ].forEach() { topBar.addSubview($0) }
        view.bringSubviewToFront(topBar)
        popButton.addSubview(popLabel)
        nextButton.addSubview(nextButtonLabel)
        
        
        topBar.do {
            $0.backgroundColor = .white
            $0.viewShadow()
        }
        popButton.do {
            $0.addTarget(self, action: #selector(popButtonDidTap(sender:)), for: .touchUpInside)
        }
        popLabel.do {
            $0.textColor = .darkGray
            $0.font = UIFont.boldSystemFont(ofSize: 15)
            $0.text = "이전"
        }
        photoCount.do {
            $0.textColor = .darkGray
            $0.font = UIFont.boldSystemFont(ofSize: 16)
            $0.text = "베스트 컷을 정하세요!"
        }
        nextButton.do {
            $0.addTarget(self, action: #selector(nextButtonDidTap(sender:)), for: .touchUpInside)
        }
        nextButtonLabel.do {
            $0.text = "다음"
            $0.font = UIFont.boldSystemFont(ofSize: 15)
            $0.textColor = .darkGray
        }
        previewCollectionView.do {
            $0.backgroundColor = .white
            $0.register(PreviewCollectionViewCell.self, forCellWithReuseIdentifier: "PreviewCollectionViewCell")
            $0.dataSource = self
            $0.delegate = self
            $0.isPagingEnabled = true
        }
    }
    
    func layout() {
        topBar.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 90).isActive = true
        }
        popButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.leadingAnchor.constraint(equalTo: topBar.leadingAnchor, constant: 5).isActive = true
            $0.bottomAnchor.constraint(equalTo: topBar.bottomAnchor, constant: -5).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 40).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        }
        popLabel.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: popButton.centerXAnchor).isActive = true
            $0.centerYAnchor.constraint(equalTo: popButton.centerYAnchor).isActive = true
        }
        photoCount.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: topBar.centerXAnchor).isActive = true
            $0.centerYAnchor.constraint(equalTo: popButton.centerYAnchor).isActive = true
        }
        nextButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.trailingAnchor.constraint(equalTo: topBar.trailingAnchor, constant: -5).isActive = true
            $0.bottomAnchor.constraint(equalTo: topBar.bottomAnchor, constant: -5).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 40).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        }
        nextButtonLabel.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: nextButton.centerXAnchor).isActive = true
            $0.centerYAnchor.constraint(equalTo: nextButton.centerYAnchor).isActive = true
        }
        previewCollectionView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }
    }
}

extension PreviewViewController {
    @objc func popButtonDidTap(sender: UIButton) {
        presenter?.popButtonCilcked()
    }
    @objc func nextButtonDidTap(sender: UIButton) {
        presenter?.nextButtonCilcked(selectedImageData: selectedImageData)
    }
}

extension PreviewViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedImageData = captureImageDataHolder[indexPath.item]
    }
}
extension PreviewViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return captureImageHolder.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PreviewCollectionViewCell", for: indexPath) as! PreviewCollectionViewCell
        cell.imageView.image = captureImageHolder[indexPath.item]
        cell.backgroundColor = .systemPink
        return cell
    }
    
    
}
extension PreviewViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = UIScreen.main.bounds
        return CGSize(width: size.width, height: size.height/1.5)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0,
                            left: 0,
                            bottom: 0,
                            right: 0)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension PreviewViewController: PreviewViewProtocol {
    func showPreviewImage(forImage data: [Data]) {
        for i in 0...data.count-1 {
            guard let imageData = UIImage(data: data[i]) else { return }
            captureImageHolder.append(imageData)
            captureImageDataHolder = data
        }
    }
}
