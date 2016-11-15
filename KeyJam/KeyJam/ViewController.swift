//
//  ViewController.swift
//  KeyJam
//
//  Created by Taylor Guidon on 11/7/16.
//  Copyright © 2016 Taylor Guidon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var keyView: UIView!
    @IBOutlet weak var whiteKeyView: UIView!
    @IBOutlet weak var blackKeyView: UIView!
    
    var selectedKeyDictionary = SelectedKeyDictionary

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let fullName    = "First Last"
        let fullNameArr = fullName.components(separatedBy: " ")
        
        let name    = fullNameArr[0]
        let surname = fullNameArr[1]
    }
    
    @IBAction func keyButtonTapped(_ sender: KeyButton) {
        guard let key = sender.titleLabel?.text else {
            print("No label")
            return
        }
        
        selectedKeyDictionary[key] = sender.isSelected
    }
    
    
}
