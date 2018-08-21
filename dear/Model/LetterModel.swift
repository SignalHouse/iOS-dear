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
    static let LetterModelSingleTon = LetterModel()
    var arrayList: Array<LetterInfo>
    
    private init() {
        self.arrayList = []
        
        self.arrayList.append(LetterInfo(senderNickname: "익명의 코끼리", content: "오늘 맛있는거 먹었다!", id: 0, date: "18.01.01", isSelected: false))
        self.arrayList.append(LetterInfo(senderNickname: "익명의 하이에나", content: "으아아 심심해ㅠㅠ", id: 1, date: "18.01.01", isSelected: false))
        self.arrayList.append(LetterInfo(senderNickname: "익명의 코끼리", content: "오늘 맛있는거 먹었다!", id: 2, date: "18.01.01", isSelected: false))
        self.arrayList.append(LetterInfo(senderNickname: "익명의 코끼리", content: "오늘 맛있는거 먹었다!", id: 3, date: "18.01.01", isSelected: false))

    }
    
}
