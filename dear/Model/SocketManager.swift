//
//  SocketManager.swift
//  dear
//
//  Created by SoyeonKim on 2018. 8. 24..
//  Copyright © 2018년 ksy. All rights reserved.
//

import Foundation
import SwiftSocket

class SocketManager {
    // token 설정
    let token:String = UserDefaults.standard.object(forKey: "token") as! String
    
    // URL 설정
    let client = TCPClient(address: "http://192.168.1.33/", port: Int32(8080))
    let server = TCPServer(address: "http://192.168.1.33/", port: 8080)
    
    
    // 메시지 전송
    func SS_sendMessage(timeout:Int, message: String){
        switch client.connect(timeout: timeout) {
        case .success:
            print("Socket connect")
            switch client.send(string: message) {
            case .success:
//                guard let data = client.read(1024*10) else { return }
//                if let response = String(bytes: data, encoding: .utf8) {
//                    print(response)
//                }
                print("connectOK, message : \(message)")
            case .failure(let error):
                print("connectOK, but: \(error)")
            }
        case .failure(let error):
            print("connectNO, but: \(error)")
        }
    }
    
    func echoService(client: TCPClient) {
        print("Newclient from:\(client.address)[\(client.port)]")
        var d = client.read(1024*10)
        client.send(data: d!)
        client.close()
    }
    
    func testServer() {
        let server = TCPServer(address: "http://192.168.1.33/", port: 8080)
        switch server.listen() {
        case .success:
            while true {
                if var client = server.accept() {
                    echoService(client: client)
                } else {
                    print("accept error")
                }
            }
        case .failure(let error):
            print(error)
        }
    }
    
    func SS_readMessage() {
        
    }
    
    // 소켓 연결 해제
    func SS_closeSocket() {
        client.close()
    }
    
    func SS_echoService(client: TCPClient) {
        print("Newclient from:\(client.address)[\(client.port)]")
        let data = client.read(1024*10)
        client.send(data: data!)
        client.close()
    }
}

