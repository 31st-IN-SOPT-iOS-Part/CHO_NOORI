//
//  GalleryTableViewCell.swift
//  KAKAO_Service
//
//  Created by 누리링 on 2022/11/03.
//

import UIKit

class GalleryTableViewCell: UITableViewCell {

    static let identifier = "GalleryTableViewCell"
    
    private let photoImage = UIImageView()
    
    private let photoImageView = UIImageView()
//
//    private let imageIndexView = UIView().then {
//        $0.backgroundColor = .yellow
//        $0.layer.masksToBounds = true
//        $0.layer.cornerRadius = 9
//        $0.isHidden = true
//
//    }
    
    private let imageIndexLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 10, weight: .medium)
        $0.isHidden = true
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GalleryTableViewCell {
    private func layout() {
        backgroundColor = .white
        contentView.backgroundColor = .clear
        
        contentView.addSubview(photoImage)
        
        contentView.snp.makeConstraints {
            $0.width.equalTo(119)
            $0.height.equalTo(119)
        }
        
        photoImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
    
    func dataBind(model: GalleryModel){
        photoImage.image = UIImage(named: model.image)
        
    }
}
