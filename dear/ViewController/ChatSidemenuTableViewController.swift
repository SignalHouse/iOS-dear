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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 신고하기
        if indexPath.row == 0 {
            goReport()
        }
        // 차단하기
        if indexPath.row == 1 {
            goBlock()
        }
        // 퇴장하기
        if indexPath.row == 2 {
            goOut()
        }
    }
    
    func goReport() {
        print("신고")
    }
    
    func goBlock() {
        print("차단")
    }
    
    func goOut() {
        print("퇴장")
    }
    
    
}
