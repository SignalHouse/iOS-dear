//
//  AlertViewController.swift
//  dear
//
//  Created by MinhoCheon on 2018. 8. 22..
//  Copyright © 2018년 ksy. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {
    
    @IBOutlet weak var contentLabel: UILabel!
    var labelText:String? = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 이전 화면에서 값을 넘겨받은 경우에 해당 내용으로 변경
        if let text = labelText {
            contentLabel.text = text
        }
    }
    
    @IBAction func okPressed(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
}
