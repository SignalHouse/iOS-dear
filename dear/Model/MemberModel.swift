//
//  MemberModel.swift
//  dear
//
//  Created by SoyeonKim on 2018. 8. 16..
//  Copyright © 2018년 ksy. All rights reserved.
//

import Foundation

struct MemberInfo: Codable {
    let email: String
    let nickname: String
    
    init(email:String, nickname:String) {
        self.email = email
        self.nickname = nickname
    }
}

class MemberModel {
    // Single ton
    static let MemberSingleTon = MemberModel()
    var arrayList: Array<MemberInfo>
    
    private init() {
        self.arrayList = []
    }

}
