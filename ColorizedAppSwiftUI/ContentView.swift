//
//  ContentView.swift
//  ColorizedAppSwiftUI
//
//  Created by Dymitr on 16.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var red = Double.random(in: 0...255)
    @State private var green = Double.random(in: 0...255)
    @State private var blue = Double.random(in: 0...255)
    
    @FocusState var isInputActive: Bool
    
    var body: some View {
        //Color(.black).ignoresSafeArea()
        VStack(spacing: 40) {
            ColorView(redColor: red, greenColor: green, blueColor: blue)
            ColorSliderView(sliderValue: $red, color: .red)
            ColorSliderView(sliderValue: $green, color: .green)
            ColorSliderView(sliderValue: $blue, color: .blue)
        }
        .padding()
        .focused($isInputActive)
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    isInputActive = false
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
