//
//  DatesTests.swift
//  DatesTests
//
//  Created by Lajos Deme on 2020. 02. 18..
//  Copyright © 2020. Lajos Deme. All rights reserved.
//

import XCTest
@testable import Dates


class DatesTests: XCTestCase {
    
    var date: Date!
    var dateComponents: DateComponents!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        dateComponents = DateComponents()
        dateComponents.timeZone = TimeZone(abbreviation: "GMT")!
        dateComponents.year = 2020
        dateComponents.month = 2
        dateComponents.day = 17
        dateComponents.hour = 12
        dateComponents.minute = 0
        
        date = Calendar.iso8601.date(from: dateComponents)!
    }
    
    func testDay() {
        
        XCTAssertFalse(date.isWeekend)

        XCTAssertEqual(date.hoursLeftFromDay, 11)
        XCTAssertEqual(date.minutesLeftFromDay, 719)
        XCTAssertEqual(date.secondsLeftFromDay, 43199)

    }
    
    func testWeek() {
        
        let startOfWeek = Calendar.iso8601.date(from: DateComponents(timeZone: TimeZone(abbreviation: "GMT")!, year: 2020, month: 2, day: 17, hour: 0, minute: 0, second: 0))!
        let endOfWeek = Calendar.iso8601.date(from: DateComponents(timeZone: TimeZone(abbreviation: "GMT")!, year: 2020, month: 2, day: 23, hour: 23, minute: 59, second: 59))!
        
        XCTAssertEqual(date.startOfWeek, startOfWeek)
        XCTAssertEqual(date.endOfWeek, endOfWeek)
        
        XCTAssertEqual(date.daysLeftFromWeek, 6)
        XCTAssertEqual(date.hoursLeftFromWeek, 155)
        XCTAssertEqual(date.minutesLeftFromWeek, 9359)
        XCTAssertEqual(date.secondsLeftFromWeek, 561599)
    }
    
    func testMonth() {
        let startOfMonth = Calendar.iso8601.date(from: DateComponents(timeZone: TimeZone(abbreviation: "GMT")!, year: 2020, month: 2, day: 1, hour: 0, minute: 0, second: 0))!
        let endOfMonth = Calendar.iso8601.date(from: DateComponents(timeZone: TimeZone(abbreviation: "GMT")!, year: 2020, month: 2, day: 29, hour: 23, minute: 59, second: 59))!

        XCTAssertEqual(date.startOfMonth, startOfMonth)
        XCTAssertEqual(date.endOfMonth, endOfMonth)
        XCTAssertEqual(date.currentMonth, 2)
        XCTAssertEqual(date.nextMonth, 3)
        XCTAssertEqual(date.lastMonth, 1)
        XCTAssertEqual(date.month(byAdding: 3), 5)
        XCTAssertEqual(date.weeksInMonth, 5)
        XCTAssertEqual(date.daysInMonth, 29)
        XCTAssertEqual(date.hoursInMonth, 695)
        XCTAssertEqual(date.minutesInMonth, 41759)
        XCTAssertEqual(date.secondsInMonth, 2505599)
        XCTAssertEqual(date.weeksInGivenMonth(month: 3), 6)
        XCTAssertEqual(date.daysInGivenMonth(month: 5), 31)
        XCTAssertEqual(date.numberOfGivenDayInMonth(selectedDay: .Saturday), 5)
        XCTAssertEqual(date.workdaysInMonth(), 20)
        XCTAssertEqual(date.weekendDaysInMonth(), 9)
        XCTAssertEqual(date.daysLeftFromMonth, 12)
        XCTAssertEqual(date.hoursLeftFromMonth, 299)
        XCTAssertEqual(date.minutesLeftFromMonth, 17999)
        XCTAssertEqual(date.secondsLeftFromMonth, 1079999)
        
    }
    
    func testYear() {
        let startOfYear = Calendar.iso8601.date(from: DateComponents(timeZone: TimeZone(abbreviation: "GMT")!, year: 2020, month: 1, day: 1, hour: 0, minute: 0, second: 0))!
        let endOfYear = Calendar.iso8601.date(from: DateComponents(timeZone: TimeZone(abbreviation: "GMT")!, year: 2020, month: 12, day: 31, hour: 23, minute: 59, second: 59))!
        
        XCTAssertEqual(date.startOfYear, startOfYear)
        XCTAssertEqual(date.endOfYear, endOfYear)
        XCTAssertEqual(date.currentYear, 2020)
        XCTAssertEqual(date.lastYear, 2019)
        XCTAssertEqual(date.nextYear, 2021)
        XCTAssertEqual(date.year(byAdding: 3), 2023)
        XCTAssertEqual(date.weeksInYear, 53)
        XCTAssertEqual(date.daysInYear, 365)
        XCTAssertEqual(date.hoursInYear, 8783)
        XCTAssertEqual(date.minutesInYear, 527039)
        XCTAssertEqual(date.secondsInYear, 31622399)
        XCTAssertEqual(date.numberOfGivenDayInYear(selectedDay: .Saturday), 52)
        XCTAssertEqual(date.workdaysInYear(), 262)
        XCTAssertEqual(date.weekendDaysInYear(), 104)
        
        
    }
    
    func testHelper() {
        let dates = Dates()
        
        let testDate = Calendar.iso8601.date(from: DateComponents(timeZone: TimeZone(abbreviation: "GMT")!, year: 2023, month: 3, day: 21, hour: 10, minute: 30, second: 0))!
        
        XCTAssertEqual(dates.workdaysBetweenDates(from: date.startOfYear, to: date.endOfYear), 262)
        XCTAssertEqual(dates.weekendDaysBetweenDates(from: date.startOfYear, to: date.endOfYear), 104)
        XCTAssertEqual(date.dateByAdding(year: 3, month: 1, day: 4, hour: -2, minutes: 30), testDate)
        
    }
    
    func testFormat() {
        let time: TimeInterval = 7209
    
        XCTAssertEqual(time.timerFormat(), "02:00:09")

        XCTAssertEqual(date.format(dateStyle: .medium, timeStyle: .full, locale: Locale.current, timeZone: TimeZone(abbreviation: "GMT")!), "Feb 17, 2020 at 12:00:00 PM Greenwich Mean Time")
        XCTAssertEqual(date.format(dateFormat: "E, d MMM yyyy HH:mm:ss Z", locale: Locale(identifier: "en_US"), timeZone: TimeZone(abbreviation: "GMT")!), "Mon, 17 Feb 2020 12:00:00 +0000")
        
    }
    
    func testCompare() {
        XCTAssertTrue(date.isEqual(to: date))
        XCTAssertFalse(date.isEqual(to: date.dateByAdding(month: 2)))
        
        XCTAssertTrue(date.isEariler(than: date.dateByAdding(month: 1)))
        XCTAssertFalse(date.isEariler(than: date.dateByAdding(month: -1)))
        
        XCTAssertTrue(date.isLater(than: date.dateByAdding(month: -1)))
        XCTAssertFalse(date.isLater(than: date.dateByAdding(month: 1)))
        
        XCTAssertEqual(date.distance(to: date.dateByAdding(month: 1), in: .months), 1)
        XCTAssertEqual(date.distance(to: date.dateByAdding(day: 5), in: .days), 5)
    }

}

