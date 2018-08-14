//
//  DesignableTextField.swift
//  dear
//
//  Created by SoyeonKim on 2018. 8. 14..
//  Copyright © 2018년 ksy. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableTextField: UITextField, UITextFieldDelegate {

    @IBInspectable var leftImage:UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var leftpadding:CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        if let image = leftImage {
            leftViewMode = .always
            let imageView = UIImageView(frame: CGRect(x: leftpadding, y:0, width:24, height:24))
            imageView.image = image
            
            let view = UIView(frame: CGRect(x: 16, y: 14, width: 52, height: 24))
            view.addSubview(imageView)
            
            leftView = view
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        layer.borderWidth = 0
    }
    
    override func becomeFirstResponder() -> Bool {
        layer.masksToBounds = true
        layer.borderWidth = 1
        super.becomeFirstResponder()

        return true
    }
    
}
