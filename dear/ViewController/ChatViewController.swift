//
//  ChatViewController.swift
//  dear
//
//  Created by MinhoCheon on 2018. 8. 18..
//  Copyright © 2018년 ksy. All rights reserved.
//

import UIKit
import SocketIO

class ChatViewController: UIViewController{
    var modelChat = ChatMessageModel.ChatMessageSingleTon
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
