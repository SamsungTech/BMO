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
    let popButtonImage = UIImageView()
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
    var captureImageData = Data()
    var captureIndexPath: Int = 0
    
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
        popButton.addSubview(popButtonImage)
        nextButton.addSubview(nextButtonLabel)
        
        topBar.do {
            $0.backgroundColor = .white
        }
        popButton.do {
            $0.addTarget(self, action: #selector(popButtonDidTap(sender:)), for: .touchUpInside)
        }
        popButtonImage.do {
            $0.tintColor = .darkGray
            $0.image = UIImage(systemName: "chevron.backward")
        }
        photoCount.do {
            let photoTotalCount = captureImageHolder.count
            let IntIntoString = String(photoTotalCount)
            $0.textColor = .darkGray
            $0.text = IntIntoString
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
            $0.backgroundColor = .systemGreen
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
        popButtonImage.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: popButton.centerXAnchor).isActive = true
            $0.centerYAnchor.constraint(equalTo: popButton.centerYAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 20).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 20).isActive = true
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
        
    }
}

extension PreviewViewController: UICollectionViewDelegate {
    
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
        return CGSize(width: size.width, height: size.height)
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
        }
    }
    
    
}
