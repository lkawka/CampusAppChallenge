//
//  Lecturer.swift
//  CampusAppChallenge
//
//  Created by Rafał Małczyński on 13.01.2018.
//  Copyright © 2018 Lukasz Kawka. All rights reserved.
//

import Foundation

enum TitleType: String {
    case inż = "inż"
    case mgr = "mgr"
    case dr = "dr"
    case prof = "prof"
}

struct Lecturer: Personable {
    let firstName: String
    var secondName: String? = nil
    let surname: String
    
    var title: TitleType? = nil
    
    var fullName: String
    
    init(firstName: String, secondName: String?, surname: String, title: TitleType?) {
        self.firstName = firstName
        self.surname = surname
        
        if let second = secondName, let titleTp = title {
            self.secondName = second
            self.title = titleTp
            
            fullName = "\(firstName) \(second) \(surname)"
        } else {
            fullName = "\(firstName) \(surname)"
        }
    }
}
