//
//  FriendsListViewController.swift
//  Second_Assignment
//
//  Created by 누리링 on 2022/10/14.
//

import UIKit
import SnapKit

class FriendsListViewController: UIViewController {
    
    

    private let friendScroll : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    
    private let topView : UIView = {
        let view = UIView()
        return view
    }()
        
    private let friendLabel : UILabel = {
        let label = UILabel()
        label.text = "친구"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 23)
        return label
    }()
    
    
    private let settingImage : UIImageView = {

        let imageView = UIImageView()
        imageView.image = UIImage(named: "infinity")
        return imageView
    }()
    
    
    lazy var profileButton : UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(touchUpProfileButton), for: .touchUpInside)
        button.setImage(UIImage(named: "person.fill"), for: .normal)
        return button
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        Listlayout()

    }
    
    
    private func showMyProfileVC(){
        let ProfileVC = MyProfileViewController()
        ProfileVC.modalPresentationStyle = .formSheet
    }
    
        
    @objc
    private func touchUpProfileButton(){
        showMyProfileVC()
    }
}


extension FriendsListViewController {
    
    private func Listlayout() {
        view.addSubview(friendScroll)
        [topView, profileButton].forEach{friendScroll.addSubview($0)
        }
        
        
        [friendLabel,settingImage].forEach{topView.addSubview($0)
        }
        
        friendScroll.snp.makeConstraints{ make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        topView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(-3)
            make.leading.equalToSuperview()
            make.width.equalTo(375)
            make.height.equalTo(52)
        }
        
        friendLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(15)
            make.leading.equalToSuperview().offset(14)
        }
        
        settingImage.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalTo(self.friendLabel.snp.trailing).offset(4)
            make.width.equalTo(21)
            make.height.equalTo(21)
        }
        
        profileButton.snp.makeConstraints{ make in
            make.top.equalTo(self.topView.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(14)
            make.width.equalTo(59)
            make.height.equalTo(58)
        }
        
    }
    
}
