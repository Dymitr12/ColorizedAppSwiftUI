//
//  ColorView.swift
//  ColorizedAppSwiftUI
//
//  Created by Dymitr on 17.05.2022.
//

import SwiftUI

struct ColorView: View {
    
    let redColor: Double
    let greenColor: Double
    let blueColor: Double
    
    var body: some View {
        Color(red: redColor/255, green: greenColor/255, blue: blueColor/255)
            .frame(height: 200)
            .cornerRadius(40)
            .overlay(RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.white, lineWidth: 2)
            )
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(redColor: 20, greenColor: 120, blueColor: 144)
    }
}
