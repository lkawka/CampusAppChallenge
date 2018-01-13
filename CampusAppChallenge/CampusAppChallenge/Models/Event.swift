//
//  Event.swift
//  CampusAppChallenge
//
//  Created by Rafał Małczyński on 13.01.2018.
//  Copyright © 2018 Lukasz Kawka. All rights reserved.
//

import Foundation

enum EventType {
    case lecture
    case lab
    case tutorial
}

struct Event {
    let eventName: String
    let startTime: Date
    let endTime: Date
    let roomNumber: Int
    let lecturer: String
    let eventType: EventType?
    
    init(name: String, start: Date, end: Date, room: Int, lecturer: String, type: EventType?) {
        self.eventName = name
        self.startTime = start
        self.endTime = end
        self.roomNumber = room
        self.lecturer = lecturer
        
        if let type = type {
            self.eventType = type
        }
    }
}
