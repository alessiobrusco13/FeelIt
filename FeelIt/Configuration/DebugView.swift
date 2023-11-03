//
//  DebugView.swift
//  FeelIt
//
//  Created by Alessio Garzia Marotta Brusco on 03/11/23.
//

import SwiftData
import SwiftUI

struct DebugView: View {
    @Environment(\.modelContext) var modelContext
    @AppStorage(FeelItModelContainerConfiguration.exampleKey) var exampleAdded = false
    
    @Query var palettes: [Palette]
    @Query var items: [PaletteItem]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    HStack {
                        Spacer()
                        
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color(UIColor.secondarySystemGroupedBackground))
                            .frame(width: 150, height: 150)
                            .overlay {
                                VStack {
                                    Text("Palettes")
                                        .font(.title3)
                                    
                                    Text("\(palettes.count)")
                                        .font(.largeTitle.bold())
                                        .fontDesign(.rounded)
                                }
                            }
                        
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color(UIColor.secondarySystemGroupedBackground))
                            .frame(width: 150, height: 150)
                            .overlay {
                                VStack {
                                    Text("Palette Items")
                                        .font(.title3)
                                    
                                    Text("\(items.count)")
                                        .font(.largeTitle.bold())
                                        .fontDesign(.rounded)
                                }
                            }
                        
                        Spacer()
                    }
                    .listRowBackground(EmptyView())
                }
                
                Section("User Defaults") {
                    Toggle(FeelItModelContainerConfiguration.exampleKey, isOn: $exampleAdded)
                }
                
                Section("Manage Data") {
                    Button("Delete All") {
                        try? modelContext.delete(model: Palette.self)
                    }
                    
                    Button("Delete All Items") {
                        try? modelContext.delete(model: PaletteItem.self)
                    }
                }
                .tint(.red)
                
                Section {
                    DisclosureGroup("Palettes") {
                        ForEach(palettes) { palette in
                            DisclosureGroup {
                                ScrollView(.horizontal) {
                                    HStack {
                                        ForEach(palette.items) { item in
                                            Color(data: item.colorData)
                                                .frame(width: 64, height: 64)
                                        }
                                    }
                                }
                            } label: {
                                HStack {
                                    Text(palette.name)
                                    Button("Delete", systemImage: "trash", role: .destructive) {
                                        modelContext.delete(palette)
                                    }
                                    .labelStyle(.iconOnly)
                                    .buttonStyle(.bordered)
                                    .buttonBorderShape(.capsule)
                                    .tint(.red)
                                    
                                    Button("Delete Items", role: .destructive) {
                                        palette.items.forEach(modelContext.delete)
                                    }
                                    .buttonStyle(.bordered)
                                    .buttonBorderShape(.roundedRectangle)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
