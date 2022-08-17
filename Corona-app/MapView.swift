//
//  MapView.swift
//  Corona-app
//
//  Created by Jahed Ahmed on 3/2/22.
//

import SwiftUI
import Foundation
import MapKit



struct MapView: UIViewRepresentable {

    var coronaCases: [CaseAnnotations]
    var totalCases : Int

    func makeCoordinator() -> MapViewCoordinator {
        MapViewCoordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView{
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context){

        view.delegate = context.coordinator
        
        view.addAnnotations(coronaCases)
        if let first = coronaCases.first{
            view.selectAnnotation(first, animated: true)
    
        }
    }
}
