//
//  WaitingLetterModel.swift
//  dear
//
//  Created by SoyeonKim on 2018. 8. 24..
//  Copyright © 2018년 ksy. All rights reserved.
//

import Foundation

struct WaitingLetterInfo: Codable {
    let title: String
    let content: String
    let id: Int
    let date: String
    
    init(title: String, content:String, id: Int, date: String) {
        self.title = title
        self.content = content
        self.id = id
        self.date = date
    }
}

class WaitingLetterModel {
    // Single ton
    static let WaitingLetterModelSingleTon = WaitingLetterModel()
    var arrayList: Array<WaitingLetterInfo>
    
    private init() {
        self.arrayList = []
        
        self.arrayList.append(WaitingLetterInfo(title: "지금은 할리스", content: "ㅠㅠㅠㅠㅠㅠ소켓", id: 0, date: "18.02"))
        self.arrayList.append(WaitingLetterInfo(title: "랄랄랄랄", content: "무슨말을 하지이이이이이", id: 1, date: "18.02"))
        self.arrayList.append(WaitingLetterInfo(title: "흐으으음", content: "할말이 없네용", id: 2, date: "18.02"))
        self.arrayList.append(WaitingLetterInfo(title: "지금은 할리스", content: "ㅠㅠㅠㅠㅠㅠ소켓", id: 3, date: "18.02"))
        self.arrayList.append(WaitingLetterInfo(title: "지금은 할리스", content: "ㅠㅠㅠㅠㅠㅠ소켓", id: 4, date: "18.02"))
    }
    
}
