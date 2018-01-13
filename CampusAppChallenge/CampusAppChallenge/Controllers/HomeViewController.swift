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
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var classNameLabel: UILabel!
    @IBOutlet weak var roomNumberLabel: UILabel!
    @IBOutlet weak var navigateButton: UIButton!
    
    var mapView: IndoorwayMapView!
    
    let mapDescription = IndoorwayMapDescription(buildingUuid: Value.buildingUuid, mapUuid: Value.mapUuidFloor0)
    
    let positionListener = PositionListener()
    let stateListener = StateListener()
    
    var event: Event? {
        didSet {
            if let event = event {
                headerView.isHidden = false
                
                timeLabel.text = event.startTime.timeToString()
                dayLabel.text = event.startTime.dayToString()
                
                classNameLabel.text = event.eventName
                roomNumberLabel.text = " room: \(event.roomNumber) "
                
            } else {
                headerView.isHidden = true
            }
        }
    }
    
    var isNavigating = false {
        didSet {
            if self.isNavigating {
                if let room = Value.room[event!.roomNumber] {
                    positionListener.isNavigating = self.isNavigating
                    positionListener.destination = room
                }
            }
        }
    }
    
    //MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHeaderView()
        setupCenterLocationButton()
        setupMapView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupListeners()
        
        event = Schedule().events[0]
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        unregisterListeners()
    }
    
    //MARK: - Setup
    
    private func setupHeaderView() {
        if let event = event {
            headerView.isHidden = false
            
            
        } else {
            headerView.isHidden = true
        }
        
        roomNumberLabel.layer.backgroundColor = #colorLiteral(red: 0.1820915341, green: 0.1928494871, blue: 0.5732489228, alpha: 1).cgColor
        roomNumberLabel.textColor = UIColor.white
        roomNumberLabel.layer.cornerRadius = 8.0
        
    }
    
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
    
    private func setupListeners() {
        positionListener.mapView = mapView
        IndoorwayLocationSdk.instance().position.onChange.addListener(listener: positionListener)
        
        stateListener.mapView = mapView
        IndoorwayLocationSdk.instance().state.onChange.addListener(listener: stateListener)
    }
    
    //MARK: - Unregistering
    
    private func unregisterListeners() {
        IndoorwayLocationSdk.instance().position.onChange.removeListener(listener: positionListener)
        
        IndoorwayLocationSdk.instance().state.onChange.removeListener(listener: stateListener)
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
        
        //positionListener.shouldPrint = true
    }
    
    @IBAction func navigateButtonTapped(_ sender: Any) {
        print("room: \(event!.roomNumber)")
        
        isNavigating = true
        if let room = Value.room[event!.roomNumber] {
            
            mapView.navigate(toObjectWithId: room)
        }
    }
    
    
}

//MARK: - Indoorway Map Delegate

extension HomeViewController: IndoorwayMapViewDelegate {
    /*func mapViewDidFinishLoadingMap(_ mapView: IndoorwayMapView) {
        print("Map view did finish loading")
    }*/
    func mapViewDidFailLoadingMap(_ mapView: IndoorwayMapView, withError error: Error) {
        print("Map view did fail loading map with error: \(error.localizedDescription)")
    }
    
    /*func mapView(_ mapView: IndoorwayMapView, didSelectIndoorObject indoorObjectInfo: IndoorwayObjectInfo) {
        print("User did select indoor object with identifier: \(indoorObjectInfo.objectId)")
    }
    func mapView(_ mapView: IndoorwayMapView, didDeselectIndoorObject indoorObjectInfo: IndoorwayObjectInfo) {
        print("User did deselect indoor object with identifier: \(indoorObjectInfo.objectId)")
    }*/
    
    func mapView(_ mapView: IndoorwayMapView, didTapLocation location: IndoorwayLatLon) {
        print("User did tap location: \(location.latitude) \(location.longitude)")
    }
    
    func mapView(_ mapView: IndoorwayMapView, didSelectIndoorObject indoorObjectInfo: IndoorwayObjectInfo) {
        //mapView.objec
    }
}

class PositionListener: IndoorwayPositionListener {
    var mapView: IndoorwayMapView?
    //var shouldPrint = false
    var isNavigating = false
    var destination = ""
    
    func positionChanged(position: IndoorwayLocation) {
        /*if shouldPrint {
            print("latitude: \(position.latitude), longitude: \(position.longitude)")
            shouldPrint = false
        }*/
        
        if let mapView = mapView {
            if mapView.loadedMap?.mapUuid != position.mapUuid {
                let mapDescription = IndoorwayMapDescription(buildingUuid: Value.buildingUuid, mapUuid: position.mapUuid!)
                
                mapView.loadMap(with: mapDescription) { [weak self] (completed) in
                    mapView.showsUserLocation = completed // To start displaying location if map is properly loaded
                }
            }
            
            if isNavigating {
                var found = false
                
                for object in mapView.indoorObjects {
                    if object.objectId == destination {
                        mapView.navigate(toObjectWithId: destination)
                        found = true
                    }
                }
                
                if !found {
                    if mapView.loadedMap?.mapUuid == Value.mapUuidFloor0 {
                        mapView.navigate(to: Value.staircase[0])
                    } else if mapView.loadedMap?.mapUuid == Value.mapUuidFloor1 {
                        mapView.navigate(to: Value.staircase[1])
                    } else if  mapView.loadedMap?.mapUuid == Value.mapUuidFloor2 {
                        mapView.navigate(to: Value.staircase[2])
                    }
                }
            }
        }
    }
}

class ProximityEventsListener: IndoorwayLocationDashboardProximityEventsListener {
    
    func didFireProximityEvent(_ event: IndoorwayProximityEvent) {
        
    }
}
