//
//  PhotoCollectionViewController.swift
//  KAKAO_Service
//
//  Created by 누리링 on 2022/11/04.
//

import UIKit

import SnapKit
import SwiftyColor
import Then

class PhotoViewController : UIViewController {


    private let topBarView = UIView()


    private let xButton = UIButton().then {
        $0.setImage(UIImage(named: "iconClose"), for: .normal)
        $0.addTarget(self, action: #selector(touchupXmark), for: .touchUpInside)
    }


    private let recentFileLabel = UILabel().then {
        $0.text = "최근 항목"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 16, weight: .medium)

    }


    private let sendButton = UIButton().then {
        $0.setTitle("전송", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        $0.setTitleColor(UIColor .black, for: .normal)
    }

    // MARK: - PhotoCollectionView
    private lazy var PhotoCollectionView : UICollectionView  = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.allowsMultipleSelection = true
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()

    // MARK: - Variables
    var photoList : [GalleryModel] = [
        GalleryModel(image: "camera", number: 0),
        GalleryModel(image: "galleryImage1", number: 1),
        GalleryModel(image: "galleryImage2", number: 2),
        GalleryModel(image: "galleryImage3", number: 3),
        GalleryModel(image: "galleryImage4", number: 4),
        GalleryModel(image: "galleryImage5", number: 5),
        GalleryModel(image: "galleryImage6", number: 6),
        GalleryModel(image: "galleryImage7", number: 7),
        GalleryModel(image: "galleryImage8", number: 8),
        GalleryModel(image: "galleryImage9", number: 9),
        GalleryModel(image: "galleryImage10", number: 10),
        GalleryModel(image: "galleryImage11", number: 11),
        GalleryModel(image: "galleryImage12", number: 12),
        GalleryModel(image: "galleryImage13", number: 13),
        GalleryModel(image: "galleryImage14", number: 14),
        GalleryModel(image: "galleryImage15", number: 15),
        GalleryModel(image: "galleryImage16", number: 16),
        GalleryModel(image: "galleryImage17", number: 17),
        GalleryModel(image: "galleryImage18", number: 18),
        GalleryModel(image: "galleryImage19", number: 19),
        GalleryModel(image: "galleryImage20", number: 20),
        GalleryModel(image: "galleryImage21", number: 21),
        GalleryModel(image: "galleryImage22", number: 22),
        GalleryModel(image: "galleryImage23", number: 23),
    ]


    final let photoInset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 4, bottom: 4, right: 3)
    final let photoLineSpacing : CGFloat = 3
    final let photoInterItemSpacing : CGFloat = 4
    final let photoCellHeight : CGFloat = 119


    @objc
    private func touchupXmark() {
        if(self.navigationController == nil){
            self.dismiss(animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        register()
    }

}

extension PhotoViewController {

    // MARK: - layout()
    private func layout() {
        [topBarView,PhotoCollectionView].forEach {
            view.addSubview($0)
        }

        [xButton, recentFileLabel, sendButton].forEach {
            topBarView.addSubview($0)
        }

        // MARK: - topBarView
        topBarView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(11)
            make.leading.equalToSuperview()
            make.width.equalTo(UIScreen.main.bounds.width)
            make.height.equalTo(16)
        }

        // MARK: - xButton
        xButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(1)
            make.leading.equalToSuperview().offset(17)
            make.width.equalTo(14)
            make.height.equalTo(14)
        }

        // MARK: - recentFileLable
        recentFileLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(self.xButton.snp.trailing).offset(129)
        }

        // MARK: - sendButton
        sendButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(1)
            make.leading.equalTo(self.recentFileLabel.snp.trailing).offset(125)
        }

        // MARK: - PhotoCollectionView
        PhotoCollectionView.snp.makeConstraints { make in
            make.top.equalTo(self.topBarView.snp.bottom).offset(11)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(calculateCellHeight())

        }

        view.backgroundColor = .white
    }

    private func register() {
        PhotoCollectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
    }

    private func calculateCellHeight() -> CGFloat {
        let count = CGFloat(photoList.count)
        let heightCount = count / 3 + count.truncatingRemainder(dividingBy: 3)
        return heightCount * photoCellHeight + (heightCount - 1) * photoLineSpacing + photoInset.top + photoInset.bottom
    }

}

extension PhotoViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let itemCellWidth = screenWidth - photoInset.left - photoInset.right - photoInterItemSpacing * 2
        return CGSize(width: itemCellWidth / 3, height: 123)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return photoInterItemSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return photoLineSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return photoInset
    }
}


extension PhotoViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let photoCell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as? PhotoCollectionViewCell else {return UICollectionViewCell()}
        photoCell.dataBind(model: photoList[indexPath.item])
        return photoCell
    }


}


