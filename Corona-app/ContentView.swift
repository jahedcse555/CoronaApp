//
//  ContentView.swift
//  Corona-app
//
//  Created by Jahed Ahmed on 3/2/22.
//


// //https://heartbeat.comet.ml/coronavirus-visualisation-on-maps-with-swiftui-and-combine-on-ios-c3f6e04c2634
//






import SwiftUI

struct ContentView: View {
    
    @ObservedObject var coronaCases = CoronaObservable()
    
    var body: some View {
        VStack{
            
            Text("COVID-19 Data")
                .font(.headline)
                .padding()
            
            HStack{
                Text("Total Cases\n\(coronaCases.coronaOutbreak.totalCases)")
                .multilineTextAlignment(.center)
                Text("Total Recovered\n\(coronaCases.coronaOutbreak.totalRecovered)")
                .multilineTextAlignment(.center)
                Text("Total Deaths\n\(coronaCases.coronaOutbreak.totalDeaths)")
                .multilineTextAlignment(.center)
            }
            
            MapView(coronaCases: coronaCases.caseAnnotations, totalCases: Int(coronaCases.coronaOutbreak.totalCases) ?? 0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
