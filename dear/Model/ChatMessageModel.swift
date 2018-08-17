//
//  ChatMessageModel.swift
//  dear
//
//  Created by SoyeonKim on 2018. 8. 17..
//  Copyright © 2018년 ksy. All rights reserved.
//

import Foundation

struct ChatMessageInfo: Codable {
    let nickname: String
    let content: String
    // 날짜는 String 말고 딴걸로!
    let date: String
    let alignment: Int
    
    init(nickname:String, content:String, date:String, alignment:Int) {
        self.nickname = nickname
        self.content = content
        self.date = date
        self.alignment = alignment
    }
}

class ChatMessageModel {
    // Single ton
    static let ChatMessageSingleTon = ChatMessageModel()
    var arrayList: Array<ChatMessageModel>
    
    private init() {
        self.arrayList = []
    }
    
}
