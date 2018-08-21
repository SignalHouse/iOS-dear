//
//  UpdatePasswordTableViewController.swift
//  dear
//
//  Created by SoyeonKim on 2018. 8. 21..
//  Copyright © 2018년 ksy. All rights reserved.
//

import UIKit
import Alamofire

class UpdatePasswordTableViewController: UITableViewController {

    @IBOutlet weak var currentPwText: UITextField!
    @IBOutlet weak var newPwText: UITextField!
    @IBOutlet weak var reNewPwText: UITextField!
    
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
        
        // password init
        currentPwText.text = "123456"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    @IBAction func SubmitPressed(_ sender: Any) {
        // 서버 통신
        
        // 이전 화면
        navigationController?.popViewController(animated: true)
    }
    
}
