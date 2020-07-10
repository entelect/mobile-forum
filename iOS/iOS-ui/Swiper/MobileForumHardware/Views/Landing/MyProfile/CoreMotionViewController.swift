//
//  CoreMotionViewController.swift
//  MobileForumHardware
//
//  Created by Armand Kamffer on 2020/05/19.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import UIKit
import CoreMotion

class CoreMotionViewController: UIViewController {
    @IBOutlet weak var acceleroMeterLabel: UILabel!
    @IBOutlet weak var gyroMeterLabel: UILabel!
    @IBOutlet weak var magnetoMeterLabel: UILabel!
    @IBOutlet weak var deviceMotionLabel: UILabel!
    
    var motionManager: CMMotionManager = CMMotionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCoreMotion()
    }
    
    func configureCoreMotion() {
        motionManager.showsDeviceMovementDisplay = true
        
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 0.1
            motionManager.startAccelerometerUpdates(to: OperationQueue.main) { (data, error) in
                guard let accelarion = data?.acceleration else {
                    self.acceleroMeterLabel.text = error?.localizedDescription ?? "Accelerometer error"
                    return
                }
                // 1.0 representing an acceleration of 9.8 meters per second (per second
                self.acceleroMeterLabel.text = """
                x: \(accelarion.x.roundTo(places: 1))
                y: \(accelarion.y.roundTo(places: 1))
                z: \(accelarion.z.roundTo(places: 1))
                x(m/s): \((accelarion.x * 9.8).roundTo(places: 1))
                y(m/s): \((accelarion.y * 9.8).roundTo(places: 1))
                z(m/s): \((accelarion.z * 9.8).roundTo(places: 1))
                """
            }
        }
        if motionManager.isGyroAvailable {
            motionManager.gyroUpdateInterval = 0.1
            motionManager.startGyroUpdates(to: OperationQueue.main) { (data, error) in
                guard let rotationRate = data?.rotationRate else {
                    self.gyroMeterLabel.text = error?.localizedDescription ?? "Gyro error"
                    return
                }
                self.gyroMeterLabel.text = """
                x: \(rotationRate.x.roundTo(places: 1))
                y: \(rotationRate.y.roundTo(places: 1))
                z: \(rotationRate.z.roundTo(places: 1))
                """
            }
        }
        if motionManager.isMagnetometerAvailable {
            motionManager.magnetometerUpdateInterval = 0.1
            motionManager.startMagnetometerUpdates(to: OperationQueue.main) { (data, error) in
                guard let magneticField = data?.magneticField else {
                    self.magnetoMeterLabel.text = error?.localizedDescription ?? "Magneto error"
                    return
                }
                self.magnetoMeterLabel.text = """
                x: \(magneticField.x.roundTo(places: 1))
                y: \(magneticField.y.roundTo(places: 1))
                z: \(magneticField.z.roundTo(places: 1))
                """
            }
        }
        if motionManager.isDeviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = 0.1
            motionManager.startDeviceMotionUpdates(using: .xMagneticNorthZVertical, to: OperationQueue.main) { (data, error) in
                guard
                    let attitude = data?.attitude,
                    let rotationRate = data?.rotationRate,
                    let gravity = data?.gravity,
                    let userAcceleration = data?.userAcceleration,
                    let magneticField = data?.magneticField,
                    let heading = data?.heading
                else {
                    self.deviceMotionLabel.text = error?.localizedDescription ?? "Device motion error"
                    return
                }
                self.deviceMotionLabel.text = """
                Attitude:
                Pitch: \(attitude.pitch.roundTo(places: 1))
                Roll: \(attitude.roll.roundTo(places: 1))
                Yaw: \(attitude.yaw.roundTo(places: 1))
                
                Rotation Rate (Gyro):
                x: \(rotationRate.x.roundTo(places: 1))
                y: \(rotationRate.y.roundTo(places: 1))
                z: \(rotationRate.z.roundTo(places: 1))
                
                Gravity (Accelerometer):
                x: \(gravity.x.roundTo(places: 1))
                y: \(gravity.y.roundTo(places: 1))
                z: \(gravity.z.roundTo(places: 1))
                x(m/s): \((gravity.x * 9.8).roundTo(places: 1))
                y(m/s): \((gravity.y * 9.8).roundTo(places: 1))
                z(m/s): \((gravity.z * 9.8).roundTo(places: 1))
                
                User acceleration (Accelerometer):
                x: \(userAcceleration.x.roundTo(places: 1))
                y: \(userAcceleration.y.roundTo(places: 1))
                z: \(userAcceleration.z.roundTo(places: 1))
                x(m/s): \((userAcceleration.x * 9.8).roundTo(places: 1))
                y(m/s): \((userAcceleration.y * 9.8).roundTo(places: 1))
                z(m/s): \((userAcceleration.z * 9.8).roundTo(places: 1))
                
                Magnetic field (Magneto Meter):
                x: \(magneticField.field.x.roundTo(places: 1))
                y: \(magneticField.field.y.roundTo(places: 1))
                z: \(magneticField.field.z.roundTo(places: 1))
                
                Heading: \((heading).roundTo(places: 1))
                """
            }
        }
    }
}
