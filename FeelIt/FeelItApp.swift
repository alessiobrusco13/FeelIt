//
//  FeelItApp.swift
//  FeelIt
//
//  Created by Alessio Garzia Marotta Brusco on 23/07/23.
//

import SwiftUI

@main
struct FeelItApp: App {
    #if DEBUG
    @State private var showingDebug = false
    #endif
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                #if !os(macOS)
                .onAppear {
                    setUpNavigationTitleFont()
                }
                #endif
                #if DEBUG
                .gesture(
                    TapGesture(count: 3)
                        .onEnded { _ in
                            showingDebug.toggle()
                        }
                )
                .sheet(isPresented: $showingDebug) {
                    DebugView()
                }
                #endif
                .feelItModelContainer()
        }
    }
    
    #if !os(macOS)
    @MainActor func setUpNavigationTitleFont() {
        let appearance = UINavigationBar.appearance()
        
        let largeNavTitleFont = UIFont.systemFont(ofSize: 34, weight: .bold, width: .expanded)
        let largeTitleFontMetrics = UIFontMetrics(forTextStyle: .largeTitle)
        
        let navTitleFont = UIFont.systemFont(ofSize: 17, weight: .semibold, width: .expanded)
        let headlineFontMetrics = UIFontMetrics(forTextStyle: .body)
        
        appearance.largeTitleTextAttributes = [.font: largeTitleFontMetrics.scaledFont(for: largeNavTitleFont)]
        appearance.titleTextAttributes = [.font: headlineFontMetrics.scaledFont(for: navTitleFont)]
    }
    #endif
}
