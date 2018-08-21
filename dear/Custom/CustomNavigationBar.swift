//
//  CustomNavigationBar.swift
//  dear
//
//  Created by SoyeonKim on 2018. 8. 17..
//  Copyright © 2018년 ksy. All rights reserved.
//

import UIKit

class CustomNavigationBar: UINavigationBar {
    @IBInspectable var leftpadding:CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var width:CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var height:CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
//        layer.borderWidth = 0
//
//        if let image = leftImage {
//            leftViewMode = .always
//            let imageView = UIImageView(frame: CGRect(x: leftpadding+3, y:3, width:width, height:height))
//            imageView.image = image
//
//            let view = UIView(frame: CGRect(x: 16, y: 14, width: 52, height: 24))
//            view.addSubview(imageView)
//
//            leftView = view
//        }
    }

}
