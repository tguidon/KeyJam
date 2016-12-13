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
    var imageName: String?
    
    init(_ key: String,_ notesInKeyString: String,_ imageName: String) {
        self.key = key
        self.notesInKeyString = notesInKeyString
        self.notesInKey = notesInKeyString.components(separatedBy: " ")
        self.imageName = imageName
    }
}
