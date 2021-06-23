//
//  HomeViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/05/28.
//

import UIKit
import Then


class HomeViewController: UIViewController {
    var presenter: HomePresenterProtocol?
    
    let chuImage = [ "chu2", "chu3", "chu4", "chu5" ]
    var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        layout()
    }
    
    func attribute() {
        tableView.do {
            $0.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.id)
            // 델레게이트 왜 ?
            $0.delegate = self
            // 데이터 소스 왜?
            $0.dataSource = self
            $0.frame = view.bounds
            $0.backgroundColor = .blue
        }
    }
    
    func layout() {
        [ tableView ].forEach { view.addSubview($0) }
        
        tableView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }
        
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.id, for: indexPath) as? HomeTableViewCell
        
        cell?.ImageView?.image = UIImage(named: chuImage[indexPath.row])
        
        return cell ?? UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chuImage.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showMemo(for: chuImage[indexPath.row])
    }
    
    
}
