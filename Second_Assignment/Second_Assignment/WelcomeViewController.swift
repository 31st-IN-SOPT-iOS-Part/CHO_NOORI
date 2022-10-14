//
//  WelcomeViewController.swift
//  Second_Assignment
//
//  Created by 누리링 on 2022/10/13.
//

import UIKit
import SnapKit

class WelcomeViewController: UIViewController {

    private let resultLabel : UILabel = {
        let label = UILabel()
        
        label.text = "000님\n환영합니다"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    
    private lazy var backButton : UIButton = {
        let button = UIButton()
        
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemYellow
        button.addTarget(self, action: #selector(touchupBackButton), for: .touchUpInside)
        return button

    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        WelcomeLayout()
        


    }

    func dataBind(result:String){
        resultLabel.text = "\(result)님\n환영합니다"
    }

    
    private func presentFriendsListViewController(){
        
        guard let strongSelf = self else {
            return
        }
        
        let friendslistVC = FriendsListViewController()
        friendslistVC.modalPresentationStyle = .fullScreen
        strongSelf.navigationController?.dismiss(animated: true)
       }
    
    
    @objc
    private func touchupBackButton(){
        
        presentFriendsListViewController()

    }
    
}


extension WelcomeViewController{
    
    
    private func WelcomeLayout(){
        [resultLabel, backButton].forEach{view.addSubview($0)
        }
        
        resultLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(197)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(144)
        }
        
        backButton.snp.makeConstraints{ make in
            make.top.equalTo(self.resultLabel.snp.bottom).offset(117)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(21)
            make.width.equalTo(333)
            make.height.equalTo(44)
        }
        
        
    }
    
}
