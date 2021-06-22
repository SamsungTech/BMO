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
    
    let chuImage = [ "chu2", "chu3", "chu4", "chu5", "chu6" ]
    var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        layout()
        
    }
    
    func attribute() {
        
        tableView.register(HomeTableViewCell.self,
                           forCellReuseIdentifier: HomeTableViewCell.id)
    }
    
    func layout() {
        
    }
    
    
}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.id, for: indexPath) as? HomeTableViewCell
        cell?.ImageView?.image = UIImage(named: chuImage[indexPath.row])
//        cell.setData(정보들)
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chuImage.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showMemo(for: chuImage[indexPath.row])
    }
    
    
}
