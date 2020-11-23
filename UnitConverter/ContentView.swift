//
//  ContentView.swift
//  UnitConverter
//
//  Created by Abdul Ahad Khan on 2020-11-23.
//

import SwiftUI

struct Conversions: Identifiable {
    var id = UUID()
    var input: String
    var output: String
    
}

struct ContentView: View {
    
    @State private var unitConversion = 1
    
    let conversions = ["Cm->Inches","Km->Miles","Celsius->Farenheit"]
    @State private var chosenConverter = "Cm->Inches"
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Type", selection: $unitConversion) {
                        ForEach(0..<conversions.count) {
                            Text("\(self.conversions[$0])")
                        }
                    }
                }
                
                Section {
                    Text("Conversion: \(unitConversion)")
                }
            }
            .navigationTitle("Unit Converter")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
