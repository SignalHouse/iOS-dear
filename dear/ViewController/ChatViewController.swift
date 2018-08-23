//
//  ChatViewController.swift
//  dear
//
//  Created by SoyeonKim on 2018. 8. 18..
//  Copyright © 2018년 ksy. All rights reserved.
//

import UIKit
import SocketIO
import Alamofire
import SideMenu

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
        
        // side menu setting
         let menuRightNavigationController = storyboard!.instantiateViewController(withIdentifier: "ChatSidemenuTableViewController") as! UISideMenuNavigationController
        SideMenuManager.default.menuRightNavigationController = menuRightNavigationController
        SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        
        // side menu custom
        SideMenuManager.default.menuPresentMode = .menuSlideIn
        SideMenuManager.default.menuShadowRadius = 100
    }
    
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        // for server
        let content = sendMessageText.text!
        
        let parameters: [String: String] = [
            "content" : content
        ]
        
        // 편지 전송 후 작업 수행
        Alamofire.request("http://192.168.1.162:8000/api/user", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON
            { response in
                switch response.result {
                case.success(let value):
                    print("Success with JSON: \(value)")
                    let response = value as! NSDictionary
                    //
                    //
                    self.sendMessageText.text = ""
                    
                case .failure(let error):
                    print(error)
                }
        }
        
        // for local
//        self.modelChat.arrayList.append(ChatMessageInfo(nickname: (myInfo.mylogInfo?.nickname)!, content: sendMessageText.text!, date: "00.00", alignment: 0))
        
    }
    
    /* tableview setting */
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelChat.arrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let meCell = tableView.dequeueReusableCell(withIdentifier: "MeCell") as! ChatMeTableViewCell
        let otherCell = tableView.dequeueReusableCell(withIdentifier: "OtherCell") as! ChatOtherTableViewCell
        
        // cell detail setting
        meCell.myNickname.text = myInfo.mylogInfo?.nickname
        
        otherCell.senderNickname.text = modelChat.arrayList[indexPath.row].nickname
        otherCell.sendContent.text = modelChat.arrayList[indexPath.row].content
        
        if(indexPath.row % 2 != 0) { return meCell}
        else { return otherCell}
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 130
    }
}
