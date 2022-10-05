//
//  ThirdViewController.swift
//  First_Assignment
//
//  Created by 누리링 on 2022/10/03.
//

import UIKit

class ThirdViewController: UIViewController {
    
    private let resultLabel : UILabel = {
        let label = UILabel(frame: CGRect(x: 76, y: 245, width: 240, height: 60))
        
        label.text = "000님\n환영합니다"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    
    private lazy var backButton : UIButton = {
        let button = UIButton(frame: CGRect(x: 30, y: 375, width: 333, height: 44))
        
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemYellow
        button.addTarget(self, action: #selector(touchupBackButton), for: .touchUpInside)
        return button

    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let components : [Any] = [resultLabel, backButton]
        components.forEach{view.addSubview($0 as! UIView)
        }

    }

    func dataBind(result:String){
        resultLabel.text = "\(result)님\n환영합니다"
        
        
    }

    
    
    @objc
    private func touchupBackButton(){
        let presentingVC = self.presentingViewController
                guard let VC = presentingVC as? UINavigationController else {return}
        
        self.dismiss(animated: true){
            VC.navigationController?.popToRootViewController(animated: true)
        }
        
        
        
    }
    
    
    


}
