//
//  NewsViewController.swift
//  CampusAppChallenge
//
//  Created by Lukasz Kawka on 14/01/2018.
//  Copyright © 2018 Lukasz Kawka. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var receivedButton: UIButton!
    @IBOutlet weak var sentButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        //setupViews()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    func setupViews() {
//        self.view.addSubview(receivedView)
//        receivedView.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "News1"))
//        self.view.sendSubview(toBack: receivedView)
//        
//        self.view.addSubview(sentView)
//        sentView.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "News2"))
//        sentView.alpha = 0
//        self.view.sendSubview(toBack: sentView)
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
