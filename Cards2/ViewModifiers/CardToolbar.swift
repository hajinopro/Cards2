//
//  CardToolbar.swift
//  Cards2
//
//  Created by 하진호 on 2022/04/18.
//

import SwiftUI

struct CardToolbar: ViewModifier {
    @EnvironmentObject var viewState: ViewState
    @Binding var currentModal: CardModal?
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        withAnimation {
                            viewState.showAllCards.toggle()
                        }
                    }) {
                        Text("Done")
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    CardBottomToolbar(cardModal: $currentModal)
                }
            }
    }
}

struct CardToolbar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Color.green
                .environmentObject(ViewState())
                .cardToolbar(currentModal: .constant(.stickerPicker))
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

extension View {
    func cardToolbar(currentModal: Binding<CardModal?>) -> some View {
        modifier(CardToolbar(currentModal: currentModal))
    }
}
