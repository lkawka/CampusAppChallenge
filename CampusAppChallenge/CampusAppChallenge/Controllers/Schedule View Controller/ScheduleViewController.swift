//
//  ScheduleViewController.swift
//  CampusAppChallenge
//
//  Created by Kornel on 14/01/2018.
//  Copyright © 2018 Lukasz Kawka. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {
    //MARK: - Properties
    
    var lightBlue = UIColor.blue.withAlphaComponent(0.6)
    var blue = UIColor.blue.withAlphaComponent(0.8)
    var darkBlue = UIColor.blue
    
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var firstDayView: UIView!
    @IBOutlet weak var firstDayShadowView: UIView!
    
    @IBOutlet weak var secondDayView: UIView!
    @IBOutlet weak var secondDayShadowView: UIView!
    
    @IBOutlet weak var thirdDayView: UIView!
    @IBOutlet weak var thirdDayShadowView: UIView!
    
    @IBOutlet weak var fourthDayView: UIView!
    @IBOutlet weak var fourthDayShadowView: UIView!
    
    @IBOutlet weak var fifthDayView: UIView!
    @IBOutlet weak var fifthDayShadowView: UIView!
    
    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupHeaderView()
    }

    //MARK: - Setup
    
    private func setupHeaderView() {
        let cornerRadius: CGFloat = 5.0
        
        firstDayView.layer.cornerRadius = cornerRadius
        secondDayView.layer.cornerRadius = cornerRadius
        thirdDayView.layer.cornerRadius = cornerRadius
        fourthDayView.layer.cornerRadius = cornerRadius
        fifthDayView.layer.cornerRadius = cornerRadius
        
        firstDayShadowView.layer.cornerRadius = cornerRadius
        secondDayShadowView.layer.cornerRadius = cornerRadius
        thirdDayShadowView.layer.cornerRadius = cornerRadius
        fourthDayShadowView.layer.cornerRadius = cornerRadius
        fifthDayShadowView.layer.cornerRadius = cornerRadius
        
        firstDayShadowView.backgroundColor = blue
        secondDayShadowView.backgroundColor = lightBlue
        thirdDayShadowView.backgroundColor = lightBlue
        fourthDayShadowView.backgroundColor = lightBlue
        fifthDayShadowView.backgroundColor = lightBlue
        
        firstDayView.backgroundColor = lightBlue
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
