//
//  ChatOtherTableViewCell.swift
//  dear
//
//  Created by SoyeonKim on 2018. 8. 18..
//  Copyright © 2018년 ksy. All rights reserved.
//

import UIKit

class ChatOtherTableViewCell: UITableViewCell {

    @IBOutlet weak var senderNickname: UILabel!
    @IBOutlet weak var sendTime: UILabel!
    @IBOutlet weak var sendContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
