//
//  FollowView.swift
//  SocialApp
//
//  Created by Muhammad Salman Zafar on 13/01/2019.
//  Copyright © 2019 Muhammad Salman Zafar. All rights reserved.
//

import UIKit

class FollowButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        
        layer.cornerRadius = 14
        layer.borderColor = #colorLiteral(red: 0.9411764706, green: 0.1215686275, blue: 0.1215686275, alpha: 1)
        layer.borderWidth = 2
        setTitle("FOLLOW", for: .normal)
        setTitleColor(#colorLiteral(red: 0.9411764706, green: 0.1215686275, blue: 0.1215686275, alpha: 1), for: .normal)
        tintColor = .white
        titleLabel?.font = UIFont(name: "Avenir-Medium", size: 15)
        
    }
    
}
