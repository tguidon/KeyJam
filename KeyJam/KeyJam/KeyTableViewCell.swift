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
    @IBOutlet weak var pianoView: PianoView! {
        didSet {
            pianoView.visibleStatus = [true, true, true, true, true, true,
                                       true, true, true, true, true, true,
                                       true, true, true, true, true, true,
                                       true, true, true, true, true, true]
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
    }
}
