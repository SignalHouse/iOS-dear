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
    var arrayList: Array<ChatMessageInfo>
    
    private init() {
        self.arrayList = []
        
        // dummy data
        self.arrayList.append(ChatMessageInfo(nickname: "익명의 하이에나", content: "오늘은 치킨데리야끼 덮밥을 먹었다 양파 짱많음", date: "18.02.02", alignment: 0))
        self.arrayList.append(ChatMessageInfo(nickname: "익명의 하이에나", content: "우와 맛있겠다! 다이어트 해야하는데ㅠㅠ", date: "18.02.02", alignment: 1))
        self.arrayList.append(ChatMessageInfo(nickname: "익명의 하이에나", content: "ㅎㅎ괜찮아 괜찮아 ", date: "18.02.02", alignment: 0))
        self.arrayList.append(ChatMessageInfo(nickname: "익명의 하이에나", content: "너무 심심해", date: "18.02.02", alignment: 1))
        self.arrayList.append(ChatMessageInfo(nickname: "익명의 하이에나", content: "ㅠㅠ", date: "18.02.02", alignment: 0))
    }
}
