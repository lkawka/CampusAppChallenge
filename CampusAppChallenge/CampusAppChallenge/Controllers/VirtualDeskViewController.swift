//
//  VirtualDeskViewController.swift
//  CampusAppChallenge
//
//  Created by Lukasz Kawka on 13/01/2018.
//  Copyright © 2018 Lukasz Kawka. All rights reserved.
//

import UIKit
import IndoorwaySdk

class VirtualDeskViewController: UIViewController {
    //MARK: - Properties
    
    /*let visitor = IndoorwayVisitorEntry(name: "John",
                                        email: "john@appleseed.com",
                                        age: nil,
                                        sex: nil,
                                        groupUuid: nil,
                                        sharedLocation: nil)*/
    
    var mapView: IndoorwayMapView!
    
    let mapDescription = IndoorwayMapDescription(buildingUuid: Value.buildingUuid, mapUuid: Value.mapUuidFloor1)
    
    let listener = StateListener()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMap()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        listener.mapView = mapView
        IndoorwayLocationSdk.instance().state.onChange.addListener(listener: listener)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        IndoorwayLocationSdk.instance().state.onChange.removeListener(listener: listener)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Setup
    
    private func setupMap() {
        mapView = IndoorwayMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)
        
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
}

//MARK: - Indoorway Map Delegate

extension VirtualDeskViewController: IndoorwayMapViewDelegate {
    // Map loading
    func mapViewDidFinishLoadingMap(_ mapView: IndoorwayMapView) {
        print("Map view did finish loading")
    }
    func mapViewDidFailLoadingMap(_ mapView: IndoorwayMapView, withError error: Error) {
        print("Map view did fail loading map with error: \(error.localizedDescription)")
    }
    
    func mapView(_ mapView: IndoorwayMapView, didSelectIndoorObject indoorObjectInfo: IndoorwayObjectInfo) {
        print("User did select indoor object with identifier: \(indoorObjectInfo.objectId)")
    }
    func mapView(_ mapView: IndoorwayMapView, didDeselectIndoorObject indoorObjectInfo: IndoorwayObjectInfo) {
        print("User did deselect indoor object with identifier: \(indoorObjectInfo.objectId)")
    }
}

//MARK: - State listener


    

