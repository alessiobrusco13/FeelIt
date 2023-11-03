//
//  PaletteItem.swift
//  FeelIt
//
//  Created by Alessio Garzia Marotta Brusco on 23/07/23.
//

import SwiftData
import SwiftUI

@Model
class PaletteItem: Identifiable {
    var name: String
    var colorData: ColorData
    var feeling: Feeling?
    var role: Role
    
    var palette: Palette?
    
    init(name: String, colorData: ColorData, feeling: Feeling? = nil) {
        self.name = name
        self.colorData = colorData
        self.feeling = feeling
        self.role = .none
    }
}
