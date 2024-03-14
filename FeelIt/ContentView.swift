//
//  ContentView.swift
//  FeelIt
//
//  Created by Alessio Garzia Marotta Brusco on 02/07/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var model: Model
    @State private var path = NavigationPath()
    
    @State private var showInfo = false
    
    var columns: [GridItem] {
        [GridItem(.adaptive(minimum: 360), spacing: 20)]
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                BackgroundView()
                
                ScrollView {
                    if model.palettes.isEmpty {
                        Text("Create a new Palette to Feel It")
                            .foregroundColor(.secondary)
                            .font(.title3.weight(.medium).width(.expanded))
                            .padding()
                            .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10))
                            .padding(.top, 75)
                    }
                    
                    LazyVGrid(columns: columns, alignment: .center, spacing: 20) {
                        ForEach($model.palettes) { $palette in
                            NavigationLink(value: palette) {
                                PaletteGridItem(palette: $palette)
                                    .transition(.scale)
                                    .contextMenu {
                                        DeleteButton("Delete Palette") {
                                            withAnimation {
                                                model.delete(palette)
                                            }
                                        }
                                    }
                            }
                        }
                    }
                    .padding(.horizontal)
                    .navigationDestination(for: Palette.self) { palette in
                        PaletteEditor(palette: model.paletteBinding(for: palette))
                    }
                    .toolbar {
                        Button(action: addPalette) {
                            Label("Add Palette", systemImage: "plus")
                                .font(.title3)
                        }
                    }
//                    .toolbar {
//                        ToolbarItem(placement: .bottomBar) {
//                            Button("Info", systemImage: "info.circle") {
//                                showInfo.toggle()
//                            }
//                        }
//                    }
                }
                .navigationTitle("Palettes")
            }
            .sheet(isPresented: $showInfo, content: AboutView.init)
        }
    }
    
    func addPalette() {
        withAnimation {
            let newPalette = model.addPalette()
            path.append(newPalette)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Model())
    }
}
