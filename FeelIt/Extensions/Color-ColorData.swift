//
//  Color-ColorData.swift
//  FeelIt
//
//  Created by Alessio Garzia Marotta Brusco on 03/11/23.
//

import SwiftUI

extension Color {
    init(data: ColorData) {
        self.init(red: data.red, green: data.green, blue: data.blue, opacity: data.opacity)
    }
}
