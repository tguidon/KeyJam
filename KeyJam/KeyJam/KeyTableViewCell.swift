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
            notesInKeyLabel.textColor = UIColor.lightGray
        }
    }
    @IBOutlet weak var pianoView: UIView! {
        didSet {
            pianoView.layer.cornerRadius = 8
            pianoView.layer.masksToBounds = true
            pianoView.layer.borderColor = UIColor(red:0.60, green:0.60, blue:0.60, alpha:1.00).cgColor
            pianoView.layer.borderWidth = 1.0
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
