//
//  SocketIOManager.swift
//  dear
//
//  Created by SoyeonKim on 2018. 8. 24..
//  Copyright © 2018년 ksy. All rights reserved.
//
import UIKit
import Foundation
import SocketIO

class SocketIOManager: NSObject {
    static let socketSingleTon = SocketIOManager()
    
    // socket setting
    let socket:SocketIOClient = SocketIOClient(manager: NSURL(string: "http://127.1.1.1:80")! as! SocketManagerSpec, nsp: "aaa")
    
    override init() {
        super.init()

    }
    
    // 서버 연결 설정
    func establishConnection() {
        socket.connect()
        print("소켓 연결 성공")
    }
    
    // 서버 연결 해제
    func closeConnection() {
        socket.disconnect()
        print("소켓 연결 해제")
    }
    
    func connectToServerWithEmail(email: String, completionHandler: @escaping (_ userList: [[String: AnyObject]]?) -> Void) {
        // send nickname to server
        socket.emit("connectUser", email)
        socket.on("userList") { ( dataArray, ack) -> Void in
            completionHandler(dataArray[0] as? [[String: AnyObject]])
        }
//        listenForOtherMessages()
    }
    
    // 채팅방에서 메시지 전송
    func sendMessage(message: String, withEmail email: String) {
        socket.emit("chatMessage", email, message)
    }
    
    // 다른 유저 메시지 받아오기
    func getChatMessage(completionHandler: @escaping (_ messageInfo: [String: AnyObject]) -> Void) {
        socket.on("newChatMessage") { (dataArray, socketAck) -> Void in
            var messageDictionary = [String: AnyObject]()
            
            // 서버 연결 형태 따라 바뀔것
            messageDictionary["nickname"] = dataArray[0] as AnyObject
            messageDictionary["message"] = dataArray[1] as AnyObject
            messageDictionary["date"] = dataArray[2] as AnyObject
            
            completionHandler(messageDictionary)
        }
    }
}
