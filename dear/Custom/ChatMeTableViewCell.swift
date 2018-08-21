//
//  ChatMeTableViewCell.swift
//  dear
//
//  Created by SoyeonKim on 2018. 8. 18..
//  Copyright © 2018년 ksy. All rights reserved.
//

import UIKit

class ChatMeTableViewCell: UITableViewCell {
    @IBOutlet weak var myNickname: UILabel!
    @IBOutlet weak var myContent: UILabel!
    @IBOutlet weak var myTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
