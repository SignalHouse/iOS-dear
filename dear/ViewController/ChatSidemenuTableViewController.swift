//
//  ChatSidemenuTableViewController.swift
//  dear
//
//  Created by SoyeonKim on 2018. 8. 22..
//  Copyright © 2018년 ksy. All rights reserved.
//

import UIKit
import Alamofire

class ChatSidemenuTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let reportCell = tableView.dequeueReusableCell(withIdentifier: "reportCell")
////        let blockCell = tableView.dequeueReusableCell(withIdentifier: "blockCell")
////        let outCell = tableView.dequeueReusableCell(withIdentifier: "outCell")
////
//        return cell
//        
//    }
    
    
}
