//
//  PaletteItem.swift
//  FeelIt
//
//  Created by Alessio Garzia Marotta Brusco on 23/07/23.
//

import SwiftData
import SwiftUI

@Model
class PaletteItem {
    var name: String
    var colorData: Color.Resolved
    var feeling: Feeling?
    
    var palette: Palette?
    
    init(name: String, colorData: Color.Resolved) {
        self.name = name
        self.colorData = colorData
    }
}
