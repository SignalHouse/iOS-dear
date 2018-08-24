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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

}
