//
//  Color-RGBValuesInit.swift
//  FeelIt
//
//  Created by Alessio Garzia Marotta Brusco on 02/07/23.
//

import SwiftUI

extension Color {
    init(_ colorSpace: RGBColorSpace = .sRGB, rgb: RGBValues, opacity: Double = 1) {
        self.init(.sRGB, red: rgb.doubleValues.red, green: rgb.doubleValues.green, blue: rgb.doubleValues.blue, opacity: opacity)
    }
}
