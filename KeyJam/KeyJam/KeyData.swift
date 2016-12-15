//
//  Key.swift
//  KeyJam
//
//  Created by Taylor Guidon on 12/12/16.
//  Copyright © 2016 Taylor Guidon. All rights reserved.
//

import Foundation

class KeyData {
    var key: String?
    var notesInKeyString: String?
    var notesInKey: [String]?
    //var highlightedArrayString: String?
    var highlightKeysBoolArray: [Bool] = []
    
    init(_ key: String,_ notesInKeyString: String,_ highlightedArrayString: String) {
        self.key = key
        self.notesInKeyString = notesInKeyString
        self.notesInKey = notesInKeyString.components(separatedBy: " ")
        // self.highlightedArrayString = highlightedArrayString
        
        for hightlight in highlightedArrayString.characters {
            if hightlight == "1" {
                self.highlightKeysBoolArray.append(true)
            } else {
                self.highlightKeysBoolArray.append(false)
            }
        }
        
    }
}
