//
//  Extensions.swift
//  CampusAppChallenge
//
//  Created by Rafał Małczyński on 13.01.2018.
//  Copyright © 2018 Lukasz Kawka. All rights reserved.
//

import Foundation

extension Date {
    init(dateString: String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale!
        let d = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval: 0, since:d)
    }
    
    func timeToString() -> String {
        let dateformatter = DateFormatter()
        
        dateformatter.dateStyle = .none
        dateformatter.timeStyle = .short
        
        return dateformatter.string(from: self)
    }
    
    func dayToString() -> String {
        let weekday = Calendar.current.component(.weekday, from: self)
        let weekdays = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
        return weekdays[weekday-1]
    }
}
