//
//  SettingViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/06/25.
//

import UIKit

class SettingViewController: UIViewController {
    var presenter: SettingPresenterProtocol?
    var settingTitlesSection1: [String] = ["강아지 등록하기", "가족 초대", "앨범 관리"]
    var settingTitlesSection2: [String] = ["업로드", "보안", "알림"]
    var settingTitlesSection3: [String] = ["독사진 리뷰하기", "친구에게 추천하기", "도움말 & 피드백"]
    var settingImagesSection1: [String] = ["pawprint.circle", "house.circle", "person.crop.rectangle.stack"]
    var settingImagesSection2: [String] = ["arrow.up.square", "exclamationmark.shield", "bell.square"]
    var settingImagesSection3: [String] = ["arrow.up.heart", "arrowshape.turn.up.left", "doc.append"]
    var settingImageColor1: [UIColor] = [.systemPink, .systemGreen, .systemYellow]
    var settingImageColor2: [UIColor] = [.systemGreen, .systemBlue, .white]
    var settingImageColor3: [UIColor] = [.systemPink, .systemGreen, .white]
    var settingTintcolor: [UIColor] = [.white, .white, .gray]
    var settingTableView = UITableView()
    
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
        [ settingTableView ].forEach() { view.addSubview($0) }
        
        navigationController?.do {
            $0.navigationBar.prefersLargeTitles = true
            $0.navigationBar.topItem?.title = "설정입니다."
        }
        
        settingTableView.do {
            let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 10))
            $0.delegate = self
            $0.dataSource = self
            $0.register(SettingTableViewIdCell.self, forCellReuseIdentifier: "SettingTableViewIdCell")
            $0.register(SettingTableViewCell.self, forCellReuseIdentifier: "SettingTableViewCell")
            $0.register(SettingFooterViewCell.self, forCellReuseIdentifier: "SettingFooterViewCell")
            $0.tableFooterView = footer
        }
        
        
    }
    func layout() {
        settingTableView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }
        
    }
}

extension SettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("헬예~")
        presenter?.showLocalPushView()
    }
}

extension SettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 3
        case 2:
            return 3
        case 3:
            return 3
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewIdCell") as! SettingTableViewIdCell
                
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell") as! SettingTableViewCell
            cell.settingImage.image = UIImage(systemName: settingImagesSection1[indexPath.item])
            cell.settingLabel.text = settingTitlesSection1[indexPath.item]
            cell.settingImage.backgroundColor = settingImageColor1[indexPath.item]
            cell.settingImage.tintColor = .white
                
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell") as! SettingTableViewCell
            cell.settingImage.image = UIImage(systemName: settingImagesSection2[indexPath.item])
            cell.settingLabel.text = settingTitlesSection2[indexPath.item]
            cell.settingImage.backgroundColor = settingImageColor2[indexPath.item]
            cell.settingImage.tintColor = settingTintcolor[indexPath.item]
            
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell") as! SettingTableViewCell
            cell.settingImage.image = UIImage(systemName: settingImagesSection3[indexPath.item])
            cell.settingLabel.text = settingTitlesSection3[indexPath.item]
            cell.settingImage.backgroundColor = settingImageColor3[indexPath.item]
            cell.settingImage.tintColor = settingTintcolor[indexPath.item]
            
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingFooterViewCell") as! SettingFooterViewCell
            
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 90
        } else if indexPath.section == 4 {
            return 200
        }
        return 50
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 3 {
            return 0
        } else if section == 4 {
            return 0
        }
        return 25
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = UIView(frame: CGRect(x: .zero, y: .zero, width: UIScreen.main.bounds.maxX, height: 25))
        footer.backgroundColor = .white
        return footer
    }
}

extension SettingViewController: SettingViewProtocol {
    
}
