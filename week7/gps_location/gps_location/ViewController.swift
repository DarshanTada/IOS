//
//  ViewController.swift
//  gps_location
//
//  Created by Admin on 2024-07-09.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

   
    @IBOutlet weak var locationText: UITextField!
    
    @IBOutlet weak var locationButton: UIButton!
    
    @IBOutlet weak var myLocation: MKMapView!
    
    @IBAction func getDirection(_ sender: UIButton) {
        converAddress()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    let manager = CLLocationManager()
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        myLocation.delegate = self
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations location: [CLLocation]) {
        if let location = location.first {
            manager.startUpdatingLocation()
            render (location)
        }
        
    }
    
    func render (_ location: CLLocation) {
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)
        
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        let pin = MKPointAnnotation()
        
        pin.coordinate = coordinate
        myLocation.addAnnotation(pin)
        myLocation.setRegion(region, animated: true)
    }
    
    func converAddress() {
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(locationText.text!)
        {
            (placemarks, error) in
            guard let placemarks = placemarks,
                  let location = placemarks.first?.location
            else {
                print("no location found")
                return
                
            }
            print(location)
//            self.mapThis(desitiationCor: location.coordinate)
        }
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let routeline = MKPolylineRenderer(overlay: overlay as! MKPolyline)
        routeline.strokeColor = .green
        return routeline
    }
    
    func mapThis(desitiationsCor : CLLocationCoordinate2D) {
        
        let sourceCoordinate = (manager.location?.coordinate)!
        
        let sourcePlacemark = MKPlacemark(coordinate: sourceCoordinate)
        let destinationPlacemark = MKPlacemark(coordinate: desitiationsCor)
        
        let sourceItem = MKMapItem(placemark:  sourcePlacemark)
        let destinationItem = MKMapItem(placemark: destinationPlacemark)
        
        let destinationRequest = MKDirections.Request()
        
        destinationRequest.source = sourceItem
        destinationRequest.destination = destinationItem
        
        destinationRequest.transportType = .automobile
        
        destinationRequest.requestsAlternateRoutes = true
        
        let diretions = MKDirections(request: destinationRequest)
        diretions.calculate {
            (response, error) in
            guard let response = response else {
                if let error = error {
                    print("Something went wrong")
                }
                return
            }
        }
        
        
    }
    
    let route = response.routes[0]
    
    
}

