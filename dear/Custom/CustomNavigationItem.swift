//
//  CustomNavigationItem.swift
//  dear
//
//  Created by SoyeonKim on 2018. 8. 17..
//  Copyright © 2018년 ksy. All rights reserved.
//

import UIKit

class CustomNavigationItem: UINavigationItem {
    @IBInspectable var leftImage:UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var rightImage:UIImage? {
        didSet {
            updateView()
        }
    }
    
    
    func updateView() {
        if leftImage != nil {
            backBarButtonItem?.image = leftImage
            let titleLabel = UILabel(frame: CGRect(x: 20, y: 0, width: 0, height: 0))
            titleLabel.text = title
            titleLabel.font = UIFont(name: "Prata-Regular", size: 18)
            titleView = titleLabel
        }
        if rightImage != nil {
            rightBarButtonItem?.image = rightImage
        }
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 0))
        titleLabel.text = title
        titleLabel.font = UIFont(name: "Prata-Regular", size: 18)
        titleView = titleLabel
        
    }
}
