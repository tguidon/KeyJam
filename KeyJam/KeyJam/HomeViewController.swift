//
//  HomeViewController.swift
//  KeyJam
//
//  Created by Taylor Guidon on 11/7/16.
//  Copyright © 2016 Taylor Guidon. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var keyView: UIView!
    @IBOutlet weak var whiteKeyView: UIView!
    @IBOutlet weak var blackKeyView: UIView!
    @IBOutlet weak var majorMinorSegmentedControl: UISegmentedControl! {
        didSet {
            majorMinorSegmentedControl.tintColor = KJColors.green()
        }
    }
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cheatSheetButton: UIButton! {
        didSet {
            cheatSheetButton.setTitleColor(KJColors.green(), for: .normal)
            cheatSheetButton.layer.borderWidth = 2.0
            cheatSheetButton.layer.borderColor = KJColors.green().cgColor
            cheatSheetButton.layer.cornerRadius = 5.0
        }
    }
    
    var selectedKeyDictionary = SelectedKeyDictionary
    let keyDataArr = Utilities.loadKeysFromDisk()
    let errorString: String = "There are either no keys for the selected notes or no notes selected. Please try a new combination below."
    var selectedKeyDataArr: [KeyData] = []
    var selectedKeyArr: [String] = []

    
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
        cell.selectionStyle = .none
        
        return cell
    }
    
    @IBAction func keyButtonTapped(_ sender: KeyButton) {
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
        tableView.reloadData()
        
        if selectedKeyDataArr.count == 0 {
            Utilities.addEmptyStateToTableView(tableView, errorString)
        } else {
            Utilities.removeEmptyStateFromTableView(tableView)
        }
    }
    
}
