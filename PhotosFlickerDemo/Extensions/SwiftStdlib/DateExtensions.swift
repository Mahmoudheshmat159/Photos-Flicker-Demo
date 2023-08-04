//
//  DateExtensions.swift
//  EffaiOS
//
//  Created by apple on 4/24/22.
//  Copyright © 2022 Mahmoud.Heshmat. All rights reserved.
//

import Foundation

extension Date {
    func asFormatting(dateFormat format  : String = "dd/MM/yyyy") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let dateAsString = dateFormatter.string(from: self)
        return dateAsString
    }
    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }
    var endOfDay: Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfDay)!
    }
    var startOfMonth: Date {
        let components = Calendar.current.dateComponents([.year, .month], from: startOfDay)
        return Calendar.current.date(from: components)!
    }
    var endOfMonth: Date {
        var components = DateComponents()
        components.month = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfMonth)!
    }
    var isDateInToday: Bool {
        return Calendar.current.isDateInToday(self)
    }
    var isDateAfterToday: Bool {
        return self > Date()
    }
}

extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}
