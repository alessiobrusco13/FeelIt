//
//  Color-Hex.swift
//  FeelIt
//
//  Created by Alessio Garzia Marotta Brusco on 03/11/23.
//

import SwiftUI

extension Color {
    static func hex(_ hex: String) -> Color? {
        let red, green, blue, opacity: Double
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    red = Double((hexNumber & 0xff000000) >> 24) / 255
                    green = Double((hexNumber & 0x00ff0000) >> 16) / 255
                    blue = Double((hexNumber & 0x0000ff00) >> 8) / 255
                    opacity = Double(hexNumber & 0x000000ff) / 255
                    
                    return Color(red: red, green: green, blue: blue, opacity: opacity)
                }
            }
        }
        
        return nil
    }
}
