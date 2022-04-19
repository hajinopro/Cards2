//
//  CardsListView.swift
//  Cards2
//
//  Created by 하진호 on 2022/04/17.
//

import SwiftUI

struct CardsListView: View {
    @EnvironmentObject var store: CardStore
    
    let gridItems = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: gridItems) {
                    ForEach(store.cards) { card in
                        NavigationLink {
                            if let index = store.index(for: card) {
                                CardDetailView(card: $store.cards[index])
                            }
                        } label: {
                            CardThumbnailView(card: card)
                        }
                    }
                }
            }
            .navigationTitle("Photos")
        }
        .navigationViewStyle(.stack)
    }
}

struct CardsListView_Previews: PreviewProvider {
    static var previews: some View {
        CardsListView()
            .environmentObject(CardStore(defaultData: true))
    }
}


