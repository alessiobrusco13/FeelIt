//
//  Palette.swift
//  FeelIt
//
//  Created by Alessio Garzia Marotta Brusco on 23/07/23.
//

import Foundation
import SwiftData

@Model
class Palette: Identifiable {
    var name: String
    @Relationship(deleteRule: .cascade, inverse: \PaletteItem.palette) var items: [PaletteItem]
    
    init(name: String = "Untitled") {
        self.name = name
        items = []
    }
    
    static let example = {
        let palette = Palette(name: "Welcome!")
        
        let items = [
            PaletteItem(name: "Red", colorData: .init(color: .hex("#DB1F48FF")!)),
            PaletteItem(name: "Navy Blue", colorData: .init(color: .hex("#004369FF")!)),
            PaletteItem(name: "Teal", colorData: .init(color: .hex("#00949AFF")!)),
            PaletteItem(name: "Sand Dollar", colorData: .init(color: .hex("#E6DDC8FF")!)),
        ]
        
        palette.items = items
        return palette
    }()
}
