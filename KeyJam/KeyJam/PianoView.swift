//
//  Piano.swift
//  Piano
//
//  Created by Thomas Degry on 12/13/16.
//  Copyright © 2016 Thomas Degry. All rights reserved.
//

import UIKit
import SnapKit

enum PianoKey {
    case White
    case Black
}

class PianoView: UIView {
    // Two scales of a piano
    let Keys: [PianoKey] = [.White, .Black, .White, .Black, .White, .White, .Black, .White, .Black, .White, .Black, .White, .White, .Black, .White, .Black, .White, .White, .Black, .White, .Black, .White, .Black, .White]
    var greenDots = [UIView]()
    var blackKeys = [UIView]()
    
    // If the note is in the key show the green dot
    var visibleStatus = [Bool]() {
        didSet {
            for (index, bool) in visibleStatus.enumerated() {
                if let dot = greenDots[safe: index] {
                    dot.isHidden = !bool
                }
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // setup the view
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
        self.backgroundColor = UIColor(white: 0.75, alpha: 1)
        
        createPiano()
    }
    
    func createPiano() {
        let numberOfWhiteKeys = Keys.filter { $0 == .White }.count
        
        var previousWhiteKey: UIView? = nil
        for key in Keys {
            let v = UIView()
            v.translatesAutoresizingMaskIntoConstraints = false
            v.backgroundColor = key == .White ? .white : .black
            
            // Add the view to the view hiarchy
            addSubview(v)
            
            // setup constraints
            if key == .White {
                v.layer.borderColor = self.backgroundColor?.cgColor
                v.layer.borderWidth = 1
                
                // Create the view and make it the width of 1 / numWhiteKeys
                v.snp.makeConstraints({ (make) in
                    make.height.equalTo(self.snp.height)
                    make.top.equalTo(0)
                    make.width.equalTo(self.snp.width).multipliedBy(Double(1) / Double(numberOfWhiteKeys))
                    
                    if let p = previousWhiteKey {
                        make.left.equalTo(p.snp.right)
                    } else {
                        make.left.equalTo(0)
                    }
                })
                
                addGreenDot(toView: v)
                
                // store state
                previousWhiteKey = v
            } else {
                v.snp.makeConstraints({ (make) in
                    make.height.equalTo(self.snp.height).multipliedBy(0.65)
                    make.width.equalTo(20)
                    make.top.equalTo(0)
                    
                    if let p = previousWhiteKey {
                        make.left.equalTo(p.snp.right).offset(-10)
                    }
                })
                
                addGreenDot(toView: v)
                
                // Store black keys in array just because we need to bring them to the front below
                blackKeys.append(v)
            }
        }
       
        // Bring black keys and green dots to front above white keys
        for key in blackKeys {
            self.bringSubview(toFront: key)
        }
        for dot in greenDots {
            self.bringSubview(toFront: dot)
        }
    }
    
    func addGreenDot(toView: UIView) {
        // Add green dot
        let greenDot = UIView()
        greenDot.backgroundColor = .green
        greenDot.translatesAutoresizingMaskIntoConstraints = false
        greenDot.layer.cornerRadius = 5
        self.insertSubview(greenDot, aboveSubview: toView)
        
        greenDot.snp.makeConstraints({ (make) in
            make.width.equalTo(10)
            make.height.equalTo(10)
            make.centerX.equalTo(toView.snp.centerX)
            make.top.equalTo(toView.snp.bottom).offset(-20)
        })
        
        greenDots.append(greenDot)
    }

}

extension Collection where Indices.Iterator.Element == Index {
    subscript (safe index: Index) -> Generator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
