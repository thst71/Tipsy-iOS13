//
// Created by Thomas Strauß on 25.05.21.
// Copyright (c) 2021 The App Brewery. All rights reserved.
//

import Foundation

struct SplitBrain {
    var billTotal: Float? = nil
    var tip: Int = 10
    var splitCount: Int = 2

    func getSplitResult() -> SplitResult {
        let totalPerPerson = (billTotal ?? 0.0) * (1.0 + Float(tip) / 100.0) / Float(splitCount)
        return SplitResult(totalPerPerson: totalPerPerson, personCount: splitCount, tipAmountPct: tip)
    }
}
