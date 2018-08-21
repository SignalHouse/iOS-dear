//
//  SettingTableViewController.swift
//  dear
//
//  Created by MinhoCheon on 2018. 8. 21..
//  Copyright © 2018년 ksy. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController {
    @IBOutlet weak var switchStatusLabel: UILabel!
    @IBOutlet weak var myNicknameText: UITextField!
    @IBOutlet weak var submitButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // navigationBar Setting
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "backBtnItem")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "backBtnItem")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width-54, height: view.frame.height))
        titleLabel.text = title
        titleLabel.textColor = UIColor(red: 51/255, green: 85/255, blue: 106/255, alpha: 1)
        titleLabel.font = UIFont(name: "Prata-Regular", size: 18)
        self.navigationItem.titleView = titleLabel
        
        // nickname init
        myNicknameText.isEnabled = false
    }
    
    @IBAction func switchPressed(_ sender: UISwitch) {
        if sender.isOn {
            switchStatusLabel.text = "ON"
            sender.thumbTintColor = UIColor(red: 51/255, green: 85/255, blue: 106/255, alpha: 1)
            // 서버 통신
            
        } else {
            sender.thumbTintColor = UIColor.white
            switchStatusLabel.text = "OFF"
            // 서버 통신
            
        }
    }
    
    @IBAction func nickChangePressed(_ sender: UIButton) {
        sender.isHidden = true
        myNicknameText.isEnabled = true

        // 서버 통신
        let chagedNickname = myNicknameText.text!
        
        myNicknameText.isEnabled = false
        sender.isHidden = false
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

}
