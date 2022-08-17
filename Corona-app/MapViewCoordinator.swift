//
//  MapViewCoordinator.swift
//  Corona-app
//
//  Created by Jahed Ahmed on 3/2/22.
//

import Foundation
import MapKit

class MapViewCoordinator: NSObject, MKMapViewDelegate {
    
    var mapViewController: MapView

    init(_ control: MapView) {
        self.mapViewController = control
    }
    
    func mapView(_ mapView: MKMapView, viewFor
        annotation: MKAnnotation) -> MKAnnotationView?{

        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "anno")
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "anno")
            annotationView?.canShowCallout = true
        }
        
        let subtitleLabel = UILabel()
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        subtitleLabel.text = annotation.subtitle ?? "NA"
        subtitleLabel.numberOfLines = 0
        annotationView?.detailCalloutAccessoryView = subtitleLabel

        return annotationView
    }
}
