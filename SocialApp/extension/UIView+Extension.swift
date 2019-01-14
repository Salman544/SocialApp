//
//  UIView+Extension.swift
//  SocialApp
//
//  Created by Muhammad Salman Zafar on 13/01/2019.
//  Copyright © 2019 Muhammad Salman Zafar. All rights reserved.
//

import UIKit

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func addShadow(color: UIColor) {
        
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.shadowColor = color.cgColor
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.5
        
    }
}
