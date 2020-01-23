//
//  Compare.swift
//  Dates
//
//  Created by Lajos Deme on 2020. 01. 23..
//  Copyright © 2020. Lajos Deme. All rights reserved.
//

import Foundation

public extension Date {
    
    ///This function takes a Date object as input and compares it with the receiver. Returns true if the two dates are equal.
    ///
    /// Usage:
    ///
    ///     print(Date().isEqual(to: Date().dateByAdding(year: 3, month: 1, day: -10))) // false
    ///
    /// - parameter date: The Date Object that the receiver is compared to.
    ///
    /// - returns: Bool representing whether the two Date objects are equal.
    func isEqual(to date: Date) -> Bool {
        return self.compare(date) == .orderedSame
    }
    
    ///This function takes a Date object as input and compares it with the receiver. Returns true if the receiver is eariler in time than the input.
    ///
    /// Usage:
    ///
    ///     print(Date().isEariler(than: Date().dateByAdding(year: 3, month: 1, day: -10))) // true
    ///
    /// - parameter date: The Date Object that the receiver is compared to.
    ///
    /// - returns: Bool representing whether the receiver is eariler in time than the input.
    func isEariler(than date: Date) -> Bool {
        return self.compare(date) == .orderedAscending
    }
    
    ///This function takes a Date object as input and compares it with the receiver. Returns true if the receiver is later in time than the input.
    ///
    /// Usage:
    ///
    ///     print(Date().isLater(than: Date().dateByAdding(year: 3, month: 1, day: -10))) // false
    ///
    /// - parameter date: The Date Object that the receiver is compared to.
    ///
    /// - returns: Bool representing whether the receiver is later in time than the input.
    func isLater(than date: Date) -> Bool {
        return self.compare(date) == .orderedDescending
    }
    
    ///Returns the distance between two dates in the specifed time frame.
    ///
    /// Usage:
    ///
    ///     print("Adding ten hours to current time: \(Date().distance(to: Date().dateByAdding(hour: 10), in: .minutes)) minutes from now") // Adding ten hours to current time: 600 minutes from now
    ///
    /// - parameter date: A Date object.
    /// - parameter timeFrame: Can be one of five possible cases: seconds, minutes, hours, days, weeks, months, years.
    ///
    /// - returns: An Int representing the distance between the receiver and the input in the specified time frame.
    func distance(to date: Date, in timeFrame: TimeFrame) -> Int {
        let calendar = Calendar.iso8601
        
        switch timeFrame {
        case .seconds:
            let sec = calendar.dateComponents([.second], from: self, to: date)
            return sec.second!
        case .minutes:
            print("")
            let min = calendar.dateComponents([.minute], from: self, to: date)
            return min.minute!
        case .hours:
            let hrs = calendar.dateComponents([.hour], from: self, to: date)
            return hrs.hour!
        case .days:
            let days = calendar.dateComponents([.day], from: self, to: date)
            return days.day!
        case .weeks:
            let weeks = calendar.dateComponents([.weekOfYear], from: self, to: date)
            return weeks.weekOfYear!
        case .months:
            let months = calendar.dateComponents([.month], from: self, to: date)
            return months.month!
        case .years:
            let years = calendar.dateComponents([.year], from: self, to: date)
            return years.year!
        }
        
    }
}

public enum TimeFrame {
    case seconds
    case minutes
    case hours
    case days
    case weeks
    case months
    case years
}
