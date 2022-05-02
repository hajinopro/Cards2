//
//  CardModalViews.swift
//  Cards2
//
//  Created by 하진호 on 2022/05/02.
//

import SwiftUI

struct CardModals: ViewModifier {
    @EnvironmentObject var viewState: ViewState
    @Binding var currentModal: CardModal?
    @Binding var card: Card
    @State private var stickerImage: UIImage?
    @State private var images: [UIImage] = []
    @State private var pencilImage: UIImage?
    @State private var frame: AnyShape?
    @State private var textElement = TextElement()
    
    func body(content: Content) -> some View {
        content
            .sheet(item: $currentModal) { item in
                switch item {
                case .stickerPicker:
                    StickerPicker(stickerImage: $stickerImage)
                        .onDisappear {
                            if let stickerImage = stickerImage {
                                card.addElement(uiImage: stickerImage)
                            }
                            stickerImage = nil
                        }
                case .photoPicker:
                    PhotoPicker(images: $images)
                        .onDisappear {
                            for image in images {
                                card.addElement(uiImage: image)
                            }
                            images = []
                        }
                case .pencilPicker:
                    PencilPicker(pencilImage: $pencilImage)
                        .onDisappear {
                            if let pencilImage = pencilImage {
                                card.addElement(uiImage: pencilImage)
                            }
                            pencilImage = nil
                        }
                case .framePicker:
                    FramePicker(frame: $frame)
                        .onDisappear {
                            if let frame = frame {
                                card.update(viewState.selectedElement, frame: frame)
                            }
                            frame = nil
                        }
                case .textPicker:
                    TextPicker(textElement: $textElement)
                        .onDisappear {
                            if !textElement.text.isEmpty {
                                card.addElement(textElement: textElement)
                                textElement = TextElement()
                            }
                        }
                }
            }
        
    }
}

struct CardModals_Previews: PreviewProvider {
    static var previews: some View {
        Color.yellow
            .cardModals(currentModal: .constant(.stickerPicker), card: .constant(initialCards[0]))
    }
}

extension View {
    func cardModals(currentModal: Binding<CardModal?>, card: Binding<Card>) -> some View {
        modifier(CardModals(currentModal: currentModal, card: card))
    }
}
