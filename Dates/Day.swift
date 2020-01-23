//
//  Day.swift
//  Dates
//
//  Created by Lajos Deme on 2020. 01. 22..
//  Copyright © 2020. Lajos Deme. All rights reserved.
//

import Foundation

//Methods for getting values related to days

public extension Date {
    
    ///Returns the first second of the day for the given date (self).
    ///
    ///Usage:
    ///
    ///     print(Date().startOfDay) //2020-01-22 00:00:00 +0000
    ///
    
    /// - returns: A Date object representing the first seconds of the day.
    
    var startOfDay: Date {
        var calendar = Calendar.iso8601
        calendar.timeZone = TimeZone(abbreviation: "GMT")!
        return calendar.startOfDay(for: self)
    }
    
    
    ///Returns the last second of the day for the given date (self).
    ///
    ///Usage:
    ///
    ///     print(Date().endOfDay) //2020-01-22 23:59:59 +0000
    ///
    
    /// - returns: A Date object representing the last second of the day.
    
    var endOfDay: Date {
        var components = DateComponents()
        components.timeZone = TimeZone(abbreviation: "GMT")!
        components.day = 1
        components.second = -1
        return Calendar.iso8601.date(byAdding: components, to: startOfDay)!
    }
    
    ///Returns true if the given date (self) is a weekend day
    ///
    ///Usage:
    ///
    ///     print(Date().isWeekend) //false
    ///
    
    /// - Returns: Bool representing whether the given date (self) is a weekend day
    
    var isWeekend: Bool {
        return Calendar.iso8601.isDateInWeekend(self)
    }
    
    ///Returns the given date (self) with the hour component set to 12, the minute and second components both set to 0.
    ///
    ///Usage:
    ///
    ///     print(Date().noon) // 2020-01-22 12:00:00 +0000
    ///
    
    /// - returns: A Date Object with the hour component set to 12.
    var noon: Date {
        let calendar = Calendar.iso8601
        return calendar.date(byAdding: .hour, value: 12, to: self.startOfDay)!
    }
    
    ///Returns the date one day after the given date (self).
    ///
    ///Usage:
    ///
    ///     print(Date().tomorrow) // 2020-01-23 12:00:00 +0000
    ///
    
    /// - returns: A Date object representing the date one day after the given date (self).
    var tomorrow: Date {
        return Calendar.iso8601.date(byAdding: .day, value: 1, to: noon)!
    }
    
    
    ///Returns the date one day before the given date (self).
    ///
    ///Usage:
    ///
    ///     print(Date().yesterday) // 2020-01-21 12:00:00 +0000
    ///
    
    /// - returns: A Date object representing the date one day before the given date (self).
    var yesterday: Date {
        return Calendar.iso8601.date(byAdding: .day, value: -1, to: noon)!
    }
    
    ///Returns the number of full hours left from the day for the given date (self).
    ///
    ///Usage:
    ///
    ///     print(Date().hoursLeftFromDay) // 5
    ///
    
    /// - returns: An Int representing the number of full hours left from the day for the given date (self)
    var hoursLeftFromDay: Int {
        let calendar = Calendar.iso8601
        let d = calendar.dateComponents([.hour], from: self, to: self.endOfDay)
        return d.hour!
    }
    
    ///Returns the number of full minutes left from the day for the given date (self).
    ///
    ///Usage:
    ///
    ///     print(Date().minutesLeftFromDay) // 345
    ///
    
    /// - returns: An Int representing the number of full minutes left from the day for the given date (self).
    var minutesLeftFromDay: Int {
        let calendar = Calendar.iso8601
        let d = calendar.dateComponents([.minute], from: self, to: self.endOfDay)
        return d.minute!
    }
    
    //Returns the number of seconds left from the day for the date (self)
    //Example: Date().secondsLeftFromDay -> 28799
    
    ///Returns the number of seconds left from the day for the date (self).
    ///
    ///Usage:
    ///
    ///     print(Date().secondsLeftFromDay) // 20755
    ///
    
    /// - returns: An Int representing the number of seconds left from the day for the date (self).
    var secondsLeftFromDay: Int {
        let calendar = Calendar.iso8601
        let d = calendar.dateComponents([.second], from: self, to: self.endOfDay)
        return d.second!
    }
    
}

extension Calendar {
    static let iso8601 = Calendar(identifier: .iso8601)
}
