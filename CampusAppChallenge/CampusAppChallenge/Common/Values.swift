//
//  Values.swift
//  CampusAppChallenge
//
//  Created by Lukasz Kawka on 13/01/2018.
//  Copyright © 2018 Lukasz Kawka. All rights reserved.
//

import Foundation
import IndoorwaySdk

class Value {
    static let APIKey = "ac7f4463-07e2-476e-a37a-ec527c165a71"
    
    static let buildingUuid = "CScrSxCVhQg"
    
    static let mapUuidFloor0 = "7-QLYjkafkE"
    static let mapUuidFloor1 = "gVI7XXuBFCQ"
    static let mapUuidFloor2 = "3-_M01M3r5w"
    
    static let room = [103: "gVI7XXuBFCQ_c0b28", 107: "gVI7XXuBFCQ_a18d9", 211: "3-_M01M3r5w_36a38", 212: "3-_M01M3r5w_76b29", 213: "3-_M01M3r5w_fe9c8", 214: "3-_M01M3r5w_c1a68"]
   /* static let staircase = [IndoorwayLocation(latitude: 52.2221069335938, longitude: 21.0069580078125, uncertainty: 0, buildingUuid: Value.buildingUuid, mapUuid: Value.mapUuidFloor0),
                            IndoorwayLocation(latitude: 52.22216796875, longitude: 21.0069713592529, uncertainty: 0, buildingUuid: Value.buildingUuid, mapUuid: Value.mapUuidFloor1),
                            IndoorwayLocation(latitude: 52.2221127567575, longitude: 21.0069877581653, uncertainty: 0, buildingUuid: Value.buildingUuid, mapUuid: Value.mapUuidFloor2)]*/
   // var r = IndoorwayLatLon(latitude: , longitude: )
    
    static let staircase = [IndoorwayLatLon(latitude: 52.2221069335938, longitude: 21.0069580078125),
                            IndoorwayLatLon(latitude: 52.22216796875, longitude: 21.0069713592529),
                            IndoorwayLatLon(latitude: 52.2221127567575, longitude: 21.0069877581653)]
}
