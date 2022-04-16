//
//  Cards2App.swift
//  Cards2
//
//  Created by 하진호 on 2022/04/17.
//

import SwiftUI

@main
struct Cards2App: App {
    @StateObject private var viewState = ViewState()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewState)
        }
    }
}
