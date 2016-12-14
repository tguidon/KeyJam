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
    
    class func getSelectedKeyDataArr(_ selectedKeyArr: [String], _ keyDataArr: [KeyData]) -> [KeyData] {
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
        let emptyLabel = UILabel(frame: tableView.frame)
        emptyLabel.text = errorString
        emptyLabel.textAlignment = .center
        emptyLabel.font.withSize(26)
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
        tableView.backgroundView = nil
        tableView.isScrollEnabled = true
        tableView.separatorStyle = .singleLine
    }
}
