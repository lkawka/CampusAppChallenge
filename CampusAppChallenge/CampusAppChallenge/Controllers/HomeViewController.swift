//
//  HomeViewController.swift
//  CampusAppChallenge
//
//  Created by Lukasz Kawka on 13/01/2018.
//  Copyright © 2018 Lukasz Kawka. All rights reserved.
//

import UIKit
import IndoorwaySdk

class HomeViewController: UIViewController {
    //MARK: - Properties
    
    @IBOutlet weak var centerLocationButton: UIButton!
    
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var classNameLabel: UILabel!
    @IBOutlet weak var roomNumberLabel: UILabel!
    @IBOutlet weak var navigateButton: UIButton!
    
    var mapView: IndoorwayMapView!
    
    let mapDescription = IndoorwayMapDescription(buildingUuid: Value.buildingUuid, mapUuid: Value.mapUuidFloor0)
    
    let positionListener = PositionListener()
    let stateListener = StateListener()
    
    //MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCenterLocationButton()
        setupMapView()
        
        positionListener.mapView = mapView
        IndoorwayLocationSdk.instance().position.onChange.addListener(listener: positionListener)
        
        stateListener.mapView = mapView
        IndoorwayLocationSdk.instance().state.onChange.addListener(listener: stateListener)
        
    }
    
    //MARK: - Setup
    
    private func setupCenterLocationButton() {
        centerLocationButton.layer.cornerRadius = centerLocationButton.bounds.size.width/2
        
    }
    
    private func setupMapView() {
        mapView = IndoorwayMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)
        view.sendSubview(toBack: mapView)
        
        mapView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        mapView.delegate = self
        mapView.centerAtUserPosition = false
        mapView.rotateWithUserHeading = false
        
        mapView.loadMap(with: mapDescription) { [weak self] (completed) in
            self?.mapView.showsUserLocation = completed // To start displaying location if map is properly loaded
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: - Button actions
    
    @IBAction func centerLocationButtonTapped(_ sender: Any) {
        mapView.centerAtUserPosition = true
        mapView.centerAtUserPosition = false
    }
    
    @IBAction func navigateButtonTapped(_ sender: Any) {
        if let room = Value.room[213] {
            mapView.navigate(toObjectWithId: room)
        }
    }
    
    
}

//MARK: - Indoorway Map Delegate

extension HomeViewController: IndoorwayMapViewDelegate {
    // Map loading
    func mapViewDidFinishLoadingMap(_ mapView: IndoorwayMapView) {
        print("Map view did finish loading")
    }
    func mapViewDidFailLoadingMap(_ mapView: IndoorwayMapView, withError error: Error) {
        print("Map view did fail loading map with error: \(error.localizedDescription)")
    }
    
    /*func mapView(_ mapView: IndoorwayMapView, didSelectIndoorObject indoorObjectInfo: IndoorwayObjectInfo) {
        print("User did select indoor object with identifier: \(indoorObjectInfo.objectId)")
    }
    func mapView(_ mapView: IndoorwayMapView, didDeselectIndoorObject indoorObjectInfo: IndoorwayObjectInfo) {
        print("User did deselect indoor object with identifier: \(indoorObjectInfo.objectId)")
    }*/
}

class PositionListener: IndoorwayPositionListener {
    var mapView: IndoorwayMapView?
    
    func positionChanged(position: IndoorwayLocation) {
        
        //Change map according to the floor you are on
        if let mapView = mapView {
            if mapView.loadedMap?.mapUuid != position.mapUuid {
                let mapDescription = IndoorwayMapDescription(buildingUuid: Value.buildingUuid, mapUuid: position.mapUuid!)
                
                mapView.loadMap(with: mapDescription) { [weak self] (completed) in
                    mapView.showsUserLocation = completed // To start displaying location if map is properly loaded
                }
            }
        }
    }
    
}
