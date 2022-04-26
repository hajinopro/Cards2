//
//  CardBottomToolbar.swift
//  Cards2
//
//  Created by 하진호 on 2022/04/17.
//

import SwiftUI

struct CardBottomToolbar: View {
    @EnvironmentObject var viewState: ViewState
    @Binding var cardModal: CardModal?
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            Button(action: { cardModal = .photoPicker }) {
                ToolbarButtonView(modal: .photoPicker)
            }
            Button(action: { cardModal = .framePicker }) {
                ToolbarButtonView(modal: .framePicker)
            }
            .disabled(viewState.selectedElement == nil || viewState.selectedElement is TextElement)
            Button(action: { cardModal = .stickerPicker }) {
                ToolbarButtonView(modal: .stickerPicker)
            }
            Button(action: { cardModal = .textPicker }) {
                ToolbarButtonView(modal: .textPicker)
            }
            Button(action: { cardModal = .pencilPicker }) {
                ToolbarButtonView(modal: .pencilPicker)
            }
        }
    }
}

struct CardBottomToolbar_Previews: PreviewProvider {
    static var previews: some View {
        CardBottomToolbar(cardModal: .constant(.stickerPicker))
            .environmentObject(ViewState())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

struct ToolbarButtonView: View {
    let modal: CardModal
    private let modalButton: [CardModal: (text: String, imageName: String)] = [
        .photoPicker: ("Photos", "photo"),
        .framePicker: ("Frame", "square.on.circle"),
        .stickerPicker: ("Sticker", "heart.circle"),
        .textPicker: ("Text", "textformat"),
        .pencilPicker: ("Pencil", "pencil")
    ]
    
    var body: some View {
        if let text = modalButton[modal]?.text,
           let imageName = modalButton[modal]?.imageName {
            VStack {
                Image(systemName: imageName)
                    .font(.largeTitle)
                Text(text)
            }
            .padding(.top)
        }
    }
}
