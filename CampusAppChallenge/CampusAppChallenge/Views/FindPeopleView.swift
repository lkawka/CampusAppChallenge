//
//  FindPeopleView.swift
//  CampusAppChallenge
//
//  Created by Rafał Małczyński on 13.01.2018.
//  Copyright © 2018 Lukasz Kawka. All rights reserved.
//

import UIKit

class FindPeopleView: UITableView {
    let lecturers: [Personable] = [
        Lecturer(firstName: "Adam", secondName: nil, surname: "Abramowicz", title: .mgr),
        Lecturer(firstName: "Zbigniew", secondName: nil, surname: "Stonoga", title: .dr),
        Lecturer(firstName: "Teodor", secondName: "Maciej", surname: "Zacharewicz", title: .prof),
        Lecturer(firstName: "Maciej", secondName: nil, surname: "Mrowiński", title: .dr),
        Lecturer(firstName: "Aleksandra", secondName: "Anna", surname: "Ciołkosz", title: .dr)
    ]

    
}
