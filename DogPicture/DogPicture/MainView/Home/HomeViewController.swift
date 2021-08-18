//
//  HomeViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/05/28.
//

import UIKit
import Then


class HomeViewController: UIViewController {
    
//    private var collectionView: UICollectionView?
//
//    private enum Constants {
//        static let underlineViewColor: UIColor = .systemBlue
//        static let underlineViewHeight: CGFloat = 2
//    }
//
    
    var presenter: HomePresenterProtocol?
    
    let chuImage = [ "chu2", "chu3", "chu4", "chu5" ]
//    let scrollView = UIScrollView()
//    let bottomUnderLineView = UIView()
    let segmentedControl = UISegmentedControl()
    
//    var imageView = UIImageView()
    
    override func loadView() {
        super.loadView()
        print("ViewController - loadView() called")
        let homeCustomSegmentControl = HomeCustomSegmentControl(frame: CGRect(x: 0, y: 0, width: 390, height: 50), buttonTitle: ["1월","2월","3월","4월"])
        
        self.view.addSubview(homeCustomSegmentControl)
        
        homeCustomSegmentControl.do {
            $0.backgroundColor = .systemRed
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.widthAnchor.constraint(equalToConstant: 400).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 52).isActive = true
            $0.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
            $0.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tab_Home"
        view.backgroundColor = .white
//        attributeScrollView()
//        createSegmentedControlItems()
//        configureScrollableSegmentedControl()
    }
    
//
//    func attributeScrollView() {
//        scrollView.do {
//            $0.contentSize = CGSize(width: .zero, height: 50)
//        }
//        bottomUnderLineView.do {
//            $0.backgroundColor = .systemBlue
//        }
//    }
    
//    func createSegmentedControlItems() {
//        segmentedControl.do {
//            $0.backgroundColor = .clear
//            $0.tintColor = .clear
//
//            $0.insertSegment(withTitle: "1월", at: 0, animated: true)
//            $0.insertSegment(withTitle: "2월", at: 1, animated: true)
//            $0.insertSegment(withTitle: "3월", at: 2, animated: true)
//            $0.insertSegment(withTitle: "4월", at: 3, animated: true)
//            $0.selectedSegmentIndex = 0 // Default 값
//            $0.setTitleTextAttributes([
//                NSAttributedString.Key.foregroundColor: UIColor.black,
//                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .regular)
//            ], for: .normal)
//            $0.setTitleTextAttributes([
//                NSAttributedString.Key.foregroundColor: UIColor.systemBlue,
//                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold)
//            ], for: .selected)
//            $0.addTarget(self, action: #selector(segmentedControlItemDipTap(_:)), for: .valueChanged)
//        }
//    }
//
//    func configureScrollableSegmentedControl() {
//
//        [ segmentedControl, bottomUnderLineView ].forEach() { scrollView.addSubview($0) }
//        [ scrollView ].forEach() { view.addSubview($0) }
//
//        segmentedControl.do {
//            $0.translatesAutoresizingMaskIntoConstraints = false
//            $0.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
//            $0.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
//            $0.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
//            $0.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 5).isActive = true
//        }
//        bottomUnderLineView.do {
//            $0.translatesAutoresizingMaskIntoConstraints = false
//            $0.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor).isActive = true
//            $0.heightAnchor.constraint(equalToConstant: Constants.underlineViewHeight).isActive = true
//            $0.widthAnchor.constraint(equalTo: segmentedControl.widthAnchor,
//                                      multiplier: 1 / CGFloat(segmentedControl.numberOfSegments)).isActive = true
//        }
//        scrollView.do {
//            $0.translatesAutoresizingMaskIntoConstraints = false
//            $0.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
//            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        }
//    }
//
//    @objc private func segmentedControlItemDipTap(_ serder: UISegmentedControl) {
//
//    }
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
