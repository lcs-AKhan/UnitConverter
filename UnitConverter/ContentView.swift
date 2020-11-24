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
    
    let conversions = ["Inches->Meters","Km->Meters","Cm->Meters","Mm->Meters","Miles->Meters"]
    @State private var chosenConverter = "Inches->Meters"
    
    @State private var conversionInputString = ""
    @State private var conversionInput: Double = 0
    
    @State private var conversionOutput: Double = 0
    
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
                    Text("Conversion: \(conversions[unitConversion])")
                    TextField("Enter Value You Want To Convert", text: $conversionInputString )
                    Button(action: {
                        ConversionsProcess()
                    }) {
                        Text("Convert")
                    }
                }
                Section {
                    Text("Output: \(conversionOutput, specifier: "%.2f")")
                }
            }
            .navigationTitle("Unit Converter")
        }
    }
    func ConvertToDouble() {
        conversionInput = Double(conversionInputString) ?? 0
    }
    func ConversionsProcess() {
        ConvertToDouble()
        if unitConversion == 0 {
            conversionOutput = conversionInput * 0.0254
        } else if unitConversion == 1 {
            conversionOutput = conversionInput * 100
        } else if unitConversion == 2 {
            conversionOutput = conversionInput/100
        } else if unitConversion == 3 {
            conversionOutput = conversionInput/1000
        } else if unitConversion == 4 {
            conversionOutput = conversionInput * 1609.34
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
