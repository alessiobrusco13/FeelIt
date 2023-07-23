//
//  FeelItApp.swift
//  FeelIt
//
//  Created by Alessio Garzia Marotta Brusco on 23/07/23.
//

import SwiftUI

@main
struct FeelItApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    setUpNavigationTitleFont()
                }
        }
    }
    
    func setUpNavigationTitleFont() {
        let appearence = UINavigationBar.appearance()
        
        let largeNavTitleFont = UIFont.systemFont(ofSize: 34, weight: .bold, width: .expanded)
        let largeTitleFontMetrics = UIFontMetrics(forTextStyle: .largeTitle)
        
        let navTitleFont = UIFont.systemFont(ofSize: 17, weight: .semibold, width: .expanded)
        let headlineFontMetrics = UIFontMetrics(forTextStyle: .body)
        
        appearence.largeTitleTextAttributes = [.font: largeTitleFontMetrics.scaledFont(for: largeNavTitleFont)]
        appearence.titleTextAttributes = [.font: headlineFontMetrics.scaledFont(for: navTitleFont)]
    }
}
