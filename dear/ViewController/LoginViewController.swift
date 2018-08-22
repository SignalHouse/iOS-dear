//
//  LoginViewController.swift
//  dear
//
//  Created by SoyeonKim on 2018. 8. 14..
//  Copyright © 2018년 ksy. All rights reserved.
//

import UIKit
import BWWalkthrough

class LoginViewController: UIViewController, BWWalkthroughViewControllerDelegate {

    @IBOutlet weak var emailText: DesignableTextField!
    @IBOutlet weak var passwordText: DesignableTextField!
    var isFirst:Bool = false
    
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
        let myAlert = storyboard.instantiateViewController(withIdentifier: "aaaa") 
        myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(myAlert, animated: true, completion: nil)
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
        
        // Attach the pages to the master
        walkthrough.delegate = self
        walkthrough.add(viewController:page_one)
        walkthrough.add(viewController:page_two)
        walkthrough.add(viewController:page_three)
        
        self.present(walkthrough, animated: true, completion: nil)
    }
    
    @IBAction func signinPressed(_ sender: UIButton) {
        if (emailText.text==""||passwordText.text=="") {
            showAlert()
        }
        else {
            showMain()
        }
    }
    
    
}
