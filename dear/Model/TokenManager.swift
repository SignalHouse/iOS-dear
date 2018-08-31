//
//  tokenManager.swift
//  dear
//
//  Created by SoyeonKim on 2018. 9. 1..
//  Copyright © 2018년 ksy. All rights reserved.
//

import Foundation

class TokenManager {
    var token: String = ""
    
    func setMyToken(tokenResponse:String) {
        UserDefaults.standard.set(tokenResponse, forKey: "token")
    }
    
    func getMyToken() -> String {
        token = UserDefaults.standard.object(forKey: "token") as! String
        return token
    }
}
