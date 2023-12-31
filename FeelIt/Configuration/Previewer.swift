//
//  Previewer.swift
//  FeelIt
//
//  Created by Alessio Garzia Marotta Brusco on 06/11/23.
//

import SwiftData
import SwiftUI

extension Previewer {
    struct Context {
        fileprivate let container: ModelContainer
        
        init(schema: Schema) {
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            let container = try! ModelContainer(for: schema, configurations: config)
            self.container = container
        }
        
        @MainActor
        func insert(_ model: any PersistentModel) {
            container.mainContext.insert(model)
        }
        
        @MainActor
        func insert(_ models: [any PersistentModel]) {
            for model in models {
                container.mainContext.insert(model)
            }
        }
    }
}

struct Previewer<Content: View>: View {
    let context: Context
    let content: () -> Content
    
    init(
        for types: any PersistentModel.Type...,
        @ViewBuilder content: @escaping () -> Content,
        contextHandler: ((Context) -> Void)? = nil
    ) {
        let schema = Schema(types)
        self.context = Context(schema: schema)
        contextHandler?(context)
        
        self.content = content
    }
    
    var body: some View {
        content()
            .modelContainer(context.container)
    }
}

#Preview {
    Previewer(for: Palette.self) {
        Text(Palette.example.name)
    }
}
