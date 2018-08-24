//
//  WaitingLetterTableViewController.swift
//  dear
//
//  Created by SoyeonKim on 2018. 8. 21..
//  Copyright © 2018년 ksy. All rights reserved.
//

import UIKit

class WaitingLetterTableViewController: UITableViewController {

    @IBOutlet weak var remainTimeLabel: UILabel!
    var modelWaiting = WaitingLetterModel.WaitingLetterModelSingleTon
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // for empty cell no line
        tableView.tableFooterView = UIView()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelWaiting.arrayList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WaitingCell") as! WaitingTableViewCell
        
        let info = modelWaiting.arrayList[indexPath.row]
        cell.content.text = info.content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 130
    }
}
