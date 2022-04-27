//
//  CardDetailView.swift
//  Cards2
//
//  Created by 하진호 on 2022/04/17.
//

import SwiftUI

struct CardDetailView: View {
    @EnvironmentObject var viewState: ViewState
    @State private var currentModal: CardModal?
    @Binding var card: Card
    @State private var stickerImage: UIImage?
    @State private var images: [UIImage] = []
    @State private var pencilImage: UIImage?
    @State private var frame: AnyShape?
    
    var content: some View {
        ZStack {
            card.backgroundColor
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    viewState.selectedElement = nil
                }
            ForEach(card.elements, id: \.id) { element in
                CardElementView(element: element, selected: viewState.selectedElement?.id == element.id)
                    .contextMenu {
                        Button(action: { card.remove(element) }) {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                    .resizableView(transform: bindingTransform(for: element))
                    .frame(width: element.transform.size.width, height: element.transform.size.height)
                    .onTapGesture {
                        viewState.selectedElement = element
                    }
            }
        }
    }
    
    func bindingTransform(for element: CardElement) -> Binding<Transform> {
        guard let index = element.index(in: card.elements) else { fatalError("Element does not exist") }
        return $card.elements[index].transform
    }
    
    var body: some View {
        content
            .onDrop(of: [.image], delegate: CardDrop(card: $card))
            .cardToolbar(currentModal: $currentModal)
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
                default:
                    EmptyView()
                }
            }
    }
}

struct CardDetailView_Previews: PreviewProvider {
    struct CardDtailViewPreview: View {
        @State private var card = initialCards[0]
        var body: some View {
            CardDetailView(card: $card)
                .environmentObject(ViewState(card: card))
        }
    }
    static var previews: some View {
        CardDtailViewPreview()
    }
}
