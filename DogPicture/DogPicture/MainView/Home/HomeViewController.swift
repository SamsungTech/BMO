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
       
    private let segmentedButtonTitles = ["1월", "2월", "3월", "4월", "5월", "6월", "7월"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        view.backgroundColor = .white
        let codeSegmented = CustomSegmentedControl(frame: CGRect(x: 0,
                                                                 y: 50,
                                                                 width: 400,
                                                                 height: 300),
                                                   buttonTitle: segmentedButtonTitles)
        codeSegmented.backgroundColor = .clear
        view.addSubview(codeSegmented)
        view.frame = CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
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
