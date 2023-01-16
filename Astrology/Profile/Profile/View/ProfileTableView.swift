//
//  ProfileTableView.swift
//  Astrology
//
//  Created by mac on 13.01.2023.
//

import UIKit

class ProfileTableView: UITableView {
    
    let settings: [ProfileSetting]
    
    var coordinator: ProfileCoordinator?
        
    init(settings: [ProfileSetting]) {
        self.settings = settings
        super.init(frame: .zero, style: .plain)
        
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        
        separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        backgroundColor = .clear
    
                
//        allowsSelection = false
        
        contentInset.bottom = 60
        
        delegate = self
        dataSource = self
        
        let cellClass = ProfileTableViewCell.self
        let identifier = String(describing: cellClass)
        
        register(cellClass, forCellReuseIdentifier: identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ProfileTableView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier =  String(describing: ProfileTableViewCell.self)
        
        guard let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? ProfileTableViewCell else {
            
            return ProfileTableViewCell()
        }
        
        let setting = settings[indexPath.item]
        cell.titleLabel.text = setting.title
        cell.iconImageView.image = setting.image
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        deselectRow(at: indexPath, animated: true)
        
        let setting = settings[indexPath.item]
        
        switch setting {
        case .editProfile:
            coordinator?.eventOccured(.editProfile)
        case .notifications:
//            if let cell = cellForRow(at: indexPath) as? ProfileTableViewCell {
//               cell set new image according to viewModel
//            }
            ()
        case .helpCenter:
            coordinator?.eventOccured(.helpCenter)
        case .rateApp:
            break
        case .logOut:
            break
        }
    }
    
}
