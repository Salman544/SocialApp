//
//  RoundView.swift
//  SocialApp
//
//  Created by Muhammad Salman Zafar on 13/01/2019.
//  Copyright © 2019 Muhammad Salman Zafar. All rights reserved.
//

import UIKit

class RoundView: UIView {
    
    var imageView: UIImageView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUp()
        backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.1215686275, blue: 0.1215686275, alpha: 1)
        addShadow(color: #colorLiteral(red: 0.9411764706, green: 0.1215686275, blue: 0.1215686275, alpha: 1))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        layer.cornerRadius = frame.width / 2
    }
    
    private func setUp() {
        
        imageView = UIImageView(image: #imageLiteral(resourceName: "add"))
        imageView.tintColor = .white
        
        addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 32),
            imageView.widthAnchor.constraint(equalToConstant: 32)
        ])
    }
    
}

