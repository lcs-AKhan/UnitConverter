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
    
    // Category 0 = Distance, Category 1 = Temperature
    @State private var category = 0
    let categories = ["Distance","Temperature", "Weight"]
        
    @State private var distanceConversion = 1
    
    let distanceConversions = ["Inches->Meters","Km->Meters","Cm->Meters","Mm->Meters","Miles->Meters","Meters->Inches","Meters->Km","Meters->Cm","Meters->Mm","Meters->Miles"]
    
    @State private var temperatureConversion = 1
    
    let temperatureConversions = ["Celsius->Farenheit","Celsius->Kelvin","Farenheit->Kelvin","Farenheit->Celsius","Kelvin->Farenheit","Kelvin->Celsius"]
        
    let weightConversions = ["Lbs->Kg","Kg->Lbs","Kg->G","Kg->Tonne","Kg->Mg","G->Kg","Tonne->Kg","Mg->Kg"]
    
    @State private var weightConversion = 1
    
    @State private var conversionInputString = ""
    @State private var conversionInput: Double = 0
    
    @State private var conversionOutput: Double = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Conversion Category")) {
                    Picker("Category", selection: $category) {
                        ForEach(0..<categories.count) {
                            Text("\(self.categories[$0])")
                        }
                    }
                }
                Section(header: Text("Conversion Type")) {
                    if category == 1 {
                        Picker("Conversion", selection: $temperatureConversion) {
                            ForEach(0..<temperatureConversions.count) {
                                Text("\(self.temperatureConversions[$0])")
                            }
                        }
                    } else if category == 0 {
                        Picker("Conversion", selection: $distanceConversion) {
                            ForEach(0..<distanceConversions.count) {
                                Text("\(self.distanceConversions[$0])")
                            }
                        }
                    } else {
                        Picker("Conversion", selection: $weightConversion) {
                            ForEach(0..<weightConversions.count) {
                                Text("\(self.weightConversions[$0])")
                            }
                        }
                    }
                }
                Section(header: Text("Convert Process")) {
                    if category == 0 {
                        Text("Conversion:  \(distanceConversions[distanceConversion])")
                    } else if category == 1 {
                        Text("Conversion: \(temperatureConversions[temperatureConversion])")
                    } else {
                        Text("Conversion: \(weightConversions[weightConversion])")
                    }
                    TextField("Enter Value You Want To Convert", text: $conversionInputString )
                    Button(action: {
                        switch category == 1 {
                        case false:
                            DistanceConversionsProcess()
                        default:
                            TemperatureConversionsProcess()
                        }
                    }) {
                        Text("Convert")
                    }
                }
                Section(header: Text("Conversion Output")) {
                    Text("\(conversionOutput, specifier: "%.2f")")
                }
            }
            .navigationTitle("Unit Converter")
        }
    }
    func ConvertToDouble() {
        conversionInput = Double(conversionInputString) ?? 0
    }
    func DistanceConversionsProcess() {
        ConvertToDouble()
        if distanceConversion == 0 {
            conversionOutput = conversionInput * 0.0254
        } else if distanceConversion == 1 {
            conversionOutput = conversionInput * 100
        } else if distanceConversion == 2 {
            conversionOutput = conversionInput/100
        } else if distanceConversion == 3 {
            conversionOutput = conversionInput/1000
        } else if distanceConversion == 4 {
            conversionOutput = conversionInput * 1609.34
        } else if distanceConversion == 5 {
            conversionOutput = conversionInput * 39.3701
        } else if distanceConversion == 6 {
            conversionOutput = conversionInput/1000
        } else if distanceConversion == 7 {
            conversionOutput = conversionInput * 100
        } else if distanceConversion == 8 {
            conversionOutput = conversionInput * 1000
        } else if distanceConversion == 9 {
            conversionOutput = conversionInput * 0.000621371
        }
    }
    func TemperatureConversionsProcess() {
        ConvertToDouble()
               if temperatureConversion == 0 {
            conversionInput = (conversionOutput * 9/5) + 32
        } else if temperatureConversion == 1 {
            conversionOutput = conversionInput + 273.15
        } else if temperatureConversion == 2 {
            conversionOutput = (conversionInput - 32) * (5/9) + 273.15
        } else if temperatureConversion == 3 {
            conversionOutput = (conversionInput - 32) * (5/9)
        } else if temperatureConversion == 4 {
            conversionOutput = (conversionInput - 273.15) * (9/5) + 32
        } else if temperatureConversion == 5 {
            conversionOutput = conversionInput - 273.15
        }
    }
    func WeightConversionsProcess() {
        ConvertToDouble()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
