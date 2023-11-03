//
//  FeelItModelContainer.swift
//  FeelIt
//
//  Created by Alessio Garzia Marotta Brusco on 03/11/23.
//

import SwiftData
import SwiftUI

struct FeelItModelContainerConfiguration {
    static let exampleKey = "exampleAdded"
    let modelContainer: ModelContainer
    
    init() {
        do {
            let container = try ModelContainer(for: Palette.self)
            
            if !UserDefaults.standard.bool(forKey: Self.exampleKey) {
                Task { @MainActor in
                    container.mainContext.insert(Palette.example)
                }
                
                UserDefaults.standard.setValue(true, forKey: Self.exampleKey)
            }
            
            self.modelContainer = container
        } catch {
            fatalError("Failed to create container: \(error.localizedDescription)")
        }
    }
}

struct FeelItModelContainerViewModifier: ViewModifier {
    let configuration = FeelItModelContainerConfiguration()
    
    func body(content: Content) -> some View {
        content
            .modelContainer(configuration.modelContainer)
    }
}

extension View {
    func feelItModelContainer() -> some View {
        modifier(FeelItModelContainerViewModifier())
    }
}
