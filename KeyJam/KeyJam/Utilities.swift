//
//  Utilities.swift
//  KeyJam
//
//  Created by Taylor Guidon on 12/12/16.
//  Copyright © 2016 Taylor Guidon. All rights reserved.
//

import UIKit

class Utilities {

    class func hapticGeneratorForSelection() {
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
    }
    
    class func loadKeysFromDisk() -> [KeyData] {
        guard let path = Bundle.main.path(forResource: "Keys", ofType: "plist"),
            let dictArray = NSArray(contentsOfFile: path) else {
                return []
        }
        var keys: [KeyData] = []
        for item in dictArray {
            if let dict = item as? NSDictionary {
                let key = dict["key"] as! String
                let notesInKeyString = dict["notesInKey"] as! String
                let imageName = dict["imageName"] as! String
                let keyData = KeyData(key, notesInKeyString, imageName)
                keys.append(keyData)
            }
        }
        return keys
    }
    
    class func getSelectedKeyData(_ selectedKeyArr: [String], _ keyDataArr: [KeyData]) -> [KeyData] {
        var selectecKeyDataArr: [KeyData] = []
        let selectedKeySet = Set(selectedKeyArr)
//        print("Selected Keys: \(selectedKeyArr)")
        
        for keyData in keyDataArr {
            guard let notesInKey = keyData.notesInKey else {
                print("No notes in key")
                return []
            }
            let notesInKeySet = Set(notesInKey)
            
            if selectedKeySet.isSubset(of: notesInKeySet) && selectedKeyArr.count > 0 {
//                print("Key \(keyData.key!): . Notes \(notesInKey)")
//                print("In Key")
                selectecKeyDataArr.append(keyData)
            }
        }
        
        return selectecKeyDataArr
    }
}
