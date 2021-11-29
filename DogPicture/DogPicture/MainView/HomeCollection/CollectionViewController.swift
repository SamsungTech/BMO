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
    
    fileprivate let systemImageNameArray = [
            "moon", "zzz", "sparkles", "cloud", "tornado", "smoke.fill", "tv.fill",
            "gamecontroller", "headphones", "flame", "bolt.fill", "hare", "tortoise",
            "moon", "zzz", "sparkles", "cloud", "tornado", "smoke.fill", "tv.fill",
            "gamecontroller", "headphones", "flame", "bolt.fill", "hare", "tortoise",
            "ant", "hare", "car", "airplane", "heart", "bandage", "waveform.path.ecg",
            "staroflife", "bed.double.fill", "signature", "bag", "cart", "creditcard",
            "clock", "alarm", "stopwatch.fill", "timer"
        ]
    
    let collectionViewLayout = UICollectionViewFlowLayout()
    let segmentedControl = UISegmentedControl()
    var homeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        view.backgroundColor = .white
    }
    
    func updateView() {
        attribute()
        layout()
    }
    
    func attribute() {
        [ homeCollectionView, segmentedControl ].forEach() { view.addSubview($0) }
        collectionViewLayout.do {
            $0.minimumLineSpacing = 10
        }
        homeCollectionView.do {
            $0.frame = .zero
            $0.collectionViewLayout = createCompositionalLayout()
            $0.register(CollectionViewCell.self, forCellWithReuseIdentifier: "HomeCollectionViewCell")
            $0.dataSource = self
            $0.delegate = self
            $0.autoresizingMask = [.flexibleWidth, .flexibleHeight] // 자유자재로 만들어주기!
        }
        segmentedControl.do {
            $0.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)], for: .normal)
            $0.insertSegment(withTitle: "첫번째", at: 0, animated: true)
            $0.insertSegment(withTitle: "두번째", at: 1, animated: true)
            $0.insertSegment(withTitle: "세번째", at: 2, animated: true)
            $0.backgroundColor = .lightGray
            $0.addTarget(self, action: #selector(segmentedButtonDidTap(sender:)), for: .valueChanged)
            $0.selectedSegmentIndex = 0
        }
    }
    
    
    func layout() {
        segmentedControl.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 60).isActive = true
        }
        homeCollectionView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }
    }
    
    @objc func segmentedButtonDidTap(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            number = 1
            self.homeCollectionView.collectionViewLayout = createCompositionalLayout(float: 1, int: 1)
        case 1:
            number = 2
            self.homeCollectionView.collectionViewLayout = createCompositionalLayout(float: 2, int: 2)
        case 2:
            number = 3
            self.homeCollectionView.collectionViewLayout = createCompositionalLayout(float: 3, int: 3)
        default:
            number = 1
        }
    }
}

extension CollectionViewController {
    // 콤포지셔널 레이아웃 설정
    fileprivate func createCompositionalLayout(float: CGFloat = 3, int: Int = 3) -> UICollectionViewLayout {
        // 콤포지셔널 레이아웃 생성
        
        let layout = UICollectionViewCompositionalLayout{
            // 만들게 되면 튜플 (키: 값, 키: 값) 의 묶음으로 들어옴
            // 반환하는 것은 NSCollectionLayoutSection 콜렉션 레이아웃 섹션을 반환해야함
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            // 아이템에 대한 사이즈 - absolute 는 고정값, estimated 는 추측, fraction 퍼센트
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .fractionalHeight(1.0))
            
            // 위에서 만든 아이템 사이즈로 아이템 만들기
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 2,
                                                         leading: 2,
                                                         bottom: 2,
                                                         trailing: 2)
            let groupHeight = NSCollectionLayoutDimension.fractionalWidth(1/float)
            
            // 그룹 사이즈
            let groudSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: groupHeight)
            
            // 그룹 사이즈로 그룹 만들기
//            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groudSize,
//                                                           subitems: [item, item, item])
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groudSize,
                                                           subitem: item, count: int)
            
            // 그룹으로 섹션 만들기
            let section = NSCollectionLayoutSection(group: group)
//            section.orthogonalScrollingBehavior = .groupPaging//꺽임
            
            
            // 섹션에 대한 간격 설정
            section.contentInsets = NSDirectionalEdgeInsets(top: 20,
                                                            leading: 20,
                                                            bottom: 20,
                                                            trailing: 20)
            
            return section
        }
        
        
        return layout
    }
}

extension CollectionViewController: UICollectionViewDelegate {
    
}

extension CollectionViewController: UICollectionViewDataSource {
    
    // 각 section에 들어가는 아이템 갯수
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return systemImageNameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell",
                                                      for: indexPath) as! CollectionViewCell
        
        // 데이터에 따른 셀 UI 변경
        // 이미지에 대한 설정
//        cell.dogImageView.image = UIImage(systemName: systemImageNameArray[indexPath.item])
        // 라벨 설정
//        cell.dogImageName.text = systemImageNameArray[indexPath.item]
        cell.imageName = self.systemImageNameArray[indexPath.item]
        
        return cell
    }
    
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
    
}

extension CollectionViewController: CollectionViewProtocol {
    
}
