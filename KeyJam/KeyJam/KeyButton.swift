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
        self.layer.borderColor = KJColors.orange().cgColor
        self.layer.borderWidth = 2.0
    }
    
    override var isHighlighted: Bool {
        get {
            return super.isHighlighted
        }
        
        set {
            if newValue {
                self.isSelected = !self.isSelected
            } else {
            }
            super.isHighlighted = newValue
        }
    }
    
    override var isSelected: Bool {
        get {
            return super.isSelected
        }
        
        set {
            if newValue {
                self.layer.borderColor = KJColors.green().cgColor
            } else {
                self.layer.borderColor = KJColors.orange().cgColor
            }
            super.isSelected = newValue
        }
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
