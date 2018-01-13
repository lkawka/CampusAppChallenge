//
//  StateListener.swift
//  CampusAppChallenge
//
//  Created by Lukasz Kawka on 13/01/2018.
//  Copyright © 2018 Lukasz Kawka. All rights reserved.
//

import Foundation
import UIKit
import IndoorwaySdk

class StateListener: IndoorwayStateListener {
    var mapView: IndoorwayMapView?
    
    func stateChanged(state: IndoorwayLocationState) {
        switch  state {
        case .starting:
            print("Starting")
        case .determiningLocation:
            print("Determinig location")
        case .locatingBackground:
            print("Locating BackGround")
        case .locatingForeground:
            print("Locating Foregrand")
        case .stopped:
            print("Stopped")
        case .error:
            print("Error")
        default:
            print("Other action")
        }
    }
}


