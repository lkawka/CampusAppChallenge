//
//  Schedule.swift
//  CampusAppChallenge
//
//  Created by Rafał Małczyński on 13.01.2018.
//  Copyright © 2018 Lukasz Kawka. All rights reserved.
//

import Foundation

struct Schedule {
    var events: [Event] = [
        Event(name: "ANL1",
              start: Date(dateString: "2016-08-12 20:30"),
              end: Date(dateString: "2016-08-12 20:30"),
              room: 213,
              lecturer: "John Bravo",
              type: .lecture),
        Event(name: "ANL1",
              start: Date(dateString: "2016-08-12 20:30"),
              end: Date(dateString: "2016-08-12 20:30"),
              room: 213,
              lecturer: "John Bravo",
              type: .lab)
    ]
}
