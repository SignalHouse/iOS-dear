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
    @IBOutlet weak var noMessageLabel: UILabel!
    var modelChat = ChatMessageModel.ChatMessageSingleTon
    var otherNickname: String?
    let tokenManger = TokenManager()
    let socket = SocketIOClient(
        socketURL: URL(string: "http://192.168.1.247:8080")!,
        config: [.log(true), .compress])
    
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
        
        // no label setting
        // 새로운 메시지가 없을 경우에는 '답장이 올 때까지 편지를 보낼 수 없습니다' 노출
//        if(getChatNewMessage() == "") { noMessageLabel.isHidden = false }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // 메시지 받아오기
        reloadTableView()
    }
    
    // 테이블 뷰 새로고침 후 스크롤 맨 밑으로 이동
    func reloadTableView() {
        tableView.reloadData()
        let indexPath = IndexPath(row: modelChat.arrayList.count - 1, section: 0)
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
    }

    // 메시지 전송
    func sendChatMessage(content:String) {
        socket.on(clientEvent:.connect) {data, ack in
            self.socket.emit("message", with:[content])
            print("print")
        }
        socket.connect()
    }
    
    // 메시지 받아오기
    func getChatMessage() {
        let socket = SocketIOClient(
            socketURL: URL(string: "http://192.168.1.247:8080")!,
            config: [.log(true), .compress])
        
        socket.on("message") {data, ack in
            socket.emit("message", "\(data)")
        }
    }
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        // 텍스트필드에 값이 있을 경우
        if (sendMessageText.text?.count)! > 0 {
            var content = sendMessageText.text!
            // for server
            // 키보드 아래로 숨기기
            sendMessageText.resignFirstResponder()
            sendChatMessage(content: content)
            
            // for local (로그인 했을때)
            if let nickname = myInfo.mylogInfo?.nickname {
                self.modelChat.arrayList.append(ChatMessageInfo(nickname: nickname, content: content, date: getCurrentTime(), alignment: 0))
            }
        
            // (안했을때)
            else {
                self.modelChat.arrayList.append(ChatMessageInfo(nickname: "소여닝", content: content, date: getCurrentTime(), alignment: 0))
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
    
    func getCurrentTime() -> String {
        // 현재 날짜, 포매터 설정
        var currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        formatter.locale = Locale(identifier: "ko_KR")
        
        var resultDate = formatter.string(from: currentDate)
        return resultDate
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
        let info = modelChat.arrayList[indexPath.row]
        
        // for server
        getChatMessage()
        
        // cell detail setting
        // local 로그인 했을때
        if let nickname = myInfo.mylogInfo?.nickname {
            meCell.myNickname.text = nickname
        }
        else {
            meCell.myNickname.text = "소여닝"
        }
        meCell.myTime.text = getCurrentTime()
        meCell.myContent.text = info.content
        
        // otherNickname setting
        if let nick = otherNickname {
            otherCell.senderNickname.text = nick
            otherCell.sendTime.text = info.date
        }
        else {
            otherCell.senderNickname.text = info.nickname
        }
        otherCell.sendContent.text = info.content
        
        if(indexPath.row % 2 != 0) { return meCell}
        else { return otherCell}
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 130
    }
}
