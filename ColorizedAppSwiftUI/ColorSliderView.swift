//
//  ColorSliderView.swift
//  ColorizedAppSwiftUI
//
//  Created by Dymitr on 17.05.2022.
//

import SwiftUI

struct ColorSliderView: View {
    
    
    
    @State private var textValue = ""
    
    @State private var showAlert = false
    
    @Binding var sliderValue: Double
    
    let color: Color
    
    var body: some View {
        HStack {
            Text("\(lround(sliderValue))")
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .tint(color)
            .onChange(of: sliderValue) { newValue in textValue = "\(lround(newValue))"
            }
            TextField("0-255", text: $textValue) { _ in checkNumber()
            }
            .frame(width: 60)
            .keyboardType(.decimalPad)
            .alert("Wrong format", isPresented: $showAlert, actions: {}) {
                Text("Enter a number from 0 to 255")
            }
        }
        .onAppear {
            textValue = "\(lround(sliderValue))"
        }
    }
}

struct ColorSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSliderView(sliderValue: .constant(100), color: .red)
    }
}

extension ColorSliderView {
    private func checkNumber() {
        if let value = Int(textValue), (0...255).contains(value) {
            self.sliderValue = Double(value)
            return
        }
        showAlert.toggle()
        sliderValue = 12
        textValue = "0"
    }
}

