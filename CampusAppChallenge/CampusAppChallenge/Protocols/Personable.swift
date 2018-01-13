//
//  Personable.swift
//  CampusAppChallenge
//
//  Created by Rafał Małczyński on 13.01.2018.
//  Copyright © 2018 Lukasz Kawka. All rights reserved.
//

import Foundation

protocol Personable {
    var firstName: String {get}
    var secondName: String? {get}
    var surname: String {get}
}
