//
//  TabBarView.swift
//  SocialApp
//
//  Created by Muhammad Salman Zafar on 13/01/2019.
//  Copyright © 2019 Muhammad Salman Zafar. All rights reserved.
//

import UIKit

class TabBarView: UIView {
    
    private var stackView : UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUp()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        addShadow(color: #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 0.6798480308))
        roundCorners(corners: [.topLeft, .topRight], radius: 40)
    }
    
    func getImageView(_ image: UIImage?, tintColor: UIColor = .gray) -> UIImageView {
        
        let img = UIImageView(image: image)
        img.tintColor = tintColor
        
        img.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            img.widthAnchor.constraint(equalToConstant: 24),
            img.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        return img
    }
    
    private func setUp() {
        
        let eventImage = getImageView(#imageLiteral(resourceName: "event"))
        let searchImage = getImageView(#imageLiteral(resourceName: "search"), tintColor: #colorLiteral(red: 0.9411764706, green: 0.1215686275, blue: 0.1215686275, alpha: 1))
        let emptyImg = getImageView(nil)
        let notiImage = getImageView(#imageLiteral(resourceName: "notification"))
        let chatImage = getImageView(#imageLiteral(resourceName: "chat"))
        
        stackView = UIStackView(arrangedSubviews: [eventImage, searchImage, emptyImg, notiImage, chatImage])
        
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .equalCentering
        
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -32),
            trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 32),
            bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 25)
        ])
        
        
        let roundView = RoundView()
        roundView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(roundView)
        
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: roundView.centerXAnchor),
            bottomAnchor.constraint(equalTo: roundView.bottomAnchor, constant: 25),
            roundView.widthAnchor.constraint(equalToConstant: 48),
            roundView.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        
    }
    
    
    
}
