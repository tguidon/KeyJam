//
//  KeyButton.swift
//  KeyJam
//
//  Created by Taylor Guidon on 11/7/16.
//  Copyright © 2016 Taylor Guidon. All rights reserved.
//

import UIKit

class KeyButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 20.0
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 2.0
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.layer.borderColor = KJColors.green().cgColor
            } else {
                self.layer.borderColor = UIColor.lightGray.cgColor
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.isSelected = !self.isSelected
    }
}

class WhiteKeyButton: KeyButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.backgroundColor = UIColor.white
    }
}

class BlackKeyButton: KeyButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.backgroundColor = UIColor.black
    }
}
