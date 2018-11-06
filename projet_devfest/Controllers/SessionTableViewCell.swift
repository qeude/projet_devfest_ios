//
//  SessionTableViewCell.swift
//  projet_devfest
//
//  Created by Quentin Eude on 29/10/2018.
//  Copyright © 2018 Quentin Eude. All rights reserved.
//

import UIKit

class SessionTableViewCell: UITableViewCell {

    @IBOutlet weak var labelSession : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
