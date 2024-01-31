//
//  DaySchedule.swift
//  crowAlerts
//
//  Created by Evaldas Paulauskas on 31/01/2024.
//

import Foundation

struct DaySchedule {
    struct Period {
        let name: String
        let timeStart: Date
        let timeEnd: Date
        var startAction: () -> Void
        var endAction: () -> Void
    }
    var periodCollection: [Period]
}
