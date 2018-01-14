//
//  FindMeViewController.swift
//  CampusAppChallenge
//
//  Created by Rafał Małczyński on 13.01.2018.
//  Copyright © 2018 Lukasz Kawka. All rights reserved.
//

import Foundation
import UIKit

class FindMeViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let lecturers: [Lecturer] = [
        Lecturer(firstName: "Adam", secondName: nil, surname: "Abramowicz", title: .mgr),
        Lecturer(firstName: "Zbigniew", secondName: nil, surname: "Stonoga", title: .dr),
        Lecturer(firstName: "Teodor", secondName: "Maciej", surname: "Zacharewicz", title: .prof),
        Lecturer(firstName: "Maciej", secondName: nil, surname: "Mrowiński", title: .dr),
        Lecturer(firstName: "Aleksandra", secondName: "Anna", surname: "Ciołkosz", title: .dr)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 58/255.0, green: 62/255.0, blue: 72/255.0, alpha: 1.0)
        tableView.backgroundColor = UIColor(red: 58/255.0, green: 62/255.0, blue: 72/255.0, alpha: 1.0)
        tableView.backgroundView?.backgroundColor = UIColor(red: 58/255.0, green: 62/255.0, blue: 72/255.0, alpha: 1.0)
        
        let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = .white
        
        tableView.dataSource = self
        searchBar.delegate = self
        
        tableView.sendSubview(toBack: self.view)
        tableView.center.y -= 700
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK:- TableView Functions
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lecturers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "plainCell")!
        
        var title: String = ""
        let firstName: String = lecturers[indexPath.row].firstName
        var secondName: String = ""
        let surname: String = lecturers[indexPath.row].surname
        
        if let second = lecturers[indexPath.row].secondName { secondName = second }
        if let titleT = lecturers[indexPath.row].title?.rawValue { title = titleT }
    
        cell.textLabel?.text = "\(title) \(firstName) \(secondName) \(surname)"
    
        return cell
    }
    
    //MARK:- SearchBar Functions
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
        tableView.center.y += 700
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        tableView.center.y -= 700
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
}
