//
//  MapViewController.swift
//  ps-tech-for-good
//
//  Created by Usuário Convidado on 02/12/21.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let annotation = MKPointAnnotation();
        annotation.coordinate = CLLocationCoordinate2D(latitude: -23.5684, longitude: -46.7172)
        annotation.title = "Instituto Butantã"
        annotation.subtitle = "Estudos e pesquisas para a melhoria da saúde global"
        
        mapView.addAnnotation(annotation)
        
        let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        
        mapView.setRegion(region, animated: true)
        
        // Instituto Butantã Latitude: -23,5684
        // Instituto Butantã Longitude: -46,7172
    }

}
