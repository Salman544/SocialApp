//
//  TestVC.swift
//  SocialApp
//
//  Created by Muhammad Salman Zafar on 14/01/2019.
//  Copyright © 2019 Muhammad Salman Zafar. All rights reserved.
//

import UIKit

class TestVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpScrollView(with: [UIImage(named: "1.jpg")!, UIImage(named: "2.jpg")!, UIImage(named: "3.jpg")!])
    }
    
    func setUpScrollView(with images: [UIImage]) {
        
        scrollView.setContentOffset(CGPoint(x: scrollView.contentOffset.x, y: 0), animated: true)
        
        scrollView.contentSize = CGSize(width: view.frame.width, height: scrollView.frame.height)
        
        for (index, img) in images.enumerated() {
            
            let imgView = UIImageView(frame: CGRect(x: view.frame.width * CGFloat(index), y: 0, width: view.frame.width, height: scrollView.frame.height))
            imgView.image = img
            imgView.contentMode = .scaleAspectFill
            
            scrollView.addSubview(imgView)
        }
        
    }
    

}
