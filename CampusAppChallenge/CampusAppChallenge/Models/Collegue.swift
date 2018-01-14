//
//  Collegue.swift
//  CampusAppChallenge
//
//  Created by Rafał Małczyński on 13.01.2018.
//  Copyright © 2018 Lukasz Kawka. All rights reserved.
//

import Foundation

struct Collegue: Personable {
    let firstName: String
    var secondName: String? = nil
    let surname: String
    
    init(first: String, second: String?, surname: String) {
        self.firstName = first
        self.surname = surname
        
        if let secondName = second {
            self.secondName = secondName
        }
    }
}
