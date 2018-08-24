//
//  LetterModel.swift
//  dear
//
//  Created by SoyeonKim on 2018. 8. 17..
//  Copyright © 2018년 ksy. All rights reserved.
//

import Foundation

struct LetterInfo: Codable {
    let senderNickname: String
    let content: String
    let id: Int
    let date: String
    let isSelected: Bool
    var isNew: Bool
    
    init(senderNickname: String, content:String, id: Int, date: String, isSelected: Bool, isNew: Bool) {
        self.senderNickname = senderNickname
        self.content = content
        self.id = id
        self.date = date
        self.isSelected = isSelected
        self.isNew = isNew
    }
}

class LetterModel {
    // Single ton
    static let LetterModelSingleTon = LetterModel()
    var arrayList: Array<LetterInfo>
    
    private init() {
        self.arrayList = []
        
        self.arrayList.append(LetterInfo(senderNickname: "익명의 코끼리", content: "오늘 맛있는거 먹었다!", id: 0, date: "18.01.01", isSelected: false, isNew: false))
        self.arrayList.append(LetterInfo(senderNickname: "익명의 하이에나", content: "으아아 심심해ㅠㅠ", id: 1, date: "18.01.01", isSelected: false, isNew: true))
        self.arrayList.append(LetterInfo(senderNickname: "소여닝", content: "으아아아", id: 2, date: "18.01.01", isSelected: false, isNew: true))
        self.arrayList.append(LetterInfo(senderNickname: "심심한 여우", content: "콜드브루맛나다", id: 3, date: "18.01.01", isSelected: false, isNew: false))
        self.arrayList.append(LetterInfo(senderNickname: "귀여운 야옹이", content: "심심쓰", id: 3, date: "18.01.01", isSelected: false, isNew: false))

    }
    
}
