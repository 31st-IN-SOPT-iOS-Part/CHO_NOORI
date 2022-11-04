//
//  ChatTableViewCell.swift
//  KAKAO_Service
//
//  Created by 누리링 on 2022/11/03.
//


import UIKit

import SnapKit
import SwiftyColor
import Then

class ChatTableViewCell: UICollectionViewCell {

    static let identifier = "ChatTableViewCell"
    
    private let profileContainerView = UIView()
    
    private let profileImage = UIImageView().then {
        $0.layer.cornerRadius = 17
        $0.clipsToBounds = true
    }

    private let name = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 12, weight: .medium)
    }
    
    private let profileMessage = UILabel().then {
        $0.textColor = 0xA6A6A6.color
        $0.font = .systemFont(ofSize: 11, weight: .medium)
    }
    
    private let time = UILabel().then {
        $0.textColor = 0xA6A6A6.color
        $0.font = .systemFont(ofSize: 8, weight: .medium)
    }
    
    // MARK: - Life Cycles
    // 초기함수 - 뷰에서 보여질때 어떤게 실행됐으면 좋은지?
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension ChatTableViewCell{
    private func layout() {
        
        backgroundColor = .white
        contentView.backgroundColor = .clear
        
        [profileContainerView, name, profileMessage, time].forEach {
            contentView.addSubview($0)
        }
        
        
        profileContainerView.addSubview(profileImage)
        
        contentView.snp.makeConstraints {
            $0.width.equalTo(340)
            $0.height.equalTo(50)
        }
        
        
        profileContainerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(15)
            $0.width.equalTo(50)
            $0.height.equalTo(50)
        }
        
        
        
        profileImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
            
        }
        
        
        name.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalTo(self.profileContainerView.snp.trailing).offset(3)
        }
 
        profileMessage.snp.makeConstraints {
            $0.top.equalTo(self.name.snp.bottom).offset(3)
            $0.leading.equalTo(self.name)
        }
        
        time.snp.makeConstraints {
            $0.top.equalToSuperview().offset(14)
            $0.leading.equalTo(self.name.snp.trailing).offset(226)
        }
        
    }
    
    func dataBind(model: ChatModel){
        profileImage.image = UIImage(named: model.profileImage)
        name.text = model.name
        profileMessage.text = model.profileMessage
        time.text = model.time
        
    }
}



