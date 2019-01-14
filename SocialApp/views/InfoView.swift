//
//  InfoView.swift
//  SocialApp
//
//  Created by Muhammad Salman Zafar on 13/01/2019.
//  Copyright © 2019 Muhammad Salman Zafar. All rights reserved.
//

import UIKit

class InfoView: UIView {
    
    let nameLbl = UILabel()
    let locationLbl = UILabel()
    let infoLbl = UILabel()
    let followButton = FollowButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    var collectionView : UICollectionView!
    var images = [UIImage]()
    private var followBtnWidthConst: NSLayoutConstraint!
    
    private let photoLbl = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLabels()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        addShadow(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5))
        roundCorners(corners: [.topLeft, .topRight], radius: 40)
    }
    
    
    private func setLabels() {
        
        nameLbl.text = "Lori Perez"
        nameLbl.font = UIFont(name: "Avenir-Medium", size: 18)
        nameLbl.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nameLbl)
        
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: nameLbl.leadingAnchor, constant: -32),
            topAnchor.constraint(equalTo: nameLbl.topAnchor, constant: -32)
        ])
        
        
        locationLbl.text = "France, Nantes"
        locationLbl.font = UIFont(name: "Avenir-Book", size: 14)
        locationLbl.textColor = .lightGray
        locationLbl.translatesAutoresizingMaskIntoConstraints = false
        addSubview(locationLbl)
        
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: locationLbl.leadingAnchor, constant: -32),
            nameLbl.bottomAnchor.constraint(equalTo: locationLbl.topAnchor, constant: -1)
        ])
        
        followButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(followButton)
        
        followBtnWidthConst = followButton.widthAnchor.constraint(equalToConstant: 120)
        NSLayoutConstraint.activate([
            trailingAnchor.constraint(equalTo: followButton.trailingAnchor, constant: 32),
            followBtnWidthConst ,
            topAnchor.constraint(equalTo: followButton.topAnchor, constant: -36),
            followButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        
        infoLbl.alpha = 0
        infoLbl.textColor = .gray
        infoLbl.font = UIFont(name: "Avenir-BookOblique", size: 14)
        infoLbl.numberOfLines = 0
        infoLbl.translatesAutoresizingMaskIntoConstraints = false
        addSubview(infoLbl)
        
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: infoLbl.leadingAnchor, constant: -32),
            trailingAnchor.constraint(equalTo: infoLbl.trailingAnchor, constant: 32),
            locationLbl.bottomAnchor.constraint(equalTo: infoLbl.topAnchor, constant: -12)
        ])
        
        photoLbl.text = "Photos"
        photoLbl.font = UIFont(name: "Avenir-Medium", size: 18)
        photoLbl.translatesAutoresizingMaskIntoConstraints = false
        addSubview(photoLbl)
        
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: photoLbl.leadingAnchor, constant: -32),
            infoLbl.bottomAnchor.constraint(equalTo: photoLbl.topAnchor, constant: -30)
        ])
        
        
        setCollectionView()
    }
    
    func setCollectionView() {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 119, height: 119)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(CollectionViewImageCell.self, forCellWithReuseIdentifier: "image_cell")
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: collectionView.leadingAnchor, constant: -32),
            trailingAnchor.constraint(equalTo: collectionView.trailingAnchor, constant: 32),
            photoLbl.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: -15),
            collectionView.heightAnchor.constraint(equalToConstant: 120)
        ])
        
        
        setDummyImages()
    }
    
    private func setDummyImages() {
        
        for _ in 1...12 {
            images.append(UIImage(named: "unsplashImage.jpg")!)
        }
        
    }
    
    func animate(follow button: Bool) {
        
        
        UIView.animate(withDuration: 1, animations: {
            self.followButton.backgroundColor = button ? #colorLiteral(red: 0.9411764706, green: 0.1215686275, blue: 0.1215686275, alpha: 1) : .clear
        }) { (_) in
            
            UIView.animate(withDuration: 0.5, animations: {
                
                self.followBtnWidthConst.constant = button ? 40 : 120
                self.followButton.layer.cornerRadius = button ? 20 : 14
                self.layoutIfNeeded()
                
            }, completion: { (_) in
                
                UIView.animate(withDuration: 0.5, animations: {
                    self.followButton.setImage(button ? #imageLiteral(resourceName: "person") : nil, for: .normal)
                    self.followButton.setTitle(button ? "" : "FOLLOW", for: .normal)
                })
                
            })
            
        }
        
    }
    

}

extension InfoView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "image_cell", for: indexPath) as! CollectionViewImageCell
        cell.imageView.image = images[indexPath.item]
        cell.imageView.layer.cornerRadius = 6
        cell.imageView.clipsToBounds = true
        return cell
    }
    
    
}


class CollectionViewImageCell : UICollectionViewCell {
    
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)

        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            topAnchor.constraint(equalTo: imageView.topAnchor),
            trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
        ])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
