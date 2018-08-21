//
//  ChatViewController.swift
//  dear
//
//  Created by SoyeonKim on 2018. 8. 18..
//  Copyright © 2018년 ksy. All rights reserved.
//

import UIKit
import SocketIO
import KYDrawerController

class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sendMessageText: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    var modelChat = ChatMessageModel.ChatMessageSingleTon
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // navigationBar Setting
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "backBtnItem")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "backBtnItem")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width-54, height: view.frame.height))
        titleLabel.text = title
        titleLabel.textColor = UIColor(red: 51/255, green: 85/255, blue: 106/255, alpha: 1)
        titleLabel.font = UIFont(name: "Prata-Regular", size: 18)
        self.navigationItem.titleView = titleLabel
    }
    
    
    /* tableview setting */
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let meCell = tableView.dequeueReusableCell(withIdentifier: "MeCell") as! ChatMeTableViewCell
        let otherCell = tableView.dequeueReusableCell(withIdentifier: "OtherCell") as! ChatOtherTableViewCell
        
        if(indexPath.row % 2 != 0) { return meCell}
        else { return otherCell}
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 130
    }
}
