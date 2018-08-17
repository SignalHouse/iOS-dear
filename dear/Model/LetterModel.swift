//
//  LetterModel.swift
//  dear
//
//  Created by MinhoCheon on 2018. 8. 17..
//  Copyright © 2018년 ksy. All rights reserved.
//

import Foundation

struct LetterInfo: Codable {
    let senderNickname: String
    let content: String
    let id: Int
    let date: String
    let isSelected: Bool
    
    init(senderNickname: String, content:String, id: Int, date: String, isSelected: Bool) {
        self.senderNickname = senderNickname
        self.content = content
        self.id = id
        self.date = date
        self.isSelected = isSelected
    }
}

class LetterModel {
    // Single ton
    static let ChatMessageSingleTon = LetterModel()
    var arrayList: Array<LetterModel>
    
    private init() {
        self.arrayList = []
    }
    
}
