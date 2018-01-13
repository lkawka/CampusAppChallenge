//
//  FindMeViewController.swift
//  CampusAppChallenge
//
//  Created by Rafał Małczyński on 13.01.2018.
//  Copyright © 2018 Lukasz Kawka. All rights reserved.
//

import Foundation
import UIKit

class FindMeViewController: UIViewController {
    
    let lecturers: [Lecturer] = [
        Lecturer(firstName: "Adam", secondName: nil, surname: "Abramowicz", title: .mgr),
        Lecturer(firstName: "Zbigniew", secondName: nil, surname: "Stonoga", title: .dr),
        Lecturer(firstName: "Teodor", secondName: "Maciej", surname: "Zacharewicz", title: .prof),
        Lecturer(firstName: "Maciej", secondName: nil, surname: "Mrowiński", title: .dr),
        Lecturer(firstName: "Aleksandra", secondName: "Anna", surname: "Ciołkosz", title: .dr)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
