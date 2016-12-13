//
//  KeyTableViewCell.swift
//  KeyJam
//
//  Created by Taylor Guidon on 12/12/16.
//  Copyright © 2016 Taylor Guidon. All rights reserved.
//

import UIKit

class KeyTableViewCell: UITableViewCell {
    @IBOutlet weak var keyLabel: UILabel! {
        didSet {
            keyLabel.textColor = .white
        }
    }
    
    @IBOutlet weak var notesInKeyLabel: UILabel! {
        didSet {
            notesInKeyLabel.textColor = .white
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
