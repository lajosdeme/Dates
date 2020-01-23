//
//  Helper.swift
//  Dates
//
//  Created by Lajos Deme on 2020. 01. 22..
//  Copyright © 2020. Lajos Deme. All rights reserved.
//

import Foundation

public class Dates {
    
    public init() {}
    
    public let hoursInDay: Int = 24
    public let minutesInDay: Int = 1440
    public let secondsInDay: TimeInterval = 86400
    public let millisecondsInDay: TimeInterval = 86400000
    
    public let daysInWeek: Int = 7
    public let hoursInWeek: Int = 168
    public let minutesInWeek: Int = 10080
    public let secondsInWeek: TimeInterval = 604800
    
    public let monthsInYear: Int = 12
    public let weeksInYear: Int = 54
    
    
    /// Returns the number of working days between the two input dates.
    ///
    /// Usage:
    ///
    ///     let dates = Dates()
    ///     dates.workdaysBetweenDates(from: Date(), to: Date().dateByAdding(month: 3, day: -2, hour: 1)) // 64
    
    /// - parameter start: The Date object from which the counting of working days starts.
    /// - parameter end: The Date object where the counting of working days ends.
    ///
    /// - returns: An Int representing the number of working days between the two input dates.
    public func workdaysBetweenDates(from start: Date, to end: Date) -> Int {
        guard start < end else {return 0}
        var workDays = 0
        var date = start.noon
        repeat {
            if !date.isWeekend {
                workDays += 1
            }
            date = date.tomorrow
        } while date < end
        return workDays
    }
    
    /// Returns the number of weekend days between the two input dates.
    ///
    /// Usage:
    ///
    ///     let dates = Dates()
    ///     dates.weekendDaysBetweenDates(from: Date(), to: Date().dateByAdding(month: 3, day: -2, hour: 1)) // 26
    
    /// - parameter start: The Date object from which the counting of weekend days starts.
    /// - parameter end: The Date object where the counting of weekend days ends.
    ///
    /// - returns: An Int representing the number of weekend days between the two input dates.
    public func weekendDaysBetweenDates(from start: Date, to end: Date) -> Int {
        guard start < end else {return 0}
        var weekends = 0
        var date = start.noon
        repeat {
            if date.isWeekend {
                weekends += 1
            }
            date = date.tomorrow
        } while date < end
        return weekends
    }
}

public extension Date {
    
    /// Returns the current date adjusted for the local time zone of the user.
    ///
    /// Usage:
    ///
    ///     print(Date().localDate()) // 2020-01-22 19:41:16 +0000
    ///
    
    /// - returns: An Int representing the current date adjusted for the local time zone of the user.
    func localDate() -> Date {
        let timeZoneOffset = Double(TimeZone.current.secondsFromGMT(for: self))
        guard let localDate = Calendar.current.date(byAdding: .second, value: Int(timeZoneOffset), to: self) else {return Date()}
        
        return localDate
    }
    
    /// Returns the date (self) modified by the specified components.
    ///
    ///All inputs to this function are voluntary. If no input is specified that the given date (self) will be returned as it is.
    ///
    /// Usage:
    ///
    ///     print(Date().dateByAdding(month: 3, day: -2, hour: 1)) // 2020-04-20 20:05:32 +0000
    ///
    /// - parameter year: The number of years to be added to the date.
    /// - parameter month: The number of months to be added to the date.
    /// - parameter day: The number of days to be added to the date.
    /// - parameter hour: The number of hours to be added to the date.
    /// - parameter minutes: The number of minutes to be added to the date.
    /// - parameter seconds: The number of seconds to be added to the date.
    ///
    /// - returns: A Date object representing the date (self) modified by the specified components.
    
    func dateByAdding(year: Int = 0, month: Int = 0, day: Int = 0, hour: Int = 0, minutes: Int = 0, seconds: Int = 0) -> Date {
        
        let calendar = Calendar.iso8601
        
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.hour = hour
        dateComponents.minute = minutes
        dateComponents.second = seconds
        
        return calendar.date(byAdding: dateComponents, to: self)!
    }
}


