//
//  FriendsListTableViewCell.swift
//  KAKAO_Service
//
//  Created by 누리링 on 2022/11/03.
//

import UIKit

import SnapKit
import SwiftyColor
import Then

class FriendsListTableViewCell: UITableViewCell {

    static let identifier = "FriendsListTableViewCell"
    
    private let profileContainerView = UIView()
    
    private let profileImage = UIImageView().then{
        $0.layer.cornerRadius =  17
        $0.clipsToBounds = true
    }
    
    private let friendName = UILabel().then{
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 12, weight: .medium)
    }
    
    private let profileMessage = UILabel().then{
        $0.textColor = 0xA6A6A6.color
        $0.font = .systemFont(ofSize: 11, weight: .medium)
    }
    
    
    // MARK: - Life Cycles
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension FriendsListTableViewCell {
    
    private func layout() {
        backgroundColor = .white
        contentView.backgroundColor = .clear
        
        
        [profileContainerView, friendName, profileMessage].forEach{
            contentView.addSubview($0)
        }
        
        profileContainerView.addSubview(profileImage)
        
        contentView.snp.makeConstraints{ make in
            make.width.equalTo(340)
            make.height.equalTo(50)
        }
        
        
        
        profileContainerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(15)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        
        
        profileImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(7)
            make.leading.equalToSuperview().offset(16)
            make.width.height.equalTo(58)
        }
        
        friendName.snp.makeConstraints{ make in
            make.leading.equalTo(profileImage.snp.trailing).offset(11)
            make.top.equalToSuperview().offset(19)
        }
        
        profileMessage.snp.makeConstraints{ make in
            make.leading.equalTo(friendName)
            make.top.equalTo(friendName.snp.bottom).offset(6)
            
        }
    }
    
    
    
    func dataBind(model: FriendModel){
        friendName.text = model.friendName
        profileMessage.text = model.profileMessage
        profileImage.image = UIImage(named: model.profileImage)
        
    }
    
}
