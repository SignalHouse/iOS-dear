//
//  WaitingTableViewCell.swift
//  dear
//
//  Created by MinhoCheon on 2018. 8. 24..
//  Copyright © 2018년 ksy. All rights reserved.
//

import UIKit

class WaitingTableViewCell: UITableViewCell {

    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var writeButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var sendTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
