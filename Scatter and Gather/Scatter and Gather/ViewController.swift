//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Christy Hicks on 11/17/19.
//  Copyright © 2019 Knight Night. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var a2Label: UILabel!
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var toggleButton: UIBarButtonItem!
    
    // MARK: - Property
    
    var isScattered = false
    
    // MARK: - View
    override func viewDidLoad() {
        super.viewDidLoad()
        toggleButton.title = "Scatter"
    }
    
    // MARK: - Action
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        isScattered.toggle()
        if isScattered == true {
            scatter(label: lLabel)
            scatter(label: aLabel)
            scatter(label: mLabel)
            scatter(label: bLabel)
            scatter(label: dLabel)
            scatter(label: a2Label)
            UIView.animate(withDuration: 4) {
                self.logoImageView.alpha = 0
            }
            toggleButton.title = "Gather"
        } else {
            gather(label: lLabel)
            gather(label: aLabel)
            gather(label: mLabel)
            gather(label: bLabel)
            gather(label: dLabel)
            gather(label: a2Label)
            UIView.animate(withDuration: 4) {
                self.logoImageView.alpha = 1
            }
            toggleButton.title = "Scatter"
        }
        
    }
    
    // MARK: - Methods
    func scatter(label: UILabel) {
        UIView.animateKeyframes(withDuration: 4.0, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 4.0) {
                label.center = CGPoint(x: CGFloat.random(in: 0...300), y: CGFloat.random(in: 200...700))
            }
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 4) {
                label.transform = CGAffineTransform(rotationAngle: CGFloat.pi/CGFloat.random(in: 1...4))
            }
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 4) {
                label.layer.backgroundColor = .init(srgbRed: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0...1))
            }
        }, completion: nil)
    }
    
    func gather(label: UILabel) {
        UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 2) {
                switch label {
                    case self.lLabel:
                        label.center = CGPoint(x: 50, y: 425)
                    case self.aLabel:
                        label.center = CGPoint(x: 100, y: 425)
                    case self.mLabel:
                        label.center = CGPoint(x: 150, y: 425)
                    case self.bLabel:
                        label.center = CGPoint(x: 200, y: 425)
                    case self.dLabel:
                        label.center = CGPoint(x: 250, y: 425)
                    case self.a2Label:
                        label.center = CGPoint(x: 300, y: 425)
                    default:
                        label.center = self.view.center
                }
                label.transform = .identity
                label.layer.backgroundColor = nil
            }
        }, completion: nil)
    }
}
