![dates](https://user-images.githubusercontent.com/44027725/72938335-17e68600-3d6b-11ea-824d-be2585507424.png)

Dates is a small Swift library containing useful Date extensions and functions that will speed up your development workflow.

<h2> Features </h2>
<ul>
  <li> Makes your life a lot easier when you have to work with dates. </li>
  <li> Dates is a lightweight library. You can breeze through the files over coffee. </li>
</ul>
    
<h2> Usage </h2>

<h3>Working with days:</h3>

```swift
let date = Date()

date.startOfDay // 2020-01-22 00:00:00
date.endOfDay // 2020-01-22 23:59:59

date.isWeekend // false

date.noon // 2020-01-22 12:00:00

date.tomorrow // 2020-01-23 12:00:00
date.yesterday // 2020-01-21 12:00:00

date.hoursLeftFromDay // 5
date.minutesLeftFromDay // 345
date.secondsLeftFromDay // 20755
```

<h3>Working with weeks:</h3>

```swift
let date = Date()

date.startOfWeek // 2020-01-20 00:00:00
date.endOfWeek // 2020-01-26 23:59:59
date.daysLeftFromWeek // 4
date.hoursLeftFromWeek // 101
date.minutesLeftFromWeek // 6095
date.secondsLeftFromWeek // 365722
```

<h3>Working with months:</h3>

```swift
let date = Date()

date.startOfMonth // 2020-01-01 00:00:00
date.endOfMonth // 2020-01-31 23:59:59

date.currentMonth // 1
date.nextMonth // 2
date.lastMonth // 12

date.month(byAdding: 3) // 4

date.weeksInMonth // 5
date.daysInMonth // 31
date.hoursInMonth // 743
date.minutesInMonth // 44639
date.secondsInMonth // 2678399

date.weeksInGivenMonth(month: 1) // 5
date.daysInGivenMonth(month: 1) // 31

numberOfGivenDayInMonth(selectedDay: 1) // 4

date.workdaysInMonth() // 23
date.weekendDaysInMonth() // 8

date.daysLeftFromMonth() // 9
date.hoursLeftFromMonth() // 220
date.minutesLeftFromMonth() // 44639
date.secondsLeftFromMonth() // 2678399

```

<h3>Working with years:</h3>

```swift
let date = Date()

date.startOfYear // 2020-01-01 00:00:00
date.endOfYear // 2020-12-31 23:59:59

date.currentYear // 2020
date.lastYear // 2019
date.nextYear // 2021

date.year(byAdding: 3) // 2023

date.weeksInYear // 53
date.daysInYear // 366
date.hoursInYear // 8783
date.minutesInYear // 527039
date.secondsInYear // 31622399

date.numberOfGivenDayInYear(selectedDay: 3) // 53

date.workdaysInYear() // 262
date.weekendDaysInYear() // 104

```

<h3>Getting local date:</h3>

Returns the date represented in the user's time zone.
```swift
let date = Date().localDate()
```

<h3>Formatting:</h3>

Creating a string that can be displayed with a timer:
```swift

let time: TimeInterval = 7209
time.timerFormat() // 02:00:09

```

Format dates however you want:

```swift

let date = Date()

date.format(dateStyle: .full, timeStyle: .medium) // Wednesday, January 22, 2020 at 8:05:32 PM

date.format(dateStyle: .medium, timeStyle: .full, locale: Locale.current, timeZone: TimeZone.current) // Jan 22, 2020 at 8:05:32 PM Central European Standard Time

date.format(dateFormat: "E, d MMM yyyy HH:mm:ss Z") // Wed, 22 Jan 2020 20:05:32 +0100

date.format(dateFormat: "E, d MMM yyyy HH:mm:ss Z", locale: Locale.current, timeZone: TimeZone.current) // Wed, 22 Jan 2020 20:05:32 +0100

```

<h3>Modifying:</h3>

```swift
let date = Date()

date.dateByAdding(month: 3, day: -2, hour: 1) // 2020-04-20 20:05:32

```

<h3>Comparing:</h3>

```swift

let date = Date()

date.isEqual(to: date.dateByAdding(year: 3, month: 1, day: -10)) // false

date.isEariler(than: date.dateByAdding(year: 3, month: 1, day: -10)) // true

date.isLater(than: Date().dateByAdding(year: 3, month: 1, day: -10)) // false

```

<h3>Measuring distance between dates:</h3>

```swift
let date = Date()

date.distance(to: date.dateByAdding(hour: 10), in: .minutes) // 600

```

<h3>Other variables and functions:</h3>

To access these you have to create a Dates() object.

```swift

let date = Date()
let dates = Dates()

dates.workdaysBetweenDates(from: date, to: date.dateByAdding(month: 3, day: -2, hour: 1)) // 64

dates.weekendDaysBetweenDates(from: date, to: date.dateByAdding(month: 3, day: -2, hour: 1)) // 26

//Handy variables
dates.hoursInDay // 24
dates.minutesInDay // 1440
dates.secondsInDay // 86400
dates.millisecondsInDay // 86400000

dates.daysInWeek // 7
dates.hoursInWeek // 168
dates.minutesInWeek // 10080
dates.secondsInWeek // 604800

dates.monthsInYear // 12
dates.weeksInYear // 54

```

<h2>Installation</h2>

<h3>CocoaPods</h3>

If you're using CocoaPods, just add this line to your Podfile:

``` podfile
pod 'Dates'
```

Install by running this command in your Terminal:

```
pod install
```

Then import the library where needed:

``` swift
import Dates
```

<h3>Carthage:</h3>

Just add this to your Cartfile:

```
github "lajosdeme/Dates"
```

<h2>Contributing</h2>

If you have comments, complaints or ideas for improvements, feel free to open an issue or a pull request.

<h2>Author and license</h2>

**Lajos Deme Dr.**


 - [lajosdeme.com](https://www.lajosdeme.com)
 - [Twitter](https://twitter.com/@deme_lajos)
 - [Github](https://github.com/lajosdeme)
 
Dates is available under the MIT license. See the LICENSE file for more info.
 
