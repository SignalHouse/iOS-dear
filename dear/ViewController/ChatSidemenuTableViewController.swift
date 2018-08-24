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
        
        // for empty cell no line
        tableView.tableFooterView = UIView()
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
        showAlert()
    }
    
    // 알림창 뜨기만 함...!
    func showAlert() {
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let myAlert:AlertCancelAddedViewController = storyboard.instantiateViewController(withIdentifier: "alertCancel") as! AlertCancelAddedViewController
        myAlert.modalTransitionStyle = .coverVertical
        myAlert.labelText = "정말 나가시겠어요?"
        self.present(myAlert, animated: false, completion: nil)
    }
    
    
}
