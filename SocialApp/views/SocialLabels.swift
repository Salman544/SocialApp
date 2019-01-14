//
//  SocailLabels.swift
//  SocialApp
//
//  Created by Muhammad Salman Zafar on 14/01/2019.
//  Copyright © 2019 Muhammad Salman Zafar. All rights reserved.
//

import UIKit

class SocialLabels: UIView {
    
    let followersLbl = UILabel()
    let postLbl = UILabel()
    let followingLbl = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLabels()
        addShadow(color: .black)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLabels() {
        
        followersLbl.attributedText = getAttr(text: "869", subtext: "followers")
        followersLbl.translatesAutoresizingMaskIntoConstraints = false
        followersLbl.numberOfLines = 0
        followersLbl.textAlignment = .left
        followersLbl.textColor = .white
        addSubview(followersLbl)
        
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: followersLbl.leadingAnchor, constant: -32),
            centerYAnchor.constraint(equalTo: followersLbl.centerYAnchor)
        ])
        
        
        postLbl.attributedText = getAttr(text: "120", subtext: "posts")
        postLbl.translatesAutoresizingMaskIntoConstraints = false
        postLbl.numberOfLines = 0
        postLbl.textAlignment = .center
        postLbl.textColor = .white
        addSubview(postLbl)
        
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: postLbl.centerXAnchor),
            centerYAnchor.constraint(equalTo: postLbl.centerYAnchor)
        ])
        
        
        followingLbl.attributedText = getAttr(text: "150", subtext: "following")
        followingLbl.translatesAutoresizingMaskIntoConstraints = false
        followingLbl.numberOfLines = 0
        followingLbl.textAlignment = .right
        followingLbl.textColor = .white
        addSubview(followingLbl)
        
        NSLayoutConstraint.activate([
            trailingAnchor.constraint(equalTo: followingLbl.trailingAnchor, constant: 32),
            centerYAnchor.constraint(equalTo: followingLbl.centerYAnchor)
        ])
        
        
        
    }
    
    
    func getAttr(text: String, subtext: String) -> NSAttributedString {
        
        let firstAttr: [NSAttributedString.Key : Any] = [
            .font: UIFont(name: "Avenir-Heavy", size: 14)!,
            .foregroundColor: UIColor.white
        ]
        
        let secondtAttr: [NSAttributedString.Key : Any] = [
            .font: UIFont(name: "Avenir-Book", size: 14)!,
            .foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.800593964)
        ]
        
        let mainText = "\(text)\n\(subtext)"
        
        let mutableString = NSMutableAttributedString(string: mainText)
        mutableString.addAttributes(firstAttr, range: (mainText as NSString).range(of: text))
        mutableString.addAttributes(secondtAttr, range: (mainText as NSString).range(of: subtext))
        
        return mutableString
    }

}
