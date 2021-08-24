//
//  HomeViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/05/28.
//

import UIKit
import Then

class HomeViewController: UIViewController {
    
    let items = ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"]
        
    var presenter: HomePresenterProtocol?
    
    let stackView = UIStackView()
    let scrollView = UIScrollView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        view.backgroundColor = .white
        configureScrollableSegmentedControl()
    }
    
    func configureScrollableSegmentedControl() {
        let segmetedControl = UISegmentedControl(items: items)
        
        let scrollView = UIScrollView()
        
        scrollView.addSubview(segmetedControl)
        view.addSubview(scrollView)
        
        scrollView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        segmetedControl.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 45).isActive = true
        }
    }
}


//extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return chuImage.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.id, for: indexPath) as? HomeTableViewCell
//        let image = chuImage[indexPath.row]
//        cell?.chuImageView.image = UIImage(named: image)
//        return cell ?? UITableViewCell()
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        presenter?.showMemo(for: chuImage[indexPath.row])
//    }
//
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return CGFloat(300)
//    }
//
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        cell.layoutIfNeeded()
//    }
//}

extension HomeViewController: HomeViewProtocol {
    func showChu(chu: [UIImage?]) {
        print(chu)
    }
    
    func segmentDidChanged() {
        print("뷰관련 동작인 애니메이션 등등..")
    }
}
