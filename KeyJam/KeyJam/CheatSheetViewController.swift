//
//  CheatSheetViewController.swift
//  KeyJam
//
//  Created by Taylor Guidon on 12/12/16.
//  Copyright © 2016 Taylor Guidon. All rights reserved.
//

import UIKit

class CheatSheetViewController: UIViewController {
    @IBOutlet weak var closeButton: UIButton! {
        didSet {
            closeButton.setTitleColor(KJColors.green(), for: .normal)
            closeButton.layer.borderWidth = 2.0
            closeButton.layer.borderColor = KJColors.green().cgColor
            closeButton.layer.cornerRadius = 5.0
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeViewController(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
