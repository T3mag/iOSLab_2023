//
//  InstargramProfileView.swift
//  HW_106_Minnushin_Artur
//
//  Created by Артур Миннушин on 02.11.2023.
//

import UIKit

class InstargramProfileView: UIView {
    weak var profileViewController: InstagramProfileViewController?
    lazy var avatarImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "avatar"))
        image.layer.cornerRadius = 45
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    lazy var countPostLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "10"
        return label
    }()
    lazy var countFollowersLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "10"
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    lazy var countFollowingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "10"
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    lazy var postLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Посты"
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    lazy var followersLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Подписано"
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    lazy var followingLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Подписаны"
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Миннушин Артур"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    lazy var subTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "iOS и С# программист"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    lazy var photoCollectionImageView: UIImageView = {
        var imageView = UIImageView(image: UIImage(named: "photoCollecion"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy var underliningLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .black
        return label
    }()
    lazy var imageCollection: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collection.delegate = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collection
    }()
    func configureCollection(dataSource: ProfileCollectionDataSource) {
        imageCollection.dataSource = dataSource
    }
    func reloadData() {
        imageCollection.reloadData()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(avatarImage)
        addSubview(countPostLabel)
        addSubview(countFollowersLabel)
        addSubview(countFollowingLabel)
        addSubview(postLable)
        addSubview(followersLable)
        addSubview(followingLable)
        addSubview(nameLabel)
        addSubview(subTitle)
        addSubview(photoCollectionImageView)
        addSubview(underliningLabel)
        addSubview(imageCollection)
        setUpLayout()
    }
    func setUpLayout() {
        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            avatarImage.heightAnchor.constraint(equalToConstant: 90),
            avatarImage.widthAnchor.constraint(equalToConstant: 90),
            avatarImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,
                                                  constant: 110),
            countPostLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 25),
            countPostLabel.trailingAnchor.constraint(equalTo: avatarImage.leadingAnchor, constant: 145),
            countFollowersLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,
                                                     constant: 25),
            countFollowersLabel.trailingAnchor.constraint(equalTo: countPostLabel.leadingAnchor, constant: 95),
            countFollowingLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 25),
            countFollowingLabel.trailingAnchor.constraint(equalTo: countFollowersLabel.leadingAnchor, constant: 95),
            postLable.topAnchor.constraint(equalTo: countPostLabel.topAnchor, constant: 35),
            postLable.trailingAnchor.constraint(equalTo: avatarImage.leadingAnchor, constant: 160),
            followersLable.topAnchor.constraint(equalTo: countFollowersLabel.topAnchor, constant: 35),
            followersLable.trailingAnchor.constraint(equalTo: postLable.leadingAnchor, constant: 135),
            followingLable.topAnchor.constraint(equalTo: countFollowingLabel.topAnchor, constant: 35),
            followingLable.trailingAnchor.constraint(equalTo: followersLable.leadingAnchor, constant: 155),
            nameLabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 15),
            nameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 145),
            subTitle.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            subTitle.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 165),
            photoCollectionImageView.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 20),
            photoCollectionImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            photoCollectionImageView.widthAnchor.constraint(equalToConstant: 30),
            photoCollectionImageView.heightAnchor.constraint(equalToConstant: 30),
            underliningLabel.topAnchor.constraint(equalTo: photoCollectionImageView.bottomAnchor, constant: 10),
            underliningLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            underliningLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            underliningLabel.heightAnchor.constraint(equalToConstant: 1),
            imageCollection.topAnchor.constraint(equalTo: underliningLabel.bottomAnchor, constant: 10),
            imageCollection.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            imageCollection.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            imageCollection.bottomAnchor.constraint(equalTo:
                safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func 
}

extension InstargramProfileView: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width/3 - 15,
                      height: frame.width/3 - 15)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        profileViewController?.publicationPresintation(indexPath: indexPath)
    }
}
