//
//  HomeViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/05/28.
//

import UIKit
import Then


class HomeViewController: UIViewController {
    
    private var collectionView: UICollectionView?
    
    
    var presenter: HomePresenterProtocol?
    
    let chuImage = [ "chu2", "chu3", "chu4", "chu5" ]
    var tableView = UITableView()
    var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tab_Home"
        let layout = UICollectionViewFlowLayout() // 얜 뭘까
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: (view.frame.size.width/3)-4,
                                 height: (view.frame.size.width/3)-4)
        self.view.backgroundColor = .white
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        guard let collectionView = collectionView else { return }
        collectionView.register(HomeViewCollectionViewCell.self,
                                forCellWithReuseIdentifier: HomeViewCollectionViewCell.identifier)
        collectionView.dataSource = self // dataSource에 대한 이해 필요
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
        createSegmentedControl()
    }
    
    func createSegmentedControl() {
        let items = ["1월달","2월달","3월달","4월달"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.addTarget(self, action: #selector(suitDidChange(_:)), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        NSLayoutConstraint.activate([
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            segmentedControl.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 75)
        ])
    }
    
    @objc func suitDidChange(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            imageView.image = UIImage(named: "chu2")
        case 1:
            imageView.image = UIImage(named: "chu3")
        case 2:
            imageView.image = UIImage(named: "chu4")
        case 3:
            imageView.image = UIImage(named: "chu5")
        default:
            imageView.backgroundColor = .systemBlue
            
        }
    }
    
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chuImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeViewCollectionViewCell.identifier,
                                                      for: indexPath) as! HomeViewCollectionViewCell// dequeueReusableCell 에 대한 이해 필요
        cell.configure(label: "Custom \(indexPath.row)") // as! HomeViewCollectionViewCell 을 넣었더니 이 문이 됐다 왜일까?
        return cell
    }
    
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chuImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.id, for: indexPath) as? HomeTableViewCell
        let image = chuImage[indexPath.row]
        cell?.chuImageView.image = UIImage(named: image)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showMemo(for: chuImage[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(300)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.layoutIfNeeded()
    }
}

extension HomeViewController: HomeViewProtocol {
    
}
