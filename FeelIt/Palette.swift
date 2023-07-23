//
//  Palette.swift
//  FeelIt
//
//  Created by Alessio Garzia Marotta Brusco on 23/07/23.
//

import Foundation
import SwiftData

@Model
class Palette {
    var name: String
    @Relationship(inverse: \PaletteItem.palette) var items: [PaletteItem]
    
    init(name: String = "Untitled") {
        self.name = name
        items = []
    }
}
