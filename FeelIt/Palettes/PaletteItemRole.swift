//
//  PaletteItemRole.swift
//  FeelIt
//
//  Created by Alessio Garzia Marotta Brusco on 03/11/23.
//

import Foundation

extension PaletteItem {
    enum Role: Codable {
        case primary
        case secondary
        case background
        case none
    }
}
