//
//  Week.swift
//  Dates
//
//  Created by Lajos Deme on 2020. 01. 22..
//  Copyright © 2020. Lajos Deme. All rights reserved.
//

import Foundation

public extension Date {
    
    ///Returns the first moment of the first day of the current week for the given date (self).
    ///
    ///Usage:
    ///
    ///     print(Date().startOfWeek) // 2020-01-20 00:00:00 +0000
    
    /// - returns: A  Date object representing the first moment of the first day of the current week for the given date (self).
    var startOfWeek: Date {
        var components = Calendar.iso8601.dateComponents([.timeZone, .yearForWeekOfYear, .weekOfYear], from: self)
        components.timeZone = TimeZone(abbreviation: "GMT")
        return Calendar.iso8601.date(from: components)!
    }
    
    ///Returns the last moment of the last day of the current week for the given date (self).
    ///
    ///Usage:
    ///
    ///     print(Date().endOfWeek) // 2020-01-26 23:59:59 +0000
    
    /// - returns: A  Date object representing the first moment of the first day of the current week for the given date (self).
    var endOfWeek: Date {
        var components = DateComponents()
        components.timeZone = TimeZone(abbreviation: "GMT")!
        components.day = 7
        components.second = -1
        return Calendar.iso8601.date(byAdding: components, to: self.startOfWeek)!
    }
    
    ///Returns the number of days left from the current week for the given date (self).
    ///
    ///Usage:
    ///
    ///     print(Date().daysLeftFromWeek) // 4
    
    /// - returns: An Int representing the number of days left from the current week for the given date (self).
    var daysLeftFromWeek: Int {
        let calendar = Calendar.iso8601
        guard let distance = calendar.dateComponents([.day], from: self, to: self.endOfWeek).day else {return 0}
        return distance
    }
    
    ///Returns the number of hours left from the current week for the given date (self).
    ///
    ///Usage:
    ///
    ///     print(Date().hoursLeftFromWeek) // 101
    
    /// - returns: An Int representing the number of hours left from the current week for the given date (self).
    var hoursLeftFromWeek: Int {
        let calendar = Calendar.iso8601
        let d = calendar.dateComponents([.hour], from: self, to: self.endOfWeek)
        return d.hour!
    }
    
    ///Returns the number of minutes left from the current week for the given date (self).
    ///
    ///Usage:
    ///
    ///     print(Date().minutesLeftFromWeek) // 6095
    
    /// - returns: An Int representing the number of minutes left from the current week for the given date (self).
    var minutesLeftFromWeek: Int {
        let calendar = Calendar.iso8601
        let d = calendar.dateComponents([.minute], from: self, to: self.endOfWeek)
        return d.minute!
    }
    
    ///Returns the number of seconds left from the current week for the given date (self).
    ///
    ///Usage:
    ///
    ///     print(Date().secondsLeftFromWeek) // 365722
    ///
    
    /// - returns: An Int representing the number of seconds left from the current week for the given date (self).
    var secondsLeftFromWeek: Int {
        let calendar = Calendar.iso8601
        let d = calendar.dateComponents([.second], from: self, to: self.endOfWeek)
        return d.second!
    }
    
}
