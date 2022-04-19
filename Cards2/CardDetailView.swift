//
//  CardDetailView.swift
//  Cards2
//
//  Created by 하진호 on 2022/04/17.
//

import SwiftUI

struct CardDetailView: View {
    @State private var currentModal: CardModal?
    @Binding var card: Card
    
    var content: some View {
        ZStack {
            card.backgroundColor
                .edgesIgnoringSafeArea(.all)
            ForEach(card.elements, id: \.id) { element in
                CardElementView(element: element)
                    .resizableView()
                    //.frame(width: element.transform.size.width, height: element.transform.size.height)
            }
        }
    }
    
    var body: some View {
        content
            .cardToolbar(currentModal: $currentModal)
            .navigationTitle("Photo Collage")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct CardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CardDetailView(card: .constant(initialCards[0]))
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
