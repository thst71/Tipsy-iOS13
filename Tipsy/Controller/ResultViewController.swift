//
// Created by Thomas Strauß on 25.05.21.
// Copyright (c) 2021 The App Brewery. All rights reserved.
//

import UIKit


class ResultViewController: UIViewController {

    @IBOutlet weak var totalPerPersonLabel: UILabel!
    @IBOutlet weak var splitSummaryLabel: UILabel!

    let splitSummaryTextTemplate = "Split between %d people, with %d%% tip."

    private var splitResult: SplitResult?

    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }

    func setResult(_ result: SplitResult) {
        splitResult = result
    }

    @IBAction func onRecalculate(_ sender: Any) {
        dismiss(animated: true)
    }

    private func updateUI() {
        let tPPText = String(format: "%.2f", splitResult?.totalPerPerson ?? 0.0)
        totalPerPersonLabel.text = tPPText
        splitSummaryLabel.text = String(format: splitSummaryTextTemplate,
                splitResult?.personCount ?? 0,
                splitResult?.tipAmountPct ?? 0)
    }
}
