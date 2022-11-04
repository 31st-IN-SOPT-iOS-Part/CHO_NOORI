

import UIKit
import SnapKit

class NewLoginViewController: UIViewController {

    private let titleLabel : UILabel = {
        let label = UILabel()
        
        label.text = "카카오톡을 시작합니다"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
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
        TextField.placeholder = "비밀번호"
        return TextField
        
    }()
    
    
    private let passwordLineField : UITextField = {
        let TextField = UITextField()
        
        TextField.backgroundColor = .systemGray3
        return TextField
        
    }()
    
    
    
    
    private let passwordTextField2 : UITextField = {
        let TextField = UITextField()
        TextField.backgroundColor = .white
        TextField.placeholder = "비밀번호 확인" 
        return TextField
        
    }()
    
    
    
    private let passwordLineField2 : UITextField = {
        let TextField = UITextField()
        
        TextField.backgroundColor = .systemGray3
        return TextField
        
    }()
    
    
    //생성시점에 다름
    //지연저장 property : 메모리 관련 사용 - let, lazy var 선언 가능
    private lazy var newloginButton : UIButton = {
        let button = UIButton()
        
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
        NewLoginLayout()
        
            
        
    }
    

    
    private func presentToThirdVC() {
        let thirdVC = WelcomeViewController()
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


extension NewLoginViewController {
    
    
    private func NewLoginLayout(){
        
        [titleLabel, emailTextField, emailLineField, passwordTextField, passwordLineField, passwordTextField2, passwordLineField2, newloginButton].forEach{view.addSubview($0)
            
            
        }
        
        titleLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(40)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(89)
        }
        
        emailTextField.snp.makeConstraints{ make in
            make.top.equalTo(self.titleLabel).offset(119)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(21)
            make.width.equalTo(333)
            make.height.equalTo(49)
        }
        
        emailLineField.snp.makeConstraints{ make in
            make.top.equalTo(self.emailTextField.snp.bottom)
            make.leading.equalTo(self.emailTextField)
            make.width.equalTo(333)
            make.height.equalTo(1)
        }
        
        passwordTextField.snp.makeConstraints{ make in
            make.top.equalTo(self.emailLineField).offset(10)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(21)
            make.width.equalTo(333)
            make.height.equalTo(49)
        }
        
        passwordLineField.snp.makeConstraints{ make in
            make.top.equalTo(self.passwordTextField.snp.bottom)
            make.leading.equalTo(self.passwordTextField)
            make.width.equalTo(333)
            make.height.equalTo(1)
        }
        
        passwordTextField2.snp.makeConstraints{ make in
            make.top.equalTo(self.passwordLineField).offset(10)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(21)
            make.width.equalTo(333)
            make.height.equalTo(49)
            
        }
        
        passwordLineField2.snp.makeConstraints{ make in
            make.top.equalTo(self.passwordTextField2.snp.bottom)
            make.leading.equalTo(self.passwordTextField2)
            make.width.equalTo(333)
            make.height.equalTo(1)
            
        }
        
        newloginButton.snp.makeConstraints{ make in
            make.top.equalTo(self.passwordTextField2.snp.bottom).offset(26)
            make.leading.equalTo(self.emailTextField)
            make.width.equalTo(333)
            make.height.equalTo(44)
        }
    }
}
