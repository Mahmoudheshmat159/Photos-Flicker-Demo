//
//  DateExtension.swift
//  FlickerDemo
//
//  Created by apple on 3/24/22.
//  Copyright © 2022 Mahmoud.Heshmat. All rights reserved.
//

import Foundation

extension Date {
    static func current() -> String? {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let dateOrginial = dateFormatter.string(from: date)
        return dateOrginial
    }
    static func currentDate() -> Date? {
        guard let date = Date.current() else {return nil}
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let dateOrginial = dateFormatter.date(from: date)
        return dateOrginial
    }
    static func currentDay() -> String? {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let dateOrginial = dateFormatter.string(from: date)
        return dateOrginial
    }
    func convertToHoursMinutesSeconds (seconds: Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    func convertToHoursMinutesSeconds (firstTimeStamp: Int, secondTimeStamp: Int) -> (Int, Int, Int) {
        let seconds = firstTimeStamp - secondTimeStamp
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
}

