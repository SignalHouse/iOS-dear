//
//  ResetPasswordViewController.swift
//  dear
//
//  Created by SoyeonKim on 2018. 8. 17..
//  Copyright © 2018년 ksy. All rights reserved.
//

import UIKit
import Alamofire

class ResetPasswordViewController: UIViewController {

    @IBOutlet weak var emailText: DesignableTextField!
    
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
        
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
    }
    func showAlert() {
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let myAlert:AlertViewController = storyboard.instantiateViewController(withIdentifier: "alert") as! AlertViewController
        myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        myAlert.modalTransitionStyle = .coverVertical
        myAlert.labelText = "이메일을 전송했습니다."
        self.present(myAlert, animated: false, completion: nil)
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        // for server
        let email = emailText.text!
        
        let parameters: [String: String] = [
            "email" : email
        ]
        
        
        Alamofire.request("http://192.168.1.33/api/user", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON
            { response in
                switch response.result {
                case.success(let value):
                    print("Success with JSON: \(value)")
                    let response = value as! NSDictionary
                    // 작업 수행
                    
                    self.showAlert()
                    
                case .failure(let error):
                    print(error)
                }
        }
    }
}
