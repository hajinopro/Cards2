//
//  CardBottomToolbar.swift
//  Cards2
//
//  Created by 하진호 on 2022/04/17.
//

import SwiftUI

struct CardBottomToolbar: View {
    @Binding var cardModal: CardModal?
    
    var body: some View {
        HStack {
            Button(action: { cardModal = .stickerPicker }) {
                ToolbarButtonView()
            }
        }
    }
}

struct ToolbarButtonView: View {
    var body: some View {
        VStack {
            Image(systemName: "heart.circle")
                .font(.largeTitle)
            Text("Sticker")
        }
        .padding(.top)
    }
}

struct CardBottomToolbar_Previews: PreviewProvider {
    static var previews: some View {
        CardBottomToolbar(cardModal: .constant(.stickerPicker))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
