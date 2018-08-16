//
//  RegisterViewController.swift
//  dear
//
//  Created by SoyeonKim on 2018. 8. 14..
//  Copyright © 2018년 ksy. All rights reserved.
//

import UIKit
import Alamofire

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailText: DesignableTextField!
    @IBOutlet weak var idText: DesignableTextField!
    @IBOutlet weak var passwordText: DesignableTextField!
    @IBOutlet weak var rePasswordText: DesignableTextField!
    @IBOutlet weak var nicknameText: UITextField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // 회원가입 테스트
    @IBAction func SignupPressed(_ sender: Any) {
        let email = emailText.text!
        let id = idText.text!
        let password = passwordText.text!
        let nickname = nicknameText.text!
        
        let parameters: [String: String] = [
            "id" : id,
            "name" : nickname,
            "email" : email,
            "password" : password
        ]
        
        // pasing 후 token에 저장
        Alamofire.request("http://192.168.1.162:8000/api/user", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON
            { response in
                switch response.result {
                case.success(let value):
                    print("Success with JSON: \(value)")
                    let response = value as! NSDictionary
                    self.appDelegate.token = "\(response.object(forKey: "token")!)"
                    print(self.appDelegate.token!)
                    
                case .failure(let error):
                    print(error)
                }
        }
    }
}
