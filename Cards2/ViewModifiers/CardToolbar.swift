//
//  CardToolbar.swift
//  Cards2
//
//  Created by 하진호 on 2022/04/18.
//

import SwiftUI

struct CardToolbar: ViewModifier {
    @Binding var currentModal: CardModal?
    
    func body(content: Content) -> some View {
        content
            .toolbar {
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
                .cardToolbar(currentModal: .constant(.stickerPicker))
        }
    }
}

extension View {
    func cardToolbar(currentModal: Binding<CardModal?>) -> some View {
        modifier(CardToolbar(currentModal: currentModal))
    }
}
