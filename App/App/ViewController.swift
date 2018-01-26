//
//  ViewController.swift
//  App
//
//  Created by Chethan SP on 23/1/18.
//  Copyright © 2018 Chethan SP. All rights reserved.
//

import UIKit
import MapKit
import Domain
import MBProgressHUD

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        requestLocationAccess()
        mapView?.delegate = self
        
        self.title = NSLocalizedString("PSI Alert", comment: "")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
        let progressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
        
        APIInterface.shared.getPSIData { (region, error) in
            progressHUD.hide(animated:true)
            
            let annotations = Place.getPlaces(regions: region)
            self.mapView?.addAnnotations(annotations)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func requestLocationAccess() {
        let status = CLLocationManager.authorizationStatus()
        
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            return
            
        case .denied, .restricted:
            print("location access denied")
            
        default:
            locationManager.requestWhenInUseAuthorization()
        }
    }
}


extension ViewController: MKMapViewDelegate {
  
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        else {
            let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "annotationView") ?? MKAnnotationView()
            annotationView.image = UIImage(named: "place icon")
            annotationView.rightCalloutAccessoryView = UIButton.init(type: UIButtonType.detailDisclosure)
            annotationView.canShowCallout = true
            return annotationView
        }
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl)
    {
        guard let annotation = view.annotation else
        {
            return
        }
        
        view.canShowCallout = false
        
        guard let detailController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController, let placeAnnotation = annotation as? Place else  {
            return
        }
        detailController.items = placeAnnotation.items
        detailController.headerString = placeAnnotation.title
        self.navigationController?.pushViewController(detailController, animated: true)
        print(annotation)
    }
}

