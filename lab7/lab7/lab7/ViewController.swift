//
//  ViewController.swift
//  lab7
//
//  Created by Admin on 2024-07-14.
//

import UIKit
import SwiftUI
import MapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
   


}

extension CLLocationCoordinate2D {
    static var userLoation: CLLocationCoordinate2D {
        return .init(latitude: 43.478523, longitude: -80.525032)
    }
}

extension MKCoordinateRegion {
    static var userRegion: MKCoordinateRegion {
        return .init(center: .userLoation, latitudinalMeters: 10000, longitudinalMeters: 10000)}
}

