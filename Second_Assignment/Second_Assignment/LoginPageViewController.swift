//
//  LoginPageViewController.swift
//  Second_Assignment
//
//  Created by 누리링 on 2022/10/13.
//

import UIKit
import SnapKit

class LoginPageViewController: UIViewController {
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "카카오톡을 시작합니다"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    
    private let subTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "사용하던 카카오계정이 있다면\n이메일 또는 전화번호로 로그인해주세요."
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .systemGray2
        
        return label
    }()
    
    
    
    
    private let emailTextField : UITextField = {
        let TextField = UITextField()
        
        TextField.backgroundColor = .white
        TextField.placeholder = "이메일 또는 전화번호"
        return TextField
        
    }()
    
    private let emailLineField : UITextField = {
        let TextField = UITextField()
        
        TextField.backgroundColor = .systemGray3
        return TextField
        
    }()
    
    
    
    
    private let passwordTextField : UITextField = {
        let TextField = UITextField()
        TextField.backgroundColor = .white
        TextField.placeholder = "비밀번호" //폰트,색상 바꿀 수 있음
        return TextField
        
    }()
    
    
    private let passwordLineField : UITextField = {
        let TextField = UITextField()
        
        TextField.backgroundColor = .systemGray3
        return TextField
        
    }()
    
    
    
    private lazy var loginButton : UIButton = {
        let button = UIButton()
        button.setTitle("카카오계정 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        button.backgroundColor = .systemGray6
        button.addTarget(self, action: #selector(clickLoginbutton), for:.touchUpInside)
        
        
        return button
    }()
    
    
    
    private lazy var newloginButton : UIButton = {
        let button = UIButton()
        
        button.setTitle("새로운 카카오계정 만들기", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray6
        
    
        button.addTarget(self, action: #selector(touchupNextButton), for: .touchUpInside)
        
        return button
    }()
    
    
    private let bottomTitleLabel : UILabel = {
        let label = UILabel()
        
        label.text = "카카오계정 또는 비밀번호 찾기"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = .systemGray
        
        return label
    }()
    
    
    var result : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        LoginLayout()

    }

     
 
    private func presentToThirdVC() {
        let thirdVC = WelcomeViewController()
        thirdVC.modalPresentationStyle = .formSheet
        
        if let answer = emailTextField.text{
            thirdVC.dataBind(result:answer)
        }
        
        
        self.present(thirdVC, animated: true, completion: nil)
    }
    
    private func pushToSecondVC(){
        let secondVC = NewLoginViewController()
        self.navigationController?.pushViewController(secondVC,  animated: true)
    }
    
    @objc
    private func clickLoginbutton(){
        presentToThirdVC()
        
    }
    
    @objc
    private func touchupNextButton() {
        pushToSecondVC()
        
    }

}



extension LoginPageViewController{
    
    
    private func LoginLayout(){
        [titleLabel, subTitleLabel, emailTextField, passwordTextField, loginButton, newloginButton, bottomTitleLabel, emailLineField, passwordLineField].forEach{view.addSubview($0)
        }
        
        
        titleLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(40)
            make.centerX.equalTo(self.view.safeAreaLayoutGuide)
            
        }
        
        subTitleLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(20)
            make.centerX.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        emailTextField.snp.makeConstraints{ make in
            make.top.equalTo(self.subTitleLabel.snp.bottom).offset(60)
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).offset(21)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).offset(-21)
            make.height.equalTo(49)
        }
        
        emailLineField.snp.makeConstraints{ make in
            make.top.equalTo(self.emailTextField.snp.bottom)
            make.leading.equalTo(self.emailTextField)
            make.width.equalTo(333)
            make.height.equalTo(1)
        }
        
        
        passwordTextField.snp.makeConstraints{ make in
            make.top.equalTo(self.emailTextField.snp.bottom).offset(10)
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).offset(21)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).offset(-21)
            make.height.equalTo(49)
        }
        
        passwordLineField.snp.makeConstraints{ make in
            make.top.equalTo(self.passwordTextField.snp.bottom)
            make.leading.equalTo(self.emailTextField)
            make.width.equalTo(333)
            make.height.equalTo(1)
        }
        
        
        loginButton.snp.makeConstraints{ make in
            make.top.equalTo(self.passwordTextField.snp.bottom).offset(35)
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).offset(21)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).offset(-21)
            make.height.equalTo(44)
        }
        
        newloginButton.snp.makeConstraints{ make in
            make.top.equalTo(self.loginButton.snp.bottom).offset(10)
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).offset(21)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).offset(-21)
            make.height.equalTo(44)
        }
        
        bottomTitleLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.newloginButton.snp.bottom).offset(15)
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).offset(21)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).offset(-21)
            make.height.equalTo(29)
        }
        
        
    }
    
}

