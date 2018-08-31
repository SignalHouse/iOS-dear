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
    let client = TCPClient(address: "http://192.168.219.107/api/message/my?access_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsImVtYWlsIjoiMUAxIiwibmFtZSI6Iu2VmOuKmOyDiSDqsJzqtazrpqwiLCJpYXQiOjE1MzU3MzIxNjUsImV4cCI6MTUzNTkwNDk2NX0.v4vy16vvUlGY1lKRcs1x8FMZH5RkqwbBrtaDyegg94w", port: Int32(8000))
    
    // 메시지 전송
    func SS_sendMessage(timeout:Int, message: String){
        switch client.connect(timeout: timeout) {
        case .success:
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

