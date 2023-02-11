//
//  MyPageViewController.swift
//  Second_Assignment
//
//  Created by 누리링 on 2022/10/14.
//

import UIKit
import SnapKit


class MyProfileViewController: UIViewController {

    private let blankView : UIView = {
       let view = UIView()
        return view
    }()
    
    
    lazy var returnButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(closeButton), for: .touchUpInside)
        return button
    }()
    
    
    private let myProfileImage : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "profileIMG")
        return imgView
    }()
    
    
    private let myProfileName : UILabel = {
        let label = UILabel()
        label.text = "누리다"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    
    private let myProfileLine : UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        return view
    }()
    
    
    private let viewfunc = UIView()
        
    
    private let myChatButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "message.fill"), for: .normal)
        return button
    }()
    

    private let myChatLabel : UILabel = {
        let label = UILabel()
        label.text = "나와의 채팅"
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    
    private let editPageButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "editpage"), for: .normal)
        return button
    }()

    
    private let editPageLabel : UILabel = {
        let label = UILabel()
        label.text = "프로필 편집"
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    
    private let kakaoStoryButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "kakaostory"), for: .normal)
        return button
    }()
    
    
    private let kakaoStoryLabel : UILabel = {
        let label = UILabel()
        label.text = "카카오스토리"
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray3
        myProfileLayout()

    }
    
    @objc
    private func closeButton(){
        if(self.navigationController == nil){
            self.dismiss(animated: true, completion: nil)
        }
    }
}

extension MyProfileViewController{
    
    
    private func myProfileLayout() {
        [blankView, returnButton, myProfileImage, myProfileName, myProfileLine].forEach{view.addSubview($0)
        }
        
        [myChatButton, myChatLabel, editPageButton, editPageLabel, kakaoStoryButton, kakaoStoryLabel].forEach{
            blankView.addSubview($0)
        }
        
        
        returnButton.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(14)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(18)
            make.width.equalTo(13)
            make.height.equalTo(14)
        }
        
        myProfileImage.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(470)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(139)
            make.width.equalTo(97)
            make.height.equalTo(96)
        }
        
        myProfileName.snp.makeConstraints{ make in
            make.top.equalTo(self.myProfileImage.snp.bottom).offset(8)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(164)
        }
        
        myProfileLine.snp.makeConstraints{ make in
            make.top.equalTo(self.myProfileName.snp.bottom).offset(42)
            make.width.equalTo(375)
            make.height.equalTo(1)
        }
        
        blankView.snp.makeConstraints{ make in
            make.top.equalTo(self.myProfileLine.snp.bottom).offset(12)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(44)
            make.width.equalTo(288)
            make.height.equalTo(72)
        }
        
        myChatButton.snp.makeConstraints{ make in
            make.top.equalTo(self.blankView).offset(24)
            make.leading.equalTo(self.blankView).offset(39)
            make.width.equalTo(19)
            make.height.equalTo(18)
        }
        
        myChatLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.myChatButton.snp.bottom).offset(8)
            make.leading.equalTo(self.blankView).offset(20)
        }
        
        editPageButton.snp.makeConstraints{ make in
            make.top.equalTo(self.blankView).offset(21)
            make.leading.equalTo(self.blankView).offset(135)
            make.width.equalTo(18)
            make.height.equalTo(19)
        }
        
        editPageLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.editPageButton.snp.bottom).offset(9)
            make.leading.equalTo(self.blankView).offset(116)
        }
        
        kakaoStoryButton.snp.makeConstraints{ make in
            make.top.equalTo(self.blankView).offset(22)
            make.leading.equalTo(self.blankView).offset(231)
            make.width.equalTo(18)
            make.height.equalTo(21)
        }
        
        kakaoStoryLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.kakaoStoryButton.snp.bottom).offset(6)
            make.leading.equalTo(self.blankView).offset(212)
        }
    }
}
