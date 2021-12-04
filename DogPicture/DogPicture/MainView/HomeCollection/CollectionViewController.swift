//
//  HomeCeollectionViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/11/22.
//

import Foundation
import UIKit

class CollectionViewController: UIViewController {
    var presenter: CollectionPresenterProtocol?
    var number: Int = 1
    var dogImageDataHolder: [Model] = []
    let collectionViewLayout = UICollectionViewFlowLayout()
    let segmentedControl = UISegmentedControl()
    var homeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.maxX/3)-4,
                                 height: (UIScreen.main.bounds.maxX/3)-4)
        
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        presenter?.viewDidLoad()
        view.backgroundColor = .white
    }
    
    func updateView() {
        attribute()
        layout()
    }
    
    func attribute() {
        [ homeCollectionView ].forEach() { view.addSubview($0) }
        collectionViewLayout.do {
            $0.minimumLineSpacing = 10
        }
        homeCollectionView.do {
            $0.frame = .zero
            $0.register(CollectionViewCell.self, forCellWithReuseIdentifier: "HomeCollectionViewCell")
            $0.dataSource = self
            $0.delegate = self
        }
    }
    
    
    func layout() {
        homeCollectionView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }
    }
}

extension CollectionViewController {
    
}

extension CollectionViewController: UICollectionViewDelegate {
    
}

extension CollectionViewController: UICollectionViewDataSource {
    
    // 각 section에 들어가는 아이템 갯수
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return dogImageDataHolder.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell",
                                                      for: indexPath) as! CollectionViewCell
        let data = dogImageDataHolder[indexPath.item].photo
        cell.dogImageView.image = UIImage(data: data!)
        
        return cell
    }
    
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
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

extension CollectionViewController: CollectionViewProtocol {
    func containModelData(data: [Model]) {
        dogImageDataHolder = data
    }
}
