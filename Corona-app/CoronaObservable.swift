//
//  CoronaObservable.swift
//  Corona-app
//
//  Created by Jahed Ahmed on 3/2/22.
//
import SwiftUI
import Combine

class CoronaObservable : ObservableObject{
    
    @Published var caseAnnotations = [CaseAnnotations]()
    @Published var coronaOutbreak = (totalCases: "...", totalRecovered: "...", totalDeaths: "...")

   var urlBase = "https://services1.arcgis.com/0MSEUqKaxRlEPj5g/arcgis/rest/services/ncov_cases/FeatureServer/1/query"
    
    var cancellable : Set<AnyCancellable> = Set()
    
    init() {
        fetchCoronaCases()
    }
    
    func fetchCoronaCases()
    {
        
        var urlComponents = URLComponents(string: urlBase)!
        urlComponents.queryItems = [
            URLQueryItem(name: "f", value: "json"),
            URLQueryItem(name: "where", value: "Confirmed > 0"),
            URLQueryItem(name: "geometryType", value: "esriGeometryEnvelope"),
            URLQueryItem(name: "spatialRef", value: "esriSpatialRelIntersects"),
            URLQueryItem(name: "outFields", value: "*"),
            URLQueryItem(name: "orderByFields", value: "Confirmed desc"),
            URLQueryItem(name: "resultOffset", value: "0"),
            URLQueryItem(name: "cacheHint", value: "true")
        ]

        URLSession.shared.dataTaskPublisher(for: urlComponents.url!)
            .map{$0.data}
            .decode(type: CoronaResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
 
        }) { response in
            
            self.casesByProvince(response: response)
        }
        .store(in: &cancellable)
    }
    func casesByProvince(response: CoronaResponse)
        {
            var caseAnnotations : [CaseAnnotations] = []
            
            var totalCases = 0
            var totalDeaths = 0
            var totalRecovered = 0

            for cases in response.features{
                
                let confirmed = cases.attributes.confirmed ?? 0

                caseAnnotations.append(CaseAnnotations(title: cases.attributes.provinceState ?? cases.attributes.countryRegion ?? "", subtitle: "\(confirmed)", coordinate: .init(latitude: cases.attributes.lat ?? 0.0, longitude: cases.attributes.longField ?? 0.0)))

                totalCases += confirmed
                totalDeaths += cases.attributes.deaths ?? 0
                totalRecovered += cases.attributes.recovered ?? 0
            }

            self.coronaOutbreak.totalCases = "\(totalCases)"
            self.coronaOutbreak.totalDeaths = "\(totalDeaths)"
            self.coronaOutbreak.totalRecovered = "\(totalRecovered)"
            
            self.caseAnnotations = caseAnnotations

        }
}
