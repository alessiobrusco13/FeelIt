//
//  ColorData.swift
//  FeelIt
//
//  Created by Alessio Garzia Marotta Brusco on 26/10/23.
//

import SwiftUI

struct ColorData: Codable {
    var red: Double
    var green: Double
    var blue: Double
    var opacity: Double
    
    init(red: Double, green: Double, blue: Double, opacity: Double) {
        self.red = red
        self.green = green
        self.blue = blue
        self.opacity = opacity
    }
    
    init(color: Color, in environment: EnvironmentValues = EnvironmentValues()) {
        let resolved = color.resolve(in: environment)
        self.init(
            red: Double(resolved.red),
            green: Double(resolved.green),
            blue: Double(resolved.blue),
            opacity: Double(resolved.opacity)
        )
    }
}
