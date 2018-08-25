//
//  WriteViewController.swift
//  dear
//
//  Created by MinhoCheon on 2018. 8. 24..
//  Copyright © 2018년 ksy. All rights reserved.
//

import UIKit
import Alamofire

class WriteViewController: UIViewController {

    @IBOutlet weak var letterTitleText: UITextField!
    @IBOutlet weak var letterContentText: UITextField!
    var modelWaiting = WaitingLetterModel.WaitingLetterModelSingleTon
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    // 메시지 받아오기
    func getChatNewMessage() -> String {
        var resultMessage = ""
        // token 값 바꿔야 함
        Alamofire.request("http://192.168.1.33/api/message/my?access_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiZW1haWwiOiIxMTFAMTExIiwibmFtZSI6Iuy0iOuhneyDiSDtmLjrnpHsnbQiLCJpYXQiOjE1MzUxNjk4MTQsImV4cCI6MTUzNTM0MjYxNH0.B0liwIfaKs9d0_PMu6U1Qgd0qdxJ3WogjJOMInQFu9Q", method: .get,  encoding: JSONEncoding.default)
            .responseJSON
            { response in
                switch response.result {
                case.success(let value):
                    let response = value as! NSDictionary
                    //
                    //
                    print("Success with JSON: \(value)")
                    
                case .failure(let error):
                    print("message error : \(error)")
                }
        }
        
        return resultMessage
    }
    
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        // for server
        let title = letterTitleText.text!
        let content = letterContentText.text!
        
        let parameters: [String: String] = [
            "description" : content
        ]
        
        // token 값 바꿔야 함
        Alamofire.request("http://192.168.1.33/api/message?access_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiZW1haWwiOiIxMTFAMTExIiwibmFtZSI6Iuy0iOuhneyDiSDtmLjrnpHsnbQiLCJpYXQiOjE1MzUxNjk4MTQsImV4cCI6MTUzNTM0MjYxNH0.B0liwIfaKs9d0_PMu6U1Qgd0qdxJ3WogjJOMInQFu9Q", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON
            { response in
                switch response.result {
                case.success(let value):
                    let response = value as! NSDictionary
                    //
                    //
                    print("Success with JSON: \(value)")
                    // 발송 예정 편지함에 추가
                    self.modelWaiting.arrayList.append(WaitingLetterInfo(title: title, content: content, id: 2, date: "22"))
                    // 이전 화면으로 이동
                    self.navigationController?.popViewController(animated: true)
                    
                case .failure(let error):
                    print("message error : \(error)")
                }
        }
    }
}
