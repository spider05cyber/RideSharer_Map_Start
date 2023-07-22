//
//  MapViewController.swift
//  RideSharer
//
//

import UIKit
import MapKit

class MapViewController: UIViewController {
  
  @IBOutlet weak var mapView: MKMapView!
  let locationManager = CLLocationManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    checkLocationServices()
  }
  func checkLocationServices() {
    if CLLocationManager.locationServicesEnabled() {
      checkLocationAuthorization()
    } else {
        // Show alert letting the user know they have to turn this on.
    }
  }
  func checkLocationAuthorization() {
    switch CLLocationManager.authorizationStatus() {
    case .authorizedWhenInUse:
      mapView.showsUserLocation = true
    case .denied: // Show alert telling users how to turn on permissions
      break
    case .notDetermined:
      locationManager.requestWhenInUseAuthorization()
      mapView.showsUserLocation = true
    case .restricted: // Show an alert letting them know what’s up
      break
    case .authorizedAlways:
      break
    }
  }
    
}
