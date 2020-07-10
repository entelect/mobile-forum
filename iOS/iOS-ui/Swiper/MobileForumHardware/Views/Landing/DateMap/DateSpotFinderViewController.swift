//
//  DateSpotFinderViewController.swift
//  MobileForumHardware
//
//  Created by Armand Kamffer on 2020/05/05.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import UIKit
import ARCL
import CoreLocation
import ARKit

class DateSpotFinderViewController: UIViewController {
    var sceneLocationView = SceneLocationView()
    var locationManager: CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(sceneLocationView)
        
        configureLocationManager()
        configureDatingLocations()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sceneLocationView.run()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneLocationView.pause()
    }

    override func viewDidLayoutSubviews() {
      super.viewDidLayoutSubviews()
      sceneLocationView.frame = view.bounds
    }

    private func configureLocationManager() {
        locationManager = CLLocationManager()
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest

        // Check for Location Services
        if CLLocationManager.locationServicesEnabled() {
            locationManager?.requestWhenInUseAuthorization()
        }
    }
    
    private func configureDatingLocations() {
        if let userAltitude = locationManager?.location?.altitude {
            for datingSpot in InMemoryDatabase.shared.dateLocations {
                let dateSpotView = DateSpotView.loadFromNib()
                dateSpotView.configure(title: datingSpot.title, description: datingSpot.description, image: UIImage(named: "Heart"))
                let location = CLLocation(coordinate: datingSpot.coordinate, altitude: userAltitude + 6)
                let annotationNode = LocationAnnotationNode(location: location, view: dateSpotView)
                sceneLocationView.addLocationNodeWithConfirmedLocation(locationNode: annotationNode)
            }
        }
    }
}
