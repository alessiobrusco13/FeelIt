//
//  ContentView.swift
//  FeelIt
//
//  Created by Alessio Garzia Marotta Brusco on 23/07/23.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Query var palettes: [Palette]
    
    var body: some View {
        NavigationStack {
            List(palettes) { palette in
                DisclosureGroup("Colors") {
                    ForEach(palette.items) { item in
                        Color(data: item.colorData)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
