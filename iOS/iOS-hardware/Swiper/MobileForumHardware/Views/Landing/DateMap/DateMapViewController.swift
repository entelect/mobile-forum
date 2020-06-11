//
//  DateMapViewController.swift
//  MobileForumHardware
//
//  Created by Armand Kamffer on 2020/05/05.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import ARCL
import CoreNFC

class DateMapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    private var locationManager: CLLocationManager?
    private var nfcService: NFCReader?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMapView()
        configureLocationManager()
        configureDatingLocations()
    }
    
    private func configureMapView() {
        mapView.showsUserLocation = true
        mapView.delegate = self
        mapView.userTrackingMode = .followWithHeading
    }
    
    private func configureLocationManager() {
        let locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest

        // Check for Location Services
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestWhenInUseAuthorization()
        }

        //Zoom to user location
        if let userLocation = locationManager.location?.coordinate {
            let viewRegion = MKCoordinateRegion(center: userLocation, latitudinalMeters: 200, longitudinalMeters: 200)
            mapView.setRegion(viewRegion, animated: false)
        }

        self.locationManager = locationManager
    }
    
    private func configureDatingLocations() {
        for datingSpot in InMemoryDatabase.shared.dateLocations {
            addPinUsingMKPointAnnotation(with: datingSpot)
        }
    }
    
    @IBAction func scanTagTapped(_ sender: Any) {
        nfcService = NFCReader { (title, message) in
            self.showError(title: title, message: message)
        }
        nfcService?.beginReaderSession()
    }
}

extension DateMapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? MKPointAnnotation else { return nil }

        let identifier = "pin-marker"
        var view: MKAnnotationView

        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }
        view.displayPriority = .required
        return view
    }
    
    private func addPinUsingMKPointAnnotation(with datingSpot: DatingSpot) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = datingSpot.coordinate
        annotation.title = datingSpot.title
        annotation.subtitle = datingSpot.description
        
        DispatchQueue.main.async {
            self.mapView.addAnnotation(annotation)
        }
    }
}
