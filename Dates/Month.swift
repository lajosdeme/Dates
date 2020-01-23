//
//  Month.swift
//  Dates
//
//  Created by Lajos Deme on 2020. 01. 22..
//  Copyright © 2020. Lajos Deme. All rights reserved.
//

import Foundation

public extension Date {
    
    ///Returns the first moment of the first day of the current month for the given date (self).
    ///
    /// Usage:
    ///
    ///     print(Date().startOfMonth) // 2020-01-01 00:00:00 +0000
    ///
    /// - returns: A Date object representing the first moment of the first day of the current month for the given date (self).
    var startOfMonth: Date {
        var components = Calendar.iso8601.dateComponents([.timeZone, .year, .month], from: Calendar.current.startOfDay(for: self))
        components.timeZone = TimeZone(abbreviation: "GMT")
        return Calendar.iso8601.date(from: components)!
    }
    
    ///Returns the last moment of the last day of the current month for the given date (self).
    ///
    /// Usage:
    ///
    ///     print(Date().endOfMonth) // 2020-01-31 23:59:59 +0000
    ///
    /// - returns: A Date object representing the last moment of the last day of the current month for the given date (self).
    var endOfMonth: Date {
        var components = DateComponents()
        components.timeZone = TimeZone(abbreviation: "GMT")!
        components.month = 1
        components.second = -1
        return Calendar.iso8601.date(byAdding: components, to: self.startOfMonth)!
    }
    
    ///Returns the current month as a number for the given date (self).
    ///
    /// Usage:
    ///
    ///     print(Date().currentMonth) // 1
    ///
    /// - returns: An Int representing the current month as a number for the given date (self).
    var currentMonth: Int {
        let calendar = Calendar.iso8601
        return calendar.component(.month, from: self)
    }
    
    ///Returns the month following the current month as a number for the given date (self).
    ///
    /// Usage:
    ///
    ///     print(Date().nextMonth) // 2
    ///
    /// - returns: An Int representing the month following the current month as a number for the given date (self).
    var nextMonth: Int {
        let calendar = Calendar.iso8601
        let date = calendar.date(byAdding: .month, value: 1, to: self)!
        return calendar.component(.month, from: date)
    }
    
    ///Returns the month preceding the current month as a number for the given date (self).
    ///
    /// Usage:
    ///
    ///     print(Date().lastMonth) // 12
    ///
    /// - returns: An Int representing the month preceding the current month as a number for the given date (self).
    var lastMonth: Int {
        let calendar = Calendar.iso8601
        let date = calendar.date(byAdding: .month, value: -1, to: self)!
        return calendar.component(.month, from: date)
    }
    
    /// Adds the number of months specified by the input to the number of the current month for the given date (self) and returns it .
    ///
    /// Usage:
    ///
    ///     print(Date().month(byAdding: 3) // 4
    ///
    /// - parameter months: The number of months to be added to the current month.
    ///
    /// - returns: An Int calculated by adding the number of months specified by the input to the number of the current month for the given date (self).
    func month(byAdding months: Int) -> Int {
        let calendar = Calendar.iso8601
        let date = calendar.date(byAdding: .month, value: months, to: self)!
        return calendar.component(.month, from: date)
    }
    
    ///Returns the number of weeks in the current month for the given date (self).
    ///
    ///Usage:
    ///
    ///     print(Date().weeksInMonth) // 5
    ///
    
    /// - returns: An Int representing the number of weeks in the current month for the given date (self).
    var weeksInMonth: Int {
        let calendar = Calendar.iso8601
        let weekRange = calendar.range(of: .weekOfMonth, in: .month, for: self)!
        return weekRange.count
    }
    
    ///Returns the number of days in the current month for the given date (self).
    ///
    ///Usage:
    ///
    ///     print(Date().daysInMonth) // 31
    ///
    
    /// - returns: An Int representing the number of days in the current month for the given date (self).
    var daysInMonth: Int {
        let calendar = Calendar.iso8601
        let dayRange = calendar.range(of: .day, in: .month, for: self)!
        return dayRange.count
    }
    
    ///Returns the number of hours in the current month for the given date (self).
    ///
    ///Usage:
    ///
    ///     print(Date().hoursInMonth) // 743
    ///
    
    /// - returns: An Int representing the number of hours in the current month for the given date (self).
    var hoursInMonth: Int {
        let calendar = Calendar.iso8601
        let d = calendar.dateComponents([.hour], from: self.startOfMonth, to: self.endOfMonth)
        return d.hour!
    }
    
    ///Returns the number of minutes in the current month for the given date (self).
    ///
    ///Usage:
    ///
    ///     print(Date().minutesInMonth) // 44639
    ///

    /// - returns: An Int representing the number of minutes in the current month for the given date (self).
    var minutesInMonth: Int {
        let calendar = Calendar.iso8601
        let d = calendar.dateComponents([.minute], from: self.startOfMonth, to: self.endOfMonth)
        return d.minute!
    }
    
    ///Returns the number of seconds in the current month for the given date (self).
    ///
    ///Usage:
    ///
    ///     print(Date().secondsInMonth) // 2678399
    ///

    /// - returns: An Int representing the number of seconds in the current month for the given date (self).
    var secondsInMonth: Int {
        let calendar = Calendar.iso8601
        let d = calendar.dateComponents([.second], from: self.startOfMonth, to: self.endOfMonth)
        return d.second!
    }
    
    ///Returns the number of weeks in the month specified by the input for the given date (self).
    ///
    ///Usage:
    ///
    ///     print(Date().weeksInGivenMonth(month: 1)) // 5
    ///
    
    /// - parameter month: The month for which the number of weeks is returned.
    ///
    /// - returns: An Int representing the number of weeks in the month specified by the input for the given date (self).
    func weeksInGivenMonth(month: Int) -> Int {
        let calendar = Calendar.iso8601
        let year = calendar.component(.year, from: self)
        let date = calendar.date(from: DateComponents(year: year, month: month))!
        
        let range = calendar.range(of: .weekOfMonth, in: .month, for: date)!
        let numOfWeeks = range.count
        return numOfWeeks
    }
    
    ///Returns the number of days in the month specified by the input for the given date (self).
    ///
    ///Usage:
    ///
    ///     print(Date().daysInGivenMonth(month: 1)) // 31
    ///
    
    /// - parameter month: The month for which the number of days is returned.
    ///
    /// - returns: An Int representing the number of days in the month specified by the input for the given date (self).
    func daysInGivenMonth(month: Int) -> Int {
        let calendar = Calendar.iso8601
        let year = calendar.component(.year, from: self)
        let date = calendar.date(from: DateComponents(year: year, month: month))!
        
        let range = calendar.range(of: .day, in: .month, for: date)!
        let numOfDays = range.count
        return numOfDays
    }
    
    ///Returns the number of specified days in the current month for the given date (self).
    ///
    /// - Warning: This function does not follow the Gregorian Calendar. Within this function Sunday is represented by 7.
    ///
    ///Usage:
    ///
    ///     print(Date().numberOfGivenDayInMonth(selectedDay: 1)) // 4
    ///
    
    /// - parameter selectedDay: The day which number in the current month for the given date is calculated.
    ///
    /// - returns: An Int representing the number of specified days in the current month for the given date (self).
    
    func numberOfGivenDayInMonth(selectedDay: Int) -> Int {
        var calendar = Calendar.iso8601
        calendar.timeZone = TimeZone(abbreviation: "GMT")!
        let year = calendar.component(.year, from: self)
        let month = calendar.component(.month, from: self)
        
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        
        var dayToCheck = 0
        if selectedDay < 7 {
           dayToCheck = selectedDay + 1
        }
        if selectedDay == 7 {
            dayToCheck = 1
        }
        
        let numberOfDays = self.daysInMonth
        var numOfGivenDay = 0
        
        for day in 1...numberOfDays {
            dateComponents.day = day
            let date = calendar.date(from: dateComponents)!
            let weekday = calendar.component(.weekday, from: date)
            
            if dayToCheck == weekday {
                numOfGivenDay += 1
            }
        }
        return numOfGivenDay
    }
    
    ///Returns the number of working days in the current month for the given date (self).
    ///
    /// Usage:
    ///
    ///     print(Date().workdaysInMonth()) // 23
    ///
    /// - returns: An Int representing the number of working days in the current month for the given date (self).
    func workdaysInMonth() -> Int {
        let start = self.startOfMonth
        let end = self.endOfMonth
        
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
    
    ///Returns the number of weekend days in the current month for the given date (self).
    ///
    /// Usage:
    ///
    ///     print(Date().weekendDaysInMonth()) // 8
    ///
    /// - returns: An Int representing the number of weekend days in the current month for the given date (self).
    func weekendDaysInMonth() -> Int {
        let start = self.startOfMonth
        let end = self.endOfMonth
        
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
    
    ///Returns the number of full days remaining from the month for the given date (self).
    ///
    /// Usage:
    ///
    ///     print(Date().daysLeftFromMonth()) // 9
    ///
    /// - returns: An Int representing the number of  days remaining from the month for the given date (self).
    var daysLeftFromMonth: Int {
        let calendar = Calendar.iso8601
        let d = calendar.dateComponents([.day], from: self, to: self.endOfMonth)
        return d.day!
    }
    
    ///Returns the number of full hours remaining from the month for the given date (self).
    ///
    /// Usage:
    ///
    ///     print(Date().hoursLeftFromMonth()) // 220
    ///
    /// - returns: An Int representing the number of  hours remaining from the month for the given date (self).
    var hoursLeftFromMonth: Int {
        let calendar = Calendar.iso8601
        let d = calendar.dateComponents([.hour], from: self, to: self.endOfMonth)
        return d.hour!
    }
    
    ///Returns the number of minutes remaining from the month for the given date (self).
    ///
    /// Usage:
    ///
    ///     print(Date().minutesLeftFromMonth()) // 44639
    ///
    /// - returns: An Int representing the number of  minutes remaining from the month for the given date (self).
    var minutesLeftFromMonth: Int {
        let calendar = Calendar.iso8601
        let d = calendar.dateComponents([.minute], from: self, to: self.endOfMonth)
        return d.minute!
    }
    
    ///Returns the number of seconds remaining from the month for the given date (self).
    ///
    /// Usage:
    ///
    ///     print(Date().secondsLeftFromMonth()) // 2678399
    ///
    /// - returns: An Int representing the number of  seconds remaining from the month for the given date (self).
    var secondsLeftFromMonth: Int {
        let calendar = Calendar.iso8601
        let d = calendar.dateComponents([.second], from: self, to: self.endOfMonth)
        return d.second!
    }
    
}
