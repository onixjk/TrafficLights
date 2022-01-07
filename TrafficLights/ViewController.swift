//
//  ViewController.swift
//  TrafficLights
//
//  Created by Onix Jkk on 22.12.21.
//

import UIKit

enum CurrentColor {
    case red
    case yellow
    case green
}

class ViewController: UIViewController {
    
    @IBOutlet weak var redColor: UIView!
    @IBOutlet weak var yellowColor: UIView!
    @IBOutlet weak var greenColor: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    
    var currentColor = CurrentColor.red
    private let colorOn: CGFloat = 1
    private let colorOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redColor.alpha = colorOff
        yellowColor.alpha = colorOff
        greenColor.alpha = colorOff
        
        startButton.layer.cornerRadius = 20
    }

    override func viewWillLayoutSubviews() {
        redColor.layer.cornerRadius = redColor.frame.height / 2
        yellowColor.layer.cornerRadius = yellowColor.frame.height / 2
        greenColor.layer.cornerRadius = greenColor.frame.height / 2
    }
    
    @IBAction func startButtonPressed() {
        startButton.setTitle("Next", for: .normal)
        
        switch currentColor {
        case .red:
            greenColor.alpha = colorOff
            redColor.alpha = colorOn
            currentColor = .yellow
        case .yellow:
            redColor.alpha = colorOff
            yellowColor.alpha = colorOn
            currentColor = .green
        case .green:
            yellowColor.alpha = colorOff
            greenColor.alpha = colorOn
            currentColor = .red
        }
    }
}
