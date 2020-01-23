//
//  ViewController.swift
//  Example
//
//  Created by Lajos Deme on 2020. 01. 23..
//  Copyright © 2020. Lajos Deme. All rights reserved.
//

import UIKit
import Dates

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dayExamples()
        
        weekExamples()
        
        monthExamples()
        
        yearExamples()
        
        helperExamples()
        
        formatExamples()
        
        compareExamples()
        
    }

    private func dayExamples() {
        let date = Date().localDate()
        print("local date: \(date)")
        print("start of day: \(date.startOfDay)")
        print("end of day: \(date.endOfDay)")
        print("is weekend: \(date.isWeekend)")
        print("noon: \(date.noon)")
        print("tomorrow: \(date.tomorrow)")
        print("yesterday: \(date.yesterday)")
        print("hours left from day: \(date.hoursLeftFromDay)")
        print("seconds left from day: \(date.secondsLeftFromDay)")
        print("minutes left from day: \(date.minutesLeftFromDay)")
        print("\n")
    }
    
    private func weekExamples() {
        let date = Date().localDate()
        print("start of week: \(date.startOfWeek)")
        print("end of week: \(date.endOfWeek)")
        print("days left from week \(date.daysLeftFromWeek)")
        print("hours left from week \(date.hoursLeftFromWeek)")
        print("minutes left from week \(date.minutesLeftFromWeek)")
        print("seconds left from week \(date.secondsLeftFromWeek)")
        print("\n")
    }
    
    private func monthExamples() {
        let date = Date().localDate()
        print("start of month \(date.startOfMonth)")
        print("end of month \(date.endOfMonth)")
        print("\n")
        print("current month \(date.currentMonth)")
        print("last month \(date.lastMonth)")
        print("next month \(date.nextMonth)")
        print("\n")
        print("weeks in month \(date.weeksInMonth)")
        print("hours in month \(date.hoursInMonth)")
        print("minutes in month \(date.minutesInMonth)")
        print("seconds in month \(date.secondsInMonth)")
        print("\n")
        print("days left from month \(date.daysLeftFromMonth)")
        print("hours left from month \(date.hoursLeftFromMonth)")
        print("minutes left from month \(date.minutesLeftFromMonth)")
        print("seconds left from month \(date.secondsLeftFromMonth)")
        print("\n")
        print("adding 3 months to current: \(date.month(byAdding: 3))")
        print("weeks in given month: \(date.weeksInGivenMonth(month: 2))")
        print("days in given month: \(date.daysInGivenMonth(month: 1))")
        print("number of given day in month \(date.dateByAdding(month: 4).numberOfGivenDayInMonth(selectedDay: 1))")
        print("workdays in month \(date.workdaysInMonth())")
        print("weekend days in month \(date.weekendDaysInMonth())")
        print("\n")
    }
    
    private func yearExamples() {
        let date = Date().localDate()
        print("start of year \(date.startOfYear)")
        print("end of year \(date.endOfYear)")
        print("\n")
        print("current year \(date.currentYear)")
        print("last year \(date.lastYear)")
        print("next year \(date.nextYear)")
        print("\n")
        print("year by adding \(date.year(byAdding: -3))")
        print("\n")
        print("weeks in year \(date.weeksInYear)")
        print("days in year \(date.daysInYear)")
        print("hours in year \(date.hoursInYear)")
        print("minutes in year \(date.minutesInYear)")
        print("seconds in year \(date.secondsInYear)")
        print("\n")
        print("num of given day in year \(date.numberOfGivenDayInYear(selectedDay: 3))")
        print("\n")
        print("workdays in year \(date.workdaysInYear())")
        print("weekend days in year \(date.weekendDaysInYear())")
        print("\n")
    }
    
    private func helperExamples() {
        
        let dates = Dates()
        let date = Date().localDate()

        print("adding 3 months, -2 days and 1 hour to current date: \(date.dateByAdding(month: 3, day: -2, hour: 1))")
        
        print("the number of workdays between now and a date 3 months, -2 days and +1 hours away: \(dates.workdaysBetweenDates(from: date, to: date.dateByAdding(month: 3, day: -2, hour: 1)))")
        
        print("the number of weekends between now and a date 3 months, -2 days and +1 hours away: \(dates.weekendDaysBetweenDates(from: date, to: date.dateByAdding(month: 3, day: -2, hour: 1)))")
        
        print("\n")
    }
    
    func formatExamples() {
        
        let time: TimeInterval = 7209
        
        print(time.timerFormat())
        
        print(Date().format(dateStyle: .full, timeStyle: .medium))
        
        
        print(Date().format(dateStyle: .medium, timeStyle: .full, locale: Locale.current, timeZone: TimeZone.current))
        
        print(Date().format(dateFormat: "E, d MMM yyyy HH:mm:ss Z"))
        
        print(Date().format(dateFormat: "E, d MMM yyyy HH:mm:ss Z", locale: Locale.current, timeZone: TimeZone.current))
        
        print("\n")
    }
    
    func compareExamples() {
        print(Date().isEqual(to: Date().dateByAdding(year: 3, month: 1, day: -10)))
        print(Date().isEariler(than: Date().dateByAdding(year: 3, month: 1, day: -10)))
        print(Date().isLater(than: Date().dateByAdding(year: 3, month: 1, day: -10)))
        
        print("\n")
        
        print("One year one month from now: \(Date().distance(to: Date().dateByAdding(year: 1, month: 1), in: .years)) year away")
        print("One year one month from now: \(Date().distance(to: Date().dateByAdding(year: 1, month: 1), in: .months)) months away")
        print("Adding five days to today: \(Date().distance(to: Date().dateByAdding(day: 5), in: .days)) days from now")
        print("Adding ten hours to current time: \(Date().distance(to: Date().dateByAdding(hour: 10), in: .hours)) hours from now")
        print("Adding ten hours to current time: \(Date().distance(to: Date().dateByAdding(hour: 10), in: .minutes)) minutes from now")
        print("Adding ten hours to current time: \(Date().distance(to: Date().dateByAdding(hour: 10), in: .seconds)) seconds from now")
    }
    

}

