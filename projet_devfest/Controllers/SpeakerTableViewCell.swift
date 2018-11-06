//
//  SpeakerTableViewCell.swift
//  projet_devfest
//
//  Created by Quentin Eude on 06/11/2018.
//  Copyright © 2018 Quentin Eude. All rights reserved.
//

import UIKit

class SpeakerTableViewCell: UITableViewCell {

    @IBOutlet weak var labelSpeaker : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
