//
//  CaseAnnotations.swift
//  Corona-app
//
//  Created by Jahed Ahmed on 3/2/22.
//
import MapKit
import Foundation
class CaseAnnotations: NSObject, MKAnnotation {
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String?,
         subtitle: String?,
         coordinate: CLLocationCoordinate2D) {
        
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}
