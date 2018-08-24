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
import SwiftSocket

class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sendMessageText: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    var modelChat = ChatMessageModel.ChatMessageSingleTon
    var socketIOSingleTon = SocketIOManager.socketSingleTon
    var otherNickname: String?
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // 메시지 받아오기
//        socketIOSingleTon.getChatMessage(completionHandler: (messageInfo) -> Void in
//            dispatch_async(dispatch_get_main_queue(), { () -> Void in
//            self.modelChat.append(messageInfo)
//            self.tblChat.reloadData()
//            }))
    }
    
    // 테이블 뷰 새로고침 후 스크롤 맨 밑으로 이동
    func reloadTableView() {
        tableView.reloadData()
        let indexPath = IndexPath(row: modelChat.arrayList.count - 1, section: 0)
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
    }
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        // 텍스트필드에 값이 있을 경우
        if let content = sendMessageText.text {
            // for server
            socketIOSingleTon.sendMessage(message: content, withEmail: (myInfo.mylogInfo?.email)!)
            // 키보드 아래로 숨기기
            sendMessageText.resignFirstResponder()
            
            // for local (로그인 했을때)
            if let nickname = myInfo.mylogInfo?.nickname {
                self.modelChat.arrayList.append(ChatMessageInfo(nickname: (myInfo.mylogInfo?.nickname)!, content: sendMessageText.text!, date: "00.00", alignment: 0))
            }
        
            // (안했을때)
            else {
                self.modelChat.arrayList.append(ChatMessageInfo(nickname: "소여닝", content: sendMessageText.text!, date: "00.00", alignment: 0))
            }
            
            // 텍스트필드 값 초기화
            self.sendMessageText.text = ""
            }
        // 텍스트필드에 값이 없을 경우
        else {
            print("입력하세용")
        }
        
        reloadTableView()
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
        // local 로그인 했을때
        if let nickname = myInfo.mylogInfo?.nickname {
            meCell.myNickname.text = myInfo.mylogInfo?.nickname
        }
        else { meCell.myNickname.text = "소여닝" }
        meCell.myContent.text = modelChat.arrayList[indexPath.row].content
        
        // otherNickname setting
        if let nick = otherNickname {
            otherCell.senderNickname.text = nick
        }
        else { otherCell.senderNickname.text = modelChat.arrayList[indexPath.row].nickname }
        otherCell.sendContent.text = modelChat.arrayList[indexPath.row].content
        
        if(indexPath.row % 2 != 0) { return meCell}
        else { return otherCell}
        
        
        
        /* Cell 하나로만 쓰기*/
        /*
        let cell = tableView.dequeueReusableCellWithIdentifier("idCellChat", forIndexPath: indexPath) as! ChatCell
        
        let currentChatMessage = chatMessages[indexPath.row]
        let senderNickname = currentChatMessage["nickname"] as! String
        let message = currentChatMessage["message"] as! String
        let messageDate = currentChatMessage["date"] as! String
        
        if senderNickname == nickname {
            cell.lblChatMessage.textAlignment = NSTextAlignment.Right
            cell.lblMessageDetails.textAlignment = NSTextAlignment.Right
            
            cell.lblChatMessage.textColor = lblNewsBanner.backgroundColor
        }
        
        cell.lblChatMessage.text = message
        cell.lblMessageDetails.text = "by \(senderNickname.uppercaseString) @ \(messageDate)"
        
        cell.lblChatMessage.textColor = UIColor.darkGrayColor()
        
        return cell
         */
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 130
    }
}
