//
//  ViewController.swift
//  First_Assignment
//
//  Created by 누리링 on 2022/10/03.
//

import UIKit

class FirstViewController: UIViewController {
    
    
    private let titleLabel : UILabel = {
        let label = UILabel(frame: CGRect(x: 98,
                                          y: 200,
                                          width: 197,
                                          height: 30))
        
        label.text = "카카오톡을 시작합니다"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    
    private let subTitleLabel : UILabel = {
        let label = UILabel(frame: CGRect(x: 76,
                                          y: 245,
                                          width: 240,
                                          height: 40))
        
        label.text = "사용하던 카카오계정이 있다면\n이메일 또는 전화번호로 로그인해주세요."
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .systemGray2
        
        return label
    }()
    
    
    
    
    private let emailTextField : UITextField = {
        let TextField = UITextField(frame: CGRect(x: 30, y: 345, width: 333, height: 49))
        
        TextField.backgroundColor = .white
        TextField.placeholder = "이메일 또는 전화번호" 
        return TextField
        
    }()
    
    private let emailLineField : UITextField = {
        let TextField = UITextField(frame: CGRect(x: 30, y: 384, width: 333, height: 1))
        
        TextField.backgroundColor = .systemGray3
        return TextField
        
    }()
    
    
    
    
    private let passwordTextField : UITextField = {
        let TextField = UITextField(frame: CGRect(x: 30,
                                                  y: 385,
                                                  width: 333,
                                                  height: 49))
        TextField.backgroundColor = .white
        TextField.placeholder = "비밀번호" //폰트,색상 바꿀 수 있음
        return TextField
        
    }()
    
    
    private let passwordLineField : UITextField = {
        let TextField = UITextField(frame: CGRect(x: 30, y: 429, width: 333, height: 1))
        
        TextField.backgroundColor = .systemGray3
        return TextField
        
    }()
    
    
    
    private lazy var loginButton : UIButton = {
        let button = UIButton(frame: CGRect(x: 30,
                                            y: 470,
                                            width: 333,
                                            height: 44))
        
        
        button.setTitle("카카오계정 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        button.backgroundColor = .systemGray6
        button.addTarget(self, action: #selector(clickLoginbutton), for:.touchUpInside)

        
        return button
    }()
    
    
    
    private lazy var newloginButton : UIButton = {
        let button = UIButton(frame: CGRect(x: 30, y: 525, width: 333, height: 44))
        
        button.setTitle("새로운 카카오계정 만들기", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray6
        
        
        //신들린게이트 잘 사용하셈^^;
        button.addTarget(self, action: #selector(touchupNextButton), for: .touchUpInside)
        
        return button
    }()
    
    
    private let bottomTitleLabel : UILabel = {
        let label = UILabel(frame: CGRect(x: 76,
                                          y: 580,
                                          width: 240,
                                          height: 40))
        
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
        
        let components : [Any] = [titleLabel, subTitleLabel, emailTextField, passwordTextField, loginButton, newloginButton, bottomTitleLabel, emailLineField, passwordLineField]
        components.forEach{view.addSubview($0 as! UIView)
            
        }
    }
    
    
    
    private func presentToThirdVC() {
        let thirdVC = ThirdViewController()
        thirdVC.modalPresentationStyle = .formSheet
        
        if let answer = emailTextField.text{
            thirdVC.dataBind(result:answer)
        }
        
        
        self.present(thirdVC, animated: true, completion: nil)
    }
    
    private func pushToSecondVC(){
        let secondVC = SecondViewController()
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

