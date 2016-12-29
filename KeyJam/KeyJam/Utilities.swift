//
//  Utilities.swift
//  KeyJam
//
//  Created by Taylor Guidon on 12/12/16.
//  Copyright © 2016 Taylor Guidon. All rights reserved.
//

import UIKit
import SnapKit

class Utilities {
    class func hapticGeneratorForSelection() {
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
    }
    
    class func loadKeysFromDisk() -> [KeyData] {
        // Get the plist path
        guard let path = Bundle.main.path(forResource: "Keys", ofType: "plist"),
            let dictArray = NSArray(contentsOfFile: path) else {
                return []
        }
        
        // Convert the plist into an array of KeyData
        var keys: [KeyData] = []
        for item in dictArray {
            if let dict = item as? NSDictionary {
                let key = dict["key"] as! String
                let notesInKeyString = dict["notesInKey"] as! String
                let highlightedArrayString = dict["highlightedArrayString"] as! String
                let keyData = KeyData(key, notesInKeyString, highlightedArrayString)
                keys.append(keyData)
            }
        }
        return keys
    }
    
    class func getSelectedKeyDataArr(_ selectedKeyArr: [String], _ keyDataArr: [KeyData]) -> [KeyData] {
        // Creates a new array of the selected keys.
        // Loops through the keys selected and sees if they are a subset
        // of the keyDataArr
        var selectecKeyDataArr: [KeyData] = []
        let selectedKeySet = Set(selectedKeyArr)
        
        for keyData in keyDataArr {
            guard let notesInKey = keyData.notesInKey else {
                print("No notes in key")
                return []
            }
            let notesInKeySet = Set(notesInKey)
            
            if selectedKeySet.isSubset(of: notesInKeySet) && selectedKeyArr.count > 0 {
                selectecKeyDataArr.append(keyData)
            }
        }
        return selectecKeyDataArr
    }
    
    class func addEmptyStateToTableView(_ tableView: UITableView, _ errorString: String) {
        // If there are no keys selected or no keys with the given notes
        // show an error state.
        let emptyLabel = UILabel(frame: tableView.frame)
        emptyLabel.text = errorString
        emptyLabel.textAlignment = .center
        emptyLabel.font = UIFont(name: "AvenirNext-Medium", size: 24)
        emptyLabel.textColor = UIColor.lightGray
        emptyLabel.lineBreakMode = .byWordWrapping
        emptyLabel.numberOfLines = 0
        tableView.backgroundView = emptyLabel
        tableView.isScrollEnabled = false
        emptyLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(tableView)
            make.centerX.equalTo(tableView)
            make.left.equalTo(tableView).offset(64)
            make.right.equalTo(tableView).offset(-64)
        }
        tableView.separatorStyle = .none
    }
    
    class func removeEmptyStateFromTableView(_ tableView: UITableView) {
        // Remove the empty view
        tableView.backgroundView = nil
        tableView.isScrollEnabled = true
        tableView.separatorStyle = .singleLine
    }
}
