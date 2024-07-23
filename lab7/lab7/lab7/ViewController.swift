//
//  ViewController.swift
//  lab7
//
//  Created by Admin on 2024-07-14.
//
import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    // Outlets for UI elements
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var zoomSlider: UISlider!
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var walkImageView: UIImageView!
    @IBOutlet weak var busImageView: UIImageView!
    @IBOutlet weak var bikeImageView: UIImageView!
    @IBOutlet weak var navigationImageView: UIImageView!
    @IBOutlet weak var startLatLabel: UILabel!
    @IBOutlet weak var startLngLabel: UILabel!
    @IBOutlet weak var endLatLabel: UILabel!
    @IBOutlet weak var endLngLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    // Properties to manage location and routing
    var locationManager: CLLocationManager!
    var startLocation: CLLocationCoordinate2D?
    var endLocation: CLLocationCoordinate2D?
    var selectedTransportType: MKDirectionsTransportType = .automobile
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up map view
        mapView.delegate = self
        
        // Initialize and configure location manager
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        // Check and request location services authorization
        let authStatus = CLLocationManager().authorizationStatus
        switch authStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.startUpdatingLocation()
        case .restricted, .denied:
            // Handle restricted/denied authorization
            showAlertWithMessage("Location services are not authorized. Please enable them in Settings.")
        @unknown default:
            // Handle any future cases
            break
        }
        
        // Set up zoom slider
        zoomSlider.minimumValue = 0.02
        zoomSlider.maximumValue = 0.2
        zoomSlider.value = 0.1
        zoomSlider.addTarget(self, action: #selector(zoomMap), for: .valueChanged)
        
        // Add tap gestures to image views for transport selection
        addTapGesture(to: carImageView, action: #selector(selectCar))
        addTapGesture(to: walkImageView, action: #selector(selectWalk))
        addTapGesture(to: busImageView, action: #selector(selectBus))
        addTapGesture(to: bikeImageView, action: #selector(selectBike))
        addTapGesture(to: navigationImageView, action: #selector(handleNavigationTap))
        
        // Set initial transport type
        selectCar()
    }

    // Helper method to add tap gestures to image views
    private func addTapGesture(to imageView: UIImageView, action: Selector) {
        let tapGesture = UITapGestureRecognizer(target: self, action: action)
        imageView.addGestureRecognizer(tapGesture)
        imageView.isUserInteractionEnabled = true
    }
    
    // Action for navigation button tap
    @objc func handleNavigationTap() {
        setRoute()
    }
    
    // Action for selecting the car transport type
    @objc func selectCar() {
        selectedTransportType = .automobile
        updateTransportSelection(selectedImageView: carImageView)
        updateRouteIfNeeded()
    }
    
    // Action for selecting the walk transport type
    @objc func selectWalk() {
        selectedTransportType = .walking
        updateTransportSelection(selectedImageView: walkImageView)
        updateRouteIfNeeded()
    }
    
    // Action for selecting the bus transport type
    @objc func selectBus() {
//        selectedTransportType = .transit Note:- HERE TRANSIT WAS NOT WORKING
        selectedTransportType = .automobile
        updateTransportSelection(selectedImageView: busImageView)
        updateRouteIfNeeded()
    }
    
    // Action for selecting the bike transport type
    @objc func selectBike() {
        selectedTransportType = .automobile
        updateTransportSelection(selectedImageView: bikeImageView)
        updateRouteIfNeeded()
    }
    
    // Updates the background color of selected transport type
    func updateTransportSelection(selectedImageView: UIImageView) {
        let imageViews = [carImageView, walkImageView, busImageView, bikeImageView]
        for imageView in imageViews {
            imageView?.backgroundColor = .clear
        }
        selectedImageView.backgroundColor = .lightGray
    }
    
    // Action to zoom the map based on slider value
    @objc func zoomMap() {
        // Convert the slider value to a zoom scale
        let zoomScale = CLLocationDegrees(zoomSlider.value)
        
        // Set the map view's region with the updated zoom scale
        let region = MKCoordinateRegion(center: mapView.centerCoordinate, span: MKCoordinateSpan(latitudeDelta: zoomScale, longitudeDelta: zoomScale))
        mapView.setRegion(region, animated: true)
    }

    
    @objc func setRoute() {
        let alertController = UIAlertController(title: "Where would you like to go?", message: "Enter start and end locations", preferredStyle: .alert)
        
        // Add text fields for start and end locations
        alertController.addTextField { textField in
            textField.placeholder = "Start Location (optional)"
        }
        
        alertController.addTextField { textField in
            textField.placeholder = "End Location"
        }
        
        // Define the cancel action
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        // Define the action to get directions
        let getDirectionsAction = UIAlertAction(title: "Get Directions", style: .default) { [weak self] _ in
            guard let self = self else { return }
            
            // Get the text from the alert fields
            let startLocationText = alertController.textFields?[0].text
            let endLocationText = alertController.textFields?[1].text
            
            // Ensure the end location is provided
            guard let endLocationText = endLocationText, !endLocationText.isEmpty else {
                self.showAlertWithMessage("End Location is required")
                return
            }
            
            // Geocode the end location address
            self.geocodeAddress(address: endLocationText) { endCoordinate in
                guard let endCoordinate = endCoordinate else {
                    self.showAlertWithMessage("Invalid End Location")
                    return
                }
                
                // Update the end location and label
                self.endLocation = endCoordinate
                self.endLatLabel.text = "End Latitude: \(endCoordinate.latitude)"
                self.endLngLabel.text = "End Longitude: \(endCoordinate.longitude)"
                
                // Add a pin for the end location
                let endAnnotation = MKPointAnnotation()
                endAnnotation.coordinate = endCoordinate
                endAnnotation.title = "End Location"
                self.mapView.addAnnotation(endAnnotation)
                
                // Handle the start location
                if let startLocationText = startLocationText, !startLocationText.isEmpty {
                    // Geocode the start location address
                    self.geocodeAddress(address: startLocationText) { startCoordinate in
                        guard let startCoordinate = startCoordinate else {
                            self.showAlertWithMessage("Invalid Start Location")
                            return
                        }
                        
                        // Update the start location and label
                        self.startLocation = startCoordinate
                        self.startLatLabel.text = "Start Latitude: \(startCoordinate.latitude)"
                        self.startLngLabel.text = "Start Longitude: \(startCoordinate.longitude)"
                        
                        // Show route if both locations are set
                        self.showRoute()
                    }
                } else {
                    // Use coordinates from labels if start location is not provided
                    if let startLatText = self.startLatLabel.text,
                       let startLngText = self.startLngLabel.text,
                       let startLat = Double(startLatText.replacingOccurrences(of: "Start Latitude: ", with: "")),
                       let startLng = Double(startLngText.replacingOccurrences(of: "Start Longitude: ", with: "")) {
                        
                        self.startLocation = CLLocationCoordinate2D(latitude: startLat, longitude: startLng)
                        
                        // Show route if end location is set
                        if self.endLocation != nil {
                            self.showRoute()
                        } else {
                            self.showAlertWithMessage("End Location is required")
                        }
                    } else {
                        self.showAlertWithMessage("Current location is not available")
                    }
                }
            }
        }
        
        // Add actions to the alert controller
        alertController.addAction(cancelAction)
        alertController.addAction(getDirectionsAction)
        self.present(alertController, animated: true, completion: nil)
    }

    // Displays an alert with a specified message
    func showAlertWithMessage(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    
    // Geocodes an address to get coordinates
    func geocodeAddress(address: String, completion: @escaping (CLLocationCoordinate2D?) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { placemarks, error in
            guard let placemarks = placemarks, let location = placemarks.first?.location else {
                completion(nil)
                return
            }
            completion(location.coordinate)
        }
    }
    
    // Sets and displays a route between start and end locations
    func showRoute() {
        guard let startLocation = startLocation, let endLocation = endLocation else { return }
        
        // Remove existing overlays and annotations
        mapView.removeOverlays(mapView.overlays)
        mapView.removeAnnotations(mapView.annotations)
        
        // Add a pin for the start location
        let startAnnotation = MKPointAnnotation()
        startAnnotation.coordinate = startLocation
        startAnnotation.title = "Start Location"
        mapView.addAnnotation(startAnnotation)
        
        // Add a pin for the end location
        let endAnnotation = MKPointAnnotation()
        endAnnotation.coordinate = endLocation
        endAnnotation.title = "End Location"
        mapView.addAnnotation(endAnnotation)
        
        let startPlacemark = MKPlacemark(coordinate: startLocation)
        let endPlacemark = MKPlacemark(coordinate: endLocation)
        
        let startItem = MKMapItem(placemark: startPlacemark)
        let endItem = MKMapItem(placemark: endPlacemark)
        
        let directionRequest = MKDirections.Request()
        directionRequest.source = startItem
        directionRequest.destination = endItem
        directionRequest.transportType = selectedTransportType
        
        let directions = MKDirections(request: directionRequest)
        directions.calculate { response, error in
            if let error = error {
                print("Error getting directions: \(error.localizedDescription)")
                return
            }
            
            guard let response = response, let route = response.routes.first else {
                print("No routes found")
                return
            }
            
            self.mapView.addOverlay(route.polyline)
            self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
            
            let distance = route.distance / 1000 // distance in kilometers
            // Update the distanceLabel with the total distance
            self.distanceLabel.text = String(format: "Total distance: %.2f km", distance)
        }
    }

    // Checks if both start and end locations are set and updates the route
    func updateRouteIfNeeded() {
            // Update the route if startLocation and endLocation are both set
            if startLocation != nil && endLocation != nil {
                showRoute()
            } else {
                if startLocation == nil {
                    showAlertWithMessage("Start Location is required")
                }
                if endLocation == nil {
                    showAlertWithMessage("End Location is required")
                }
            }
        }

    // CLLocationManagerDelegate method for location updates
       func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
           guard let location = locations.last else { return }
           
           // Update the map to center around user's location
           let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
           mapView.setRegion(region, animated: true)
           
           // Add a pin for the user's location
           let userAnnotation = MKPointAnnotation()
           userAnnotation.coordinate = location.coordinate
           userAnnotation.title = "You are here"
           mapView.addAnnotation(userAnnotation)
           
           // Set start location to user's location if not already set
           if startLocation == nil {
               startLocation = location.coordinate
               startLatLabel.text = "Start Lat: \(location.coordinate.latitude)"
               startLngLabel.text = "Start Lng: \(location.coordinate.longitude)"
           }
       }

    // CLLocationManagerDelegate method for authorization status changes
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            // Request authorization if not determined
            locationManager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse, .authorizedAlways:
            // Start updating location if authorized
            locationManager.startUpdatingLocation()
        case .restricted, .denied:
            // Handle restricted or denied cases
            showAlertWithMessage("Location services are not authorized. Please enable them in Settings.")
        @unknown default:
            break
        }
    }


    
    // MARK: - MKMapViewDelegate
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let routePolyline = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: routePolyline)
            renderer.strokeColor = .blue
            renderer.lineWidth = 4.0
            return renderer
        }
        return MKOverlayRenderer()
    }
}
