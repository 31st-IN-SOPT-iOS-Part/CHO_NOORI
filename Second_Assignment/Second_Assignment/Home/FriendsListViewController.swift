
import UIKit
import SnapKit

class FriendsListViewController: UIViewController {
    
    private let friendView : UIView =  {
       let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    private lazy var friendListTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    
    private let friendLabel : UILabel = {
        let label = UILabel()
        label.text = "친구"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 23)
        return label
    }()
    
    private let settingButton : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "settings")
        return imgView
    }()
    
    
    lazy var profileButton : UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(touchUpProfileButton), for: .touchUpInside)
        button.setImage(UIImage(named: "profileIMG"), for: .normal)
        return button
    }()
    
    
    private let profileName: UILabel = {
        let label = UILabel()
        label.text = "김솝트"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    
    private let profileMessage: UILabel = {
        let label = UILabel()
        label.text = "상태메시지는 여기에"
        label.font = .boldSystemFont(ofSize: 11)
        label.textColor = .systemGray2
        return label
    }()
    
    

    var profileList: [FriendModel] = [
        FriendModel(profileImage: "profileImage1", friendName: "안솝트", profileMessage: "언제 볼 건데??"),
        FriendModel(profileImage: "profileImage2", friendName: "조솝트", profileMessage: "언제 볼 건데??"),
        FriendModel(profileImage: "profileImage3", friendName: "김조솝트", profileMessage: "언제 볼 건데??"),
        FriendModel(profileImage: "profileImage4", friendName: "왜솝트", profileMessage: "언제 볼 건데??"),
        FriendModel(profileImage: "profileImage5", friendName: "정솝트", profileMessage: "언제 볼 건데??"),
        FriendModel(profileImage: "profileImage6", friendName: "황솝트", profileMessage: "언제 볼 건데??"),
        FriendModel(profileImage: "profileImage7", friendName: "최솝트", profileMessage: "언제 볼 건데??"),
        FriendModel(profileImage: "profileImage8", friendName: "고솝트", profileMessage: "언제 볼 건데??"),
        FriendModel(profileImage: "profileImage9", friendName: "곽솝트", profileMessage: "언제 볼 건데??"),

    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setlayout()
        register()

    }
    
    
    private func showMyProfileVC(){
        let ProfileVC = MyProfileViewController()
        ProfileVC.modalPresentationStyle = .formSheet
        self.present(ProfileVC,animated: true, completion: nil)

    }
    
        
    @objc
    private func touchUpProfileButton(){
        showMyProfileVC()
    
    }
    
    
    
    
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle { return profileList.delete }
//
//
//    //삭제기능 구현 - 배열공부
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//           let action = UIContextualAction(style: .normal, title: nil) { (action, view, completion) in
//                   tableView.deleteRows(at: [indexPath], with: .automatic)
//                completion(true)
//            }
//
//            action.backgroundColor = .white
//           // action.image = #imageLiteral(resourceName: "DeleteIcon")
//
//            let configuration = UISwipeActionsConfiguration(actions: [action])
//            configuration.performsFirstActionWithFullSwipe = false
//            return configuration
//       }
}


extension FriendsListViewController {
    
    private func setlayout() {
        
        [friendView, friendListTableView, profileButton, profileName, profileMessage].forEach{view.addSubview($0)
        }
        
        
        
        [friendLabel,settingButton].forEach{friendView.addSubview($0)
        }
        
        friendView.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(-3)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide)
            $0.width.equalTo(375)
            $0.height.equalTo(52)
        }
        
        friendListTableView.snp.makeConstraints{
            $0.top.equalTo(self.profileButton.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(70 * profileList.count)
        }
        
        friendLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalToSuperview().offset(14)
        }
        
        
        //setting Label
        settingButton.snp.makeConstraints{
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalTo(self.friendLabel.snp.trailing).offset(4)
            $0.width.equalTo(21)
            $0.height.equalTo(21)
        }
        
        
        
        profileButton.snp.makeConstraints{
            $0.top.equalTo(self.friendView.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(14)
            $0.width.equalTo(59)
            $0.height.equalTo(58)
        }
        
        profileName.snp.makeConstraints {
            $0.top.equalTo(self.profileButton).offset(10)
            $0.leading.equalTo(self.profileButton.snp.trailing).offset(3)
        }

        profileMessage.snp.makeConstraints {
            $0.top.equalTo(self.profileName.snp.bottom).offset(3)
            $0.leading.equalTo(self.profileName)
        }
        
    }
    
    private func register() {
        friendListTableView.register(FriendsListTableViewCell.self, forCellReuseIdentifier: FriendsListTableViewCell.identifier)
    }
    
    

}

// MARK: - UITableViewDelegate

extension FriendsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
        
//        if(indexPath.row == 0){
//            return 90
//        }
//        else {
//            return 70
//        }
    }
}

// MARK: - UITableViewDataSource

extension FriendsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let profileCell = tableView.dequeueReusableCell(
            withIdentifier: FriendsListTableViewCell.identifier, for: indexPath)
                as? FriendsListTableViewCell else { return UITableViewCell() }
        
        profileCell.dataBind(model: profileList[indexPath.row])
        return profileCell
    }

}
