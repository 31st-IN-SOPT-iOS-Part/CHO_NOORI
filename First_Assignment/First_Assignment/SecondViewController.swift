//
//  SecondViewController.swift
//  First_Assignment
//
//  Created by 누리링 on 2022/10/03.
//

import UIKit

class SecondViewController: UIViewController {
    
    
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
    
    
    
    private let emailTextField : UITextField = {
        let TextField = UITextField(frame: CGRect(x: 30, y: 295, width: 333, height: 49))
        
        TextField.backgroundColor = .white
        TextField.placeholder = "이메일 또는 전화번호" //폰트,색상 바꿀 수 있음
        return TextField
        
    }()
    
    
    private let emailLineField : UITextField = {
        let TextField = UITextField(frame: CGRect(x: 30, y: 334, width: 333, height: 1))
        
        TextField.backgroundColor = .systemGray3
        return TextField
        
    }()
    
    
    private let passwordTextField : UITextField = {
        let TextField = UITextField(frame: CGRect(x: 30,
                                                  y: 336,
                                                  width: 333,
                                                  height: 49))
        TextField.backgroundColor = .white
        TextField.placeholder = "비밀번호" //폰트,색상 바꿀 수 있음
        return TextField
        
    }()
    
    
    private let passwordLineField : UITextField = {
        let TextField = UITextField(frame: CGRect(x: 30, y: 380, width: 333, height: 1))
        
        TextField.backgroundColor = .systemGray3
        return TextField
        
    }()
    
    
    
    
    
    private let passwordTextField2 : UITextField = {
        let TextField = UITextField(frame: CGRect(x: 30,
                                                  y: 383,
                                                  width: 333,
                                                  height: 49))
        TextField.backgroundColor = .white
        TextField.placeholder = "비밀번호 확인" //폰트,색상 바꿀 수 있음
        return TextField
        
    }()
    
    
    
    private let passwordLineField2 : UITextField = {
        let TextField = UITextField(frame: CGRect(x: 30, y: 428, width: 333, height: 1))
        
        TextField.backgroundColor = .systemGray3
        return TextField
        
    }()
    
    
    //생성시점에 다름
    //지연저장 property : 메모리 관련 사용 - let, lazy var 선언 가능
    private lazy var newloginButton : UIButton = {
        let button = UIButton(frame: CGRect(x: 30, y: 525, width: 333, height: 44))
        
        button.setTitle("새로운 카카오계정 만들기", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray6
        button.addTarget(self, action: #selector(touchupThirdButton), for:.touchUpInside)
        
        
        return button
    }()
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let components : [Any] = [titleLabel, emailTextField, emailLineField, passwordTextField, passwordLineField, passwordTextField2, passwordLineField2, newloginButton]
        components.forEach{view.addSubview($0 as! UIView)
            
        }
        
    }
    

    
    private func presentToThirdVC() {
        let thirdVC = ThirdViewController()
        thirdVC.modalPresentationStyle = .formSheet
        
        if let answer = emailTextField.text{
            thirdVC.dataBind(result:answer)
        }
        
        
        self.present(thirdVC, animated: true, completion: {
            self.navigationController?.popViewController(animated: true)
        })
    }
    
   
    
    
    @objc
    private func touchupThirdButton(){
        presentToThirdVC()
        
    }
    
 

    
}
