//
//  CardDetailView.swift
//  Cards2
//
//  Created by 하진호 on 2022/04/17.
//

import SwiftUI

struct CardDetailView: View {
    @EnvironmentObject var viewState: ViewState
    @Binding var card: Card
    @State private var currentModal: CardModal?
    @Environment(\.scenePhase) private var scenePhase
    
    func content(size: CGSize) -> some View {
        ZStack {
            card.backgroundColor
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
                    .resizableView(transform: bindingTransform(for: element), viewScale: calculateScale(size))
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
        GeometryReader { proxy in
            content(size: proxy.size)
                .onChange(of: scenePhase, perform: { newValue in
                    if newValue == .inactive {
                        card.save()
                    }
                })
                .onDisappear {
                    card.save()
                }
                .onDrop(of: [.image], delegate: CardDrop(card: $card, size: proxy.size, frame: proxy.frame(in: .global)))
                .cardToolbar(currentModal: $currentModal)
                .cardModals(currentModal: $currentModal, card: $card)
                .frame(width: calculateSize(proxy.size).width, height: calculateSize(proxy.size).height)
                .clipped()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    func calculateSize(_ size: CGSize) -> CGSize {
        var newSize = size
        let ratio = Settings.cardSize.width / Settings.cardSize.height
        
        if size.width < size.height  { // Portrait Mode
            newSize.height = size.width / ratio
        } else { // Landscape Mode
            newSize.width = size.height * ratio
        }
        return newSize
    }
    
    func calculateScale(_ size: CGSize) -> CGFloat {
        let newSize = calculateSize(size)
        return newSize.width / Settings.cardSize.width
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
        Group {
            CardDtailViewPreview()
            CardDtailViewPreview()
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
