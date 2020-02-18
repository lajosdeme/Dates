//
//  Format.swift
//  Dates
//
//  Created by Lajos Deme on 2020. 01. 22..
//  Copyright © 2020. Lajos Deme. All rights reserved.
//

import Foundation

public extension TimeInterval {
    
    ///Returns a String representing the given TimeInterval (self) in a format that can be used with a timer
    ///
    /// Usage:
    ///
    ///     let time: TimeInterval = 7209
    ///     print(time.timerFormat()) // 02:00:09
    ///
    /// - returns: A String representing the given TimeInterval (self) in a format that can be used with a timer.
    func timerFormat() -> String {
        let hours = Int(self) / 3600
        let minutes = Int(self) / 60 % 60
        let seconds = Int(self) % 60
        
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
}

public extension Date {
    
    ///Returns a String representing the given date (self) in a format determined by the inputs.
    ///
    /// Usage:
    ///
    ///     print(Date().format(dateStyle: .medium, timeStyle: .full, locale: Locale.current, timeZone: TimeZone.current)) // Jan 22, 2020 at 8:05:32 PM Central European Standard Time
    ///
    /// - parameter dateStyle: The DateFormatter.Style attribute to be applied to the dateStyle.
    /// - parameter timeStyle: The DateFormatter.Style attribute to be applied to the timeStyle.
    /// - parameter locale: The locale to be set as the locale of the date formatter.
    /// - parameter timeZone: The time zone to be set as the time zone of the formatter.
    ///
    /// - returns: A String object representing the given date (self) in a format determined by the inputs.
    func format(dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style, locale: Locale, timeZone: TimeZone) -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = dateStyle
        dateFormatter.timeStyle = timeStyle
        dateFormatter.locale = locale
        dateFormatter.timeZone = timeZone
        
        return dateFormatter.string(from: self)
    }
    
    ///Returns a String representing the given date (self) in a format determined by the inputs.
    ///
    /// Usage:
    ///
    ///     print(Date().format(dateFormat: "E, d MMM yyyy HH:mm:ss Z", locale: Locale.current, timeZone: TimeZone.current)) // Wed, 22 Jan 2020 20:05:32 +0100
    ///
    /// - parameter dateFormat: The string to be set as the date format of the date formatter.
    /// - parameter timeZone: The time zone to be set as the time zone of the date formatter.
    ///
    /// - returns: A String object representing the given date (self) in a format determined by the inputs.
    func format(dateFormat: String, locale: Locale, timeZone: TimeZone) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.locale = locale
        dateFormatter.timeZone = timeZone
        
        return dateFormatter.string(from: self)
    }
    
    
}
