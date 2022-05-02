//
//  Cards2App.swift
//  Cards2
//
//  Created by 하진호 on 2022/04/17.
//

import SwiftUI

@main
struct Cards2App: App {
    @StateObject var viewState = ViewState()
    @StateObject var store = CardStore(defaultData: true)
    
    var body: some Scene {
        WindowGroup {
            CardsView()
                .environmentObject(viewState)
                .environmentObject(store)
                .onAppear {
                    print(FileManager.documentURL ?? "")
                }
        }
    }
}
