//
//  LoginViewController.swift
//  dear
//
//  Created by SoyeonKim on 2018. 8. 14..
//  Copyright © 2018년 ksy. All rights reserved.
//

import UIKit
import BWWalkthrough
import Alamofire

class LoginViewController: UIViewController, BWWalkthroughViewControllerDelegate {

    @IBOutlet weak var emailText: DesignableTextField!
    @IBOutlet weak var passwordText: DesignableTextField!
    @IBOutlet weak var statusLabel: UILabel!
    
    var modelMember = MemberModel.MemberSingleTon
    
    // 처음 어플 실행시만 워크쓰로우 페이지 노출
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let userDefaults = UserDefaults.standard
        if !userDefaults.bool(forKey: "walkthroughPresented") {
            showWalkthrough()
            userDefaults.set(true, forKey: "walkthroughPresented")
            userDefaults.synchronize()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func showAlert() {
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let myAlert:AlertViewController = storyboard.instantiateViewController(withIdentifier: "alert") as! AlertViewController
        myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        myAlert.modalTransitionStyle = .coverVertical
        myAlert.labelText = "이메일, 비밀번호를 확인해주세요!"
        self.present(myAlert, animated: false, completion: nil)
    }
    
    func showMain() {
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainview = storyboard.instantiateViewController(withIdentifier: "mainview")
        self.present(mainview, animated: true, completion: nil)
    }
    
    func showWalkthrough() {
        let stb: UIStoryboard = UIStoryboard(name: "WalkThrough", bundle: nil)
        let walkthrough = stb.instantiateViewController(withIdentifier: "Master") as! BWWalkthroughViewController
        let page_one = stb.instantiateViewController(withIdentifier:"Walk01")
        let page_two = stb.instantiateViewController(withIdentifier:"Walk02")
        let page_three = stb.instantiateViewController(withIdentifier:"Walk03")
        
        walkthrough.delegate = self
        walkthrough.add(viewController:page_one)
        walkthrough.add(viewController:page_two)
        walkthrough.add(viewController:page_three)
        
        self.present(walkthrough, animated: true, completion: nil)
    }
    
    func isValidEmail(emailString:String) -> Bool {
        let regex = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", regex)
        return emailPredicate.evaluate(with: emailString)
    }
    
    // 로그인 버튼 클릭
    @IBAction func signinPressed(_ sender: UIButton) {
        statusLabel.text = ""
        
        // 값을 입력하지 않은 경우
        if (emailText.text=="") {
            statusLabel.text = "이메일을 입력해주세요"
            return
        }
        
        else if (passwordText.text=="") {
            statusLabel.text = "비밀번호를 입력해주세요"
            return
        }
            
        // 메일 형식이 맞지 않은 경우
        else if (!isValidEmail(emailString: emailText.text!)) {
            statusLabel.text = "메일 형식이 올바르지 않습니다."
            return
        }

        // 형식은 만족하나 회원 정보가 없는 경우
        else {
            // for server
            let email = emailText.text!
            let password = passwordText.text!
            
            let parameters: [String: String] = [
                "email" : email,
                "password" : password
            ]
            
            // token 저장
            Alamofire.request("http://192.168.1.33/api/user/login", method: .post, parameters: parameters, encoding: JSONEncoding.default)
                .responseJSON
                { response in
                    switch response.result {
                    case.success(let value):
                        print("Success with JSON: \(value)")
                        let response = value as! NSDictionary
                        // 작업 수행
                        //
                        let str = UserDefaults.standard.object(forKey: "token")
                        
                        // token을 받아왔을 경우
                        if (str != nil) {
                            print("login success : \(str)")
                            self.showMain() }
                            
                        // 받지 못했을 경우
                        else {
                            print("login fail")
                            self.showAlert()
                        }
                        
                    case .failure(let error):
                        print("login fail - server : \(error)")
                        self.showAlert()
                    }
            }
            
            // for local
//            let myMemberInfo = modelMember.findUser(email: emailText.text!)
//            if myMemberInfo?.password != passwordText.text {
//                showAlert()
//            }
//            else {
//                //myInfo에 사용자 저장
//                myInfo.mylogInfo = myMemberInfo!
//                showMain()
//            }
        }
    }
    
    
}
