//
//  MemberModel.swift
//  dear
//
//  Created by SoyeonKim on 2018. 8. 16..
//  Copyright © 2018년 ksy. All rights reserved.
//
import UIKit
import Foundation

// login 성공한 member 정보
var myInfo = MyInfo()
struct MyInfo {
    var mylogInfo: MemberInfo?
    
//    func checkAndShowLogin() {
//        if mylogInfo == nil {
//            let w = UIApplication.shared.delegate?.window as! UIWindow
//            w.rootViewController?.performSegue(withIdentifier: "toLogin", sender: nil) // tabbarcontroller
//        }
//    }
    mutating func logout() {
        self.mylogInfo = nil
    }
}

struct MemberInfo: Codable {
    let email: String
    let nickname: String
    let password: String
    
    init(email:String, nickname:String, password: String) {
        self.email = email
        self.nickname = nickname
        self.password = password
    }
}

class MemberModel {
    // Single ton
    static let MemberSingleTon = MemberModel()
    var arrayList: Array<MemberInfo>
    
    private init() {
        self.arrayList = []
    }
    
    // 이메일로 회원 정보 찾기
    func findUser(email: String) -> MemberInfo? {
        for member in arrayList {
            if email == member.email {
                return member
            }
        }
        return nil
    }

}
