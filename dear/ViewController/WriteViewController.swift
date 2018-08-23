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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        // for server
        let title = letterTitleText.text!
        let content = letterContentText.text!
        
        let parameters: [String: String] = [
            "title" : title,
            "content" : content
        ]
        
        // 편지 전송 후 작업 수행
        Alamofire.request("http://192.168.1.162:8000/api/user", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON
            { response in
                switch response.result {
                case.success(let value):
                    print("Success with JSON: \(value)")
                    let response = value as! NSDictionary
                    //
                    //
                    
                case .failure(let error):
                    print(error)
                }
        }
    }
}
