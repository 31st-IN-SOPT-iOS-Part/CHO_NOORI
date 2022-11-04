//
//  PhotoGridViewController.swift
//  KAKAO_Service
//
//  Created by 누리링 on 2022/11/03.
//
//
import UIKit
import SnapKit
import SwiftyColor
import Then

class ChatViewController: UIViewController {
    
    
    private let funcView : UIView =  {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    
    
    private let bannerImg = UIImageView().then {
       // UIImageView = .ResizingMode
       
        $0.image = UIImage(named: "bannerNoori")
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 6
        $0.clipsToBounds = true
    
    }
    
    
    // Mark: - chatLabel
    private let chatting: UILabel =  {
        let label  = UILabel()
        label.text = "채팅"
        label.textColor = .black
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()


    // Mark: - openchatLabel
    private let openChatting : UILabel =  {
        let label  = UILabel()
        label.text = "오픈채팅"
        label.textColor = 0xA6A6A6.color
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()


    // Mark: - UIiconPlus
    private let iconPlus : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "iconPlus"), for: .normal)
        button.addTarget(self, action: #selector(touchupPlusButton), for: .touchUpInside)
        return button
    }()


    // Mark: - settingButton
    private let iconSetting : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "iconSetting"), for: .normal)
        return button
    }()

    // Mark: - userPoster
    private let userPoster : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "userPoster")
        return imageView
    }()

    // MARK: - chatCollectionView
    private lazy var chatView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical

        let scrollView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.delegate = self
        scrollView.dataSource = self
        return scrollView
    }()

    
    var chatList: [ChatModel] = [
        ChatModel(profileImage: "profileImage1", name: "안솝트", profileMessage: "언제 볼 건데??", time: "오후 9:41"),
        ChatModel(profileImage: "profileImage2", name: "김조솝트", profileMessage: "언제까지??", time: "오후 9:41"),
        ChatModel(profileImage: "profileImage3", name: "나솝트", profileMessage: "어깨춤을?", time: "오후 9:41"),
        ChatModel(profileImage: "profileImage4", name: "안솝트", profileMessage: "추게??", time: "오후 9:41"),
        ChatModel(profileImage: "profileImage5", name: "박솝트", profileMessage: "할 건데??", time: "오후 9:41"),
        ChatModel(profileImage: "profileImage6", name: "최솝트", profileMessage: "내 어깨를 봐??", time: "오후 9:41"),
        ChatModel(profileImage: "profileImage7", name: "곽솝트", profileMessage: "탈골됐잖아??", time: "오후 9:41"),
        ChatModel(profileImage: "profileImage8", name: "찬솝트", profileMessage: "탈골탈골탈골 치골치골치골??", time: "오후 9:41"),
        ChatModel(profileImage: "profileImage9", name: "유솝트", profileMessage: "두개골~~<3?", time: "오후 9:41")
      

    
    ]
    
    
    
    final let chatInset: UIEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 20)
    final let chatLineSpacing: CGFloat = 10
    final let chatInterItemSpacing: CGFloat = 20
    final let chatCellHeight: CGFloat = 198
    
    

    // MARK: - presentToPhotoVC func
    private func presentToPhotoVC(){
        let PhotoCollectionVC = PhotoViewController()
        PhotoCollectionVC.modalPresentationStyle = .formSheet
        self.present(PhotoCollectionVC,animated: true,completion: nil)
    }

    // MARK: - objc touchupSignUpButton func
    @objc
    private func touchupPlusButton(){
        presentToPhotoVC()
    }


    // MARK: - viewDidLoad func
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        register()
    }
}

extension ChatViewController{

    private func layout() {
        
        [bannerImg].forEach{
            view.addSubview($0)
        }

        [funcView,userPoster,chatView].forEach {
            view.addSubview($0)
        }


        [chatting, openChatting, iconPlus, iconSetting].forEach {
            funcView.addSubview($0)
        }
        
        


        funcView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(15)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(14)
            $0.width.equalTo(UIScreen.main.bounds.width)
            $0.height.equalTo(36)

        }


        chatting.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }

        
        bannerImg.snp.makeConstraints{
            $0.top.equalTo(chatting.snp.bottom).offset(16)
            $0.height.equalTo(70)
            $0.leading.trailing.equalToSuperview().inset(16)

        }
        
        
        openChatting.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(self.chatting.snp.trailing).offset(8)
        }

        iconPlus.snp.makeConstraints {
            $0.top.equalToSuperview().offset(2)
            $0.leading.equalTo(self.openChatting.snp.trailing).offset(173)
            $0.width.equalTo(19)
            $0.height.equalTo(19)

        }

        iconSetting.snp.makeConstraints {
            $0.top.equalTo(self.iconPlus)
            $0.leading.equalTo(self.iconPlus.snp.trailing).inset(-12)
            $0.width.equalTo(19)
            $0.height.equalTo(19)
        }

        userPoster.snp.makeConstraints {
            $0.top.equalTo(self.funcView.snp.bottom).offset(16)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(16)
            $0.width.equalTo(343)
            $0.height.equalTo(72)
        }

        chatView.snp.makeConstraints {
            $0.top.equalTo(self.userPoster.snp.bottom).offset(8.5)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(chatList.count * 60)
        }

    }
    // MARK: - General Helpers

    private func register() {
        chatView.register(ChatTableViewCell.self, forCellWithReuseIdentifier: ChatTableViewCell.identifier)
    }
    
    


    private func calculateCellHeight() -> CGFloat {
        let count = CGFloat(chatList.count)
        let heightCount = count / 2 + count.truncatingRemainder(dividingBy: 1)
        return heightCount * chatCellHeight + (heightCount - 1) * chatLineSpacing + chatInset.top + chatInset.bottom
    }

}


// MARK: - UICollectionViewDelegateFlowLayout


extension ChatViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let doubleCellWidth = screenWidth - chatInset.left - chatInset.right - chatInterItemSpacing
        return CGSize(width: doubleCellWidth / 1, height: 60)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return chatLineSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return chatInterItemSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return chatInset
    }
}




 //MARK: -UICollectionViewDataSource

extension ChatViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let chatCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ChatTableViewCell.identifier, for: indexPath)
                as? ChatTableViewCell else { return UICollectionViewCell() }
        chatCell.dataBind(model: chatList[indexPath.item])
        return chatCell
    }
}



