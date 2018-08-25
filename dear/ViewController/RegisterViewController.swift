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
    
    var modelMember = MemberModel.MemberSingleTon
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "backBtnItem")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "backBtnItem")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width-54, height: view.frame.height))
        titleLabel.text = title
        titleLabel.textColor = UIColor(red: 51/255, green: 85/255, blue: 106/255, alpha: 1)
        titleLabel.font = UIFont(name: "Prata-Regular", size: 18)
        self.navigationItem.titleView = titleLabel
        
        // nickname init
        nicknameText.text = nicknameGenerator()

    }
    
    func nicknameGenerator() -> String {
        var resultNickname = ""
        
        var colorNames: Array = ["자주색", "다홍색", "분홍색", "주황색", "라임색", "노락색", "연노랑색",
            "초록색", "연두색", "청록색", "파란색", "하늘색", "남색", "보라색", "연보라색"]
        var animalNames: Array = ["호랑이", "앵무새", "물고기", "고양이", "강아지", "재규어", "팬더"
            , "사자", "표범", "곰", "미어캣", "북극곰", "햄스터", "개구리", "사슴"]
        
        let randomIndexColor = Int(arc4random_uniform(UInt32(colorNames.count)))
        let randomIndexAnimal = Int(arc4random_uniform(UInt32(animalNames.count)))
        
        let colorName = colorNames[randomIndexColor]
        let animalName = animalNames[randomIndexAnimal]
        resultNickname = colorName + " " + animalName
        
        return resultNickname
    }

    // 회원가입 테스트
    @IBAction func SignupPressed(_ sender: Any) {
        // for server
        let email = emailText.text!
        let id = idText.text!
        let password = passwordText.text!
        let nickname = nicknameText.text!
        
        let parameters: [String: String] = [
            "email" : email,
            "name" : nickname,
            "password" : password
        ]
        
        // parsing 후 token에 저장
        Alamofire.request("http://192.168.1.33/api/user/", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON
            { response in
                switch response.result {
                case.success(let value):
                    print("Success with JSON: \(value)")
                    let tokenResponse = value as! NSDictionary
                    UserDefaults.standard.set(tokenResponse, forKey: "token")
                    print(tokenResponse)
                    
                case .failure(let error):
                    print(error)
                }
        }
        
        // for local
        modelMember.arrayList.append(MemberInfo(email: email, nickname: nickname, password: password))
        
        // popView
        navigationController?.popViewController(animated: true)
    }
}
