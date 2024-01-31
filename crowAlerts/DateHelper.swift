//
//  DateHelper.swift
//  crowAlerts
//
//  Created by Evaldas Paulauskas on 31/01/2024.
//

import Foundation

struct DateHelper {
    static func getTodayDate(atHour hour: Int, atMinute minute: Int) -> Date {
        return Calendar.current.date(
            bySettingHour: hour,
            minute: minute, 
            second: 0,
            of: Date())!
    }
    static func getDateDifference(dateToCompareTo anotherDate: Date) -> Double {
        let currentDate = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: currentDate, to: anotherDate)

        // in seconds
        let totalSeconds = ((components.year ?? 0) * 31536000) + ((components.month ?? 0) * 2592000) + ((components.day ?? 0) * 86400) + ((components.hour ?? 0) * 3600) + ((components.minute ?? 0) * 60) + (components.second ?? 0)

        return Double(totalSeconds)
    }
}
