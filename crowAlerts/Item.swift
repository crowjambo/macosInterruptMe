//
//  Item.swift
//  crowAlerts
//
//  Created by Evaldas Paulauskas on 30/01/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
