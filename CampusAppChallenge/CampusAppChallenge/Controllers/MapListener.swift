//
//  MapListener.swift
//  CampusAppChallenge
//
//  Created by Lukasz Kawka on 13/01/2018.
//  Copyright © 2018 Lukasz Kawka. All rights reserved.
//

import Foundation
import IndoorwaySdk

class MapListener: IndoorwayMapListener {
    
    func mapChanged(map: IndoorwayMapDescription) {
        print("Map changed to \(map.mapUuid)")
    }
    
}
