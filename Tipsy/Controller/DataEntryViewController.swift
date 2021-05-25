//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class DataEntryViewController: UIViewController {

    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var billTotalLabel: UITextField!
    @IBOutlet weak var noTipButton: UIButton!
    @IBOutlet weak var normalPctTipButton: UIButton!
    @IBOutlet weak var generousTipButton: UIButton!

    var splitBrain: SplitBrain = SplitBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    private func updateUI() {
        if let saveBillTotal = splitBrain.billTotal {
            billTotalLabel.text = String(format: "%.2f", saveBillTotal)
        } else {
            billTotalLabel.text = nil
        }

        for button: UIButton in [noTipButton, normalPctTipButton, generousTipButton] {
            button.isSelected = button.tag == splitBrain.tip
        }

        splitLabel.text = "\(splitBrain.splitCount)"
    }

    @IBAction func tipButtonPressed(_ sender: UIButton) {
        splitBrain.tip = sender.tag
        updateUI()
    }

    @IBAction func splitStepper(_ sender: UIStepper) {
        splitBrain.splitCount = Int(sender.value)
        updateUI()
    }

    @IBAction func calculateAndShowResults(_ sender: Any) {
        if billTotalLabel.text == nil {
            NSLog("should show some error here - no text entered")
            splitBrain.billTotal = nil
            return
        }

        let maybeDigit = Float(billTotalLabel.text!)
        if( maybeDigit == nil) {
            NSLog("should show some error here - no valid number entered")
        }

        splitBrain.billTotal = maybeDigit
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            prepareResultView(segue.destination as! ResultViewController)
        } else {
            NSLog("unknown destination segue %@", segue)
        }
    }

    private func prepareResultView(_ resultVC: ResultViewController) {
        resultVC.setResult(splitBrain.getSplitResult())
    }
}

