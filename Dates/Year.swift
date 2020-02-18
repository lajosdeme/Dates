//
//  Year.swift
//  Dates
//
//  Created by Lajos Deme on 2020. 01. 22..
//  Copyright © 2020. Lajos Deme. All rights reserved.
//

import Foundation

public extension Date {
    
    ///Returns the first moment of the first day of the current year for the given date (self).
    ///
    /// Usage:
    ///
    ///     print(Date().startOfYear) // 2020-01-01 00:00:00 +0000
    ///
    /// - returns: A Date object representing the first moment of the first day of the current year for the given date (self).
    var startOfYear: Date {
        let year = Calendar.current.component(.year, from: Date())

        guard let firstDayOfYear = Calendar.iso8601.date(from: DateComponents(calendar: Calendar.iso8601, timeZone: TimeZone(abbreviation: "GMT"), year: year, month: 1, day: 1)) else {return self}
        return firstDayOfYear
    }
    
    ///Returns the last moment of the last day of the current year for the given date (self).
    ///
    /// Usage:
    ///
    ///     print(Date().endOfYear) // 2020-12-31 23:59:59 +0000
    ///
    /// - returns: A Date object representing the last moment of the last day of the current year for the given date (self).
    var endOfYear: Date {
        var components = DateComponents()
        components.timeZone = TimeZone(abbreviation: "GMT")!
        components.year = 1
        components.second = -1
        return Calendar.iso8601.date(byAdding: components, to: self.startOfYear)!
    }
    
    ///Returns the current year for the given date (self).
    ///
    /// Usage:
    ///
    ///     print(Date().currentYear) // 2020
    ///
    /// - returns: An Int representing the current year for the given date (self).
    var currentYear: Int {
        let calendar = Calendar.iso8601
        return calendar.component(.year, from: self)
    }
    
    ///Returns the year preceding the current year for the given date (self).
    ///
    /// Usage:
    ///
    ///     print(Date().lastYear) // 2019
    ///
    /// - returns: An Int representing the year preceding the current year for the given date (self).
    var lastYear: Int {
        let calendar = Calendar.iso8601
        let date = calendar.date(byAdding: .year, value: -1, to: self)!
        return calendar.component(.year, from: date)
    }
    
    ///Returns the year following the current year for the given date (self).
    ///
    /// Usage:
    ///
    ///     print(Date().nextYear) // 2021
    ///
    /// - returns: An Int representing the year following the current year for the given date (self).
    var nextYear: Int {
        let calendar = Calendar.iso8601
        let date = calendar.date(byAdding: .year, value: 1, to: self)!
        return calendar.component(.year, from: date)
    }
    
    /// Adds the number of years specified by the input to the current year for the given date (self) and returns it .
    ///
    /// Usage:
    ///
    ///     print(Date().year(byAdding: 3) // 2023
    ///
    /// - parameter years: The number of years to be added to the current year.
    ///
    /// - returns: An Int calculated by adding the number of years specified by the input to the current year for the given date (self).
    func year(byAdding years: Int) -> Int {
        let calendar = Calendar.iso8601
        let date = calendar.date(byAdding: .year, value: years, to: self)!
        return calendar.component(.year, from: date)
    }
    
    /// Returns the number of weeks in the year for the given date (self).
    ///
    /// Usage:
    ///
    ///     print(Date().weeksInYear) // 53
    ///
    /// - returns: An Int representing the number of weeks in the year for the given date (self).
    var weeksInYear: Int {
        let calendar = Calendar.iso8601
        let year = calendar.component(.year, from: self)
        let date = calendar.date(from: DateComponents(year: year))!
        
        let range = calendar.range(of: .weekOfYear, in: .year, for: date)!
        let numOfWeeks = range.count
        return numOfWeeks
    }
    
    /// Returns the number of days in the year for the given date (self).
    ///
    /// Usage:
    ///
    ///     print(Date().daysInYear) // 365
    ///
    /// - returns: An Int representing the number of days in the year for the given date (self).
    var  daysInYear: Int {
        let calendar = Calendar.iso8601
        let d = calendar.dateComponents([.day], from: self.startOfYear, to: self.endOfYear)
        return d.day!
    }
    
    /// Returns the number of hours in the year for the given date (self).
    ///
    /// Usage:
    ///
    ///     print(Date().hoursInYear) // 8783
    ///
    /// - returns: An Int representing the number of hours in the year for the given date (self).
    var  hoursInYear: Int {
        let calendar = Calendar.iso8601
        let d = calendar.dateComponents([.hour], from: self.startOfYear, to: self.endOfYear)
        return d.hour!
    }
    
    /// Returns the number of minutes in the year for the given date (self).
    ///
    /// Usage:
    ///
    ///     print(Date().minutesInYear) // 527039
    ///
    /// - returns: An Int representing the number of minutes in the year for the given date (self).
    var minutesInYear: Int {
        let calendar = Calendar.iso8601
        let d = calendar.dateComponents([.minute], from: self.startOfYear, to: self.endOfYear)
        return d.minute!
    }
    
    /// Returns the number of seconds in the year for the given date (self).
    ///
    /// Usage:
    ///
    ///     print(Date().secondsInYear) // 31622399
    ///
    /// - returns: An Int representing the number of seconds in the year for the given date (self).
    var secondsInYear: Int {
        let calendar = Calendar.iso8601
        let d = calendar.dateComponents([.second], from: self.startOfYear, to: self.endOfYear)
        return d.second!
    }
    
    ///Returns the number of specified days in the current year for the given date (self).
    ///
    ///
    ///Usage:
    ///
    ///     print(Date().numberOfGivenDayInYear(selectedDay: .Friday)) // 53
    ///
    
    /// - parameter selectedDay: The day which number in the current year for the given date is calculated.
    ///
    /// - returns: An Int representing the number of specified days in the current year for the given date (self).
    
    func numberOfGivenDayInYear(selectedDay: SelectedDay) -> Int {
        var calendar = Calendar.iso8601
        calendar.timeZone = TimeZone(abbreviation: "GMT")!
        let year = calendar.component(.year, from: self)
        
        var dateComponents = DateComponents()
        dateComponents.year = year
        
        var dayToCheck = 0

        switch selectedDay {
        case .Monday:
           dayToCheck = 2
        case .Tuesday:
            dayToCheck = 3
        case .Wednesday:
            dayToCheck = 4
        case .Thursday:
            dayToCheck = 5
        case .Friday:
            dayToCheck = 6
        case .Saturday:
            dayToCheck = 7
        case .Sunday:
            dayToCheck = 1
        }
        
        let numberOfDays = self.daysInYear
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

    
    ///Returns the number of working days in the year for the given date (self).
    ///
    ///Usage:
    ///
    ///     print(Date().workdaysInYear()) // 262
    ///

    /// - returns: An int representing the number of working days in the year for the given date (self).
    func workdaysInYear() -> Int {
        let start = self.startOfYear
        let end = self.endOfYear
        
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
    
    ///Returns the number of weekend days in the year for the given date (self).
    ///
    ///Usage:
    ///
    ///     print(Date().weekendDaysInYear()) // 104
    ///
    
    /// - returns: An int representing the number of weekend days in the year for the given date (self).
    func weekendDaysInYear() -> Int {
        let start = self.startOfYear
        let end = self.endOfYear
        
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
