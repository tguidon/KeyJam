//
//  HomeViewController.swift
//  KeyJam
//
//  Created by Taylor Guidon on 11/7/16.
//  Copyright © 2016 Taylor Guidon. All rights reserved.
//

import UIKit
import EasyAnimation

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var keyView: UIView!
    @IBOutlet weak var whiteKeyView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var keyButtonCollection: [KeyButton]!
    
    var selectedKeyDictionary = SelectedKeyDictionary
    let keyDataArr = Utilities.loadKeysFromDisk()
    let errorString: String = "There are either no keys for the selected notes or no notes selected. Please try a new combination below."
    var selectedKeyDataArr: [KeyData] = []
    var selectedKeyArr: [String] = []
    var allKeysSelected: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        
        if selectedKeyDataArr.count == 0 {
            Utilities.addEmptyStateToTableView(tableView, errorString)
        } else {
            Utilities.removeEmptyStateFromTableView(tableView)
        }
    }
    
    // MARK: - UITableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedKeyDataArr.count
    }

    // MARK: - UITableView Delegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let keyData = selectedKeyDataArr[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "KeyCell", for: indexPath) as! KeyTableViewCell
        cell.keyLabel.text = keyData.key
        cell.notesInKeyLabel.text = keyData.notesInKeyString
        cell.pianoView.visibleStatus = keyData.highlightKeysBoolArray
        // Make the tableview separator full width
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    @IBAction func keyButtonTapped(_ sender: KeyButton) {
        Utilities.hapticGeneratorForSelection()
        // Animate the button
        UIView.animateAndChain(withDuration: 0.1, delay: 0.0, options: [.allowUserInteraction, .curveEaseInOut], animations: {
            sender.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
        }, completion: nil).animate(withDuration: 0.05) {
            sender.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
        
        // After a note is selected update the selected key dict
        // and then make a new KeyData array based on what is 
        // selected.
        guard let key = sender.titleLabel?.text else {
            print("No label")
            return
        }
        selectedKeyDictionary[key] = sender.isSelected
        for (key, selected) in selectedKeyDictionary {
            if selected {
                if !selectedKeyArr.contains(key) {
                    selectedKeyArr.append(key)
                }
            } else {
                if selectedKeyArr.contains(key) {
                    selectedKeyArr = selectedKeyArr.filter { $0 != key }
                }
            }
        }
        selectedKeyDataArr = Utilities.getSelectedKeyDataArr(selectedKeyArr, keyDataArr)
        reloadScreen()
    }
    
    func reloadScreen() {
        tableView.reloadData()
        
        if selectedKeyDataArr.count == 0 {
            Utilities.addEmptyStateToTableView(tableView, errorString)
        } else {
            Utilities.removeEmptyStateFromTableView(tableView)
        }
    }
}
