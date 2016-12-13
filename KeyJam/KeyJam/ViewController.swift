//
//  ViewController.swift
//  KeyJam
//
//  Created by Taylor Guidon on 11/7/16.
//  Copyright © 2016 Taylor Guidon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var keyView: UIView!
    @IBOutlet weak var whiteKeyView: UIView!
    @IBOutlet weak var blackKeyView: UIView!
    @IBOutlet weak var majorMinorSegmentedControl: UISegmentedControl! {
        didSet {
            majorMinorSegmentedControl.tintColor = KJColors.green()
        }
    }
    @IBOutlet weak var tableView: UITableView!
    
    var selectedKeyDictionary = SelectedKeyDictionary
    let keyDataArr = Utilities.loadKeysFromDisk()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
    }
    
    // MARK: - UITableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return keyDataArr.count
    }

    // MARK: - UITableView Delegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let keyData = keyDataArr[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "KeyCell", for: indexPath) as! KeyTableViewCell
        cell.keyLabel.text = keyData.key
        cell.notesInKeyLabel.text = keyData.notesInKeyString
        
        return cell
    }
    
    @IBAction func keyButtonTapped(_ sender: KeyButton) {
        guard let key = sender.titleLabel?.text else {
            print("No label")
            return
        }
        
        selectedKeyDictionary[key] = sender.isSelected
        print(selectedKeyDictionary)
    }
    
}
