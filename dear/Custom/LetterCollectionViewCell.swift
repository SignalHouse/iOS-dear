//
//  LetterCollectionViewCell.swift
//  dear
//
//  Created by MinhoCheon on 2018. 8. 18..
//  Copyright © 2018년 ksy. All rights reserved.
//

import UIKit

class LetterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var backImg: UIImageView!
    @IBOutlet weak var recentLabel: UILabel!
    @IBOutlet weak var underline: UIView!
    @IBOutlet weak var checkButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
