//
//  AlertViewController.swift
//  dear
//
//  Created by MinhoCheon on 2018. 8. 22..
//  Copyright © 2018년 ksy. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func okPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
