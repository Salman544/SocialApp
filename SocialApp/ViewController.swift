//
//  ViewController.swift
//  SocialApp
//
//  Created by Muhammad Salman Zafar on 11/01/2019.
//  Copyright © 2019 Muhammad Salman Zafar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var tabbarView: TabBarView!
    var infoView: InfoView!
    var socialView: SocialLabels!
    var peoples = [Social]()
    var isInfoTapped = false
    var isFollowTapped = false
    var infoViewBottomConstraint: NSLayoutConstraint!
    var currentIndex: IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setInfoView()
        setTabBarView()
        setCollectionView()
        setSocialsLables()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setSocialsLables() {
        
        socialView = SocialLabels()
        socialView.backgroundColor = .clear
        socialView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(socialView)
        
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: socialView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: socialView.trailingAnchor),
            infoView.topAnchor.constraint(equalTo: socialView.bottomAnchor, constant: 10),
            socialView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    func setTabBarView() {
        
        tabbarView = TabBarView()
        tabbarView.backgroundColor = .white
        view.addSubview(tabbarView)
        
        tabbarView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: tabbarView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: tabbarView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: tabbarView.bottomAnchor),
            tabbarView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
    }
    
    func setInfoView() {
        
        infoView = InfoView()
        infoView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        view.addSubview(infoView)
        
        infoView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(infoViewTapped)))
        
        infoView.translatesAutoresizingMaskIntoConstraints = false
        
        infoViewBottomConstraint = view.bottomAnchor.constraint(equalTo: infoView.bottomAnchor, constant: -77)
        
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: infoView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: infoView.trailingAnchor),
            infoViewBottomConstraint,
            infoView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        infoView.followButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(followBtnTapped)))
        
    }
    
    func getPeoples() -> [Social] {
        
        let person1 = Social(name: "Lorez Perez", image: UIImage(named: "5.jpg")!, location: "France, Nantes", info: "Photoblogger at 'Le Mande', blogger and freelancer journalist", follow: "869", post: "120", following: "150")
        
        let person2 = Social(name: "Emma Watson", image: UIImage(named: "6.jpg")!, location: "Paris, France", info: "Photoblogger at 'Le Mande', blogger and freelancer journalist", follow: "986", post: "201", following: "501")
        
        let person3 = Social(name: "Amanda Seyfried", image: UIImage(named: "7.jpg")!, location: "France, Nantes", info: "Photoblogger at 'Le Mande', blogger and freelancer journalist", follow: "689", post: "220", following: "650")
        
        let person4 = Social(name: "Scarlett Johansson", image: UIImage(named: "8.jpg")!, location: "New York City", info: "Photoblogger at 'Le Mande', blogger and freelancer journalist", follow: "710", post: "150", following: "120")
        
        return [person1, person2, person3, person4]
    }
    
    func setCollectionView() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        peoples = getPeoples()
    }
    
    func changeContent(by index: Int) {
        
        UIView.animate(withDuration: 0.25, animations: {
            
            self.infoView.followButton.alpha = 0
            self.infoView.nameLbl.alpha = 0
            self.infoView.locationLbl.alpha = 0
            self.socialView.followersLbl.alpha = 0
            self.socialView.postLbl.alpha = 0
            self.socialView.followingLbl.alpha = 0
            
            
            self.infoView.nameLbl.transform = CGAffineTransform(translationX: 0, y: 15)
            self.infoView.followButton.transform = CGAffineTransform(translationX: 0, y: 15)
            self.infoView.locationLbl.transform = CGAffineTransform(translationX: 0, y: 15)
            self.socialView.followersLbl.transform = CGAffineTransform(translationX: 0, y: 15)
            self.socialView.postLbl.transform = CGAffineTransform(translationX: 0, y: 15)
            self.socialView.followingLbl.transform = CGAffineTransform(translationX: 0, y: 15)
            
        }) { (_) in
            
            UIView.animate(withDuration: 0.25, animations: {
                
                self.infoView.nameLbl.text = self.peoples[index].name
                self.infoView.locationLbl.text = self.peoples[index].location
                self.socialView.followersLbl.attributedText = self.socialView.getAttr(text: self.peoples[index].follow, subtext:  "followers")
                self.socialView.postLbl.attributedText = self.socialView.getAttr(text: self.peoples[index].post, subtext:  "posts")
                self.socialView.followingLbl.attributedText = self.socialView.getAttr(text: self.peoples[index].following, subtext:  "following")
                
                
                self.infoView.followButton.alpha = 1
                self.infoView.nameLbl.alpha = 1
                self.infoView.locationLbl.alpha = 1
                self.socialView.followersLbl.alpha = 1
                self.socialView.postLbl.alpha = 1
                self.socialView.followingLbl.alpha = 1
                
                self.infoView.nameLbl.transform = .identity
                self.infoView.followButton.transform = .identity
                self.infoView.locationLbl.transform = .identity
                self.socialView.followersLbl.transform = .identity
                self.socialView.postLbl.transform = .identity
                self.socialView.followingLbl.transform = .identity
                
                
            })
        }
        
    }
    
    @objc func infoViewTapped() {
        isInfoTapped.toggle()
        
        let animator = UIViewPropertyAnimator(duration: 0.5, dampingRatio: 1) {
            self.infoViewBottomConstraint.constant = self.isInfoTapped ? 120 : -77
            self.infoView.infoLbl.alpha = self.isInfoTapped ? 1 : 0
            self.infoView.infoLbl.text = self.peoples[0].info
            
            if let cell = self.collectionView.cellForItem(at: self.currentIndex) {
                let img = cell.viewWithTag(10) as? UIImageView
                img?.transform = self.isInfoTapped ? CGAffineTransform(scaleX: 1.5, y: 1.5) : .identity
                self.collectionView.isUserInteractionEnabled = !self.isInfoTapped
            }
            
            self.view.layoutIfNeeded()
        }
        
        animator.startAnimation()
    }
    
    @objc func followBtnTapped() {
        
        isFollowTapped.toggle()
        infoView.animate(follow: isFollowTapped)
        
    }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return peoples.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "image_cell", for: indexPath)
        
        let imageView = cell.viewWithTag(10) as? UIImageView
        imageView?.image = peoples[indexPath.item].image
        imageView?.contentMode = .scaleAspectFill
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        changeContent(by: indexPath.item)
        currentIndex = indexPath
    }
    
}

extension ViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
}

