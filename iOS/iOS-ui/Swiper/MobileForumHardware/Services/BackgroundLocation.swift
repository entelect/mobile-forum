//
//  BackgroundLocation.swift
//  MobileForumHardware
//
//  Created by Armand Kamffer on 2020/05/19.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation
import CoreLocation
import UserNotifications

class BackgroundLocation: NSObject, CLLocationManagerDelegate {
    static let shared = BackgroundLocation()
    private let locationManager = CLLocationManager()
    private let notificationCenter = UNUserNotificationCenter.current()
    private let geoCoder = CLGeocoder()
    
    private override init() {
        super.init()
        configureLocationManager()
        configureNotificationCenter()
    }
    
    private func configureLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestAlwaysAuthorization()
        }
    }
    
    private func configureNotificationCenter() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        notificationCenter.requestAuthorization(options: options) { (didAllow, error) in
            if !didAllow {
                print("User has declined notifications")
            }
        }
    }
    
    func startLocationTracking() {
        locationManager.startMonitoringSignificantLocationChanges()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            geoCoder.reverseGeocodeLocation(location) { (placemark, error) in
                guard let city = placemark?.first?.locality else { return }
                self.scheduleNotification(title: city)
            }
        }
    }
    
    private func scheduleNotification(title: String) {
        let content = UNMutableNotificationContent()
        
        content.title = title
        content.sound = UNNotificationSound.default
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        notificationCenter.add(request, withCompletionHandler: nil)
    }
}
