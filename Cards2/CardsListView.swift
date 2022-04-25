//
//  CardsListView.swift
//  Cards2
//
//  Created by 하진호 on 2022/04/17.
//

import SwiftUI

struct CardsListView: View {
    @EnvironmentObject var viewState: ViewState
    @EnvironmentObject var store: CardStore
    
    let gridItems = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: gridItems) {
                ForEach(store.cards) { card in
                    CardThumbnailView(card: card)
                        .contextMenu {
                            Button(action: { store.remove(card) }) {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                        .onTapGesture {
                            viewState.showAllCards.toggle()
                            viewState.selectedCard = card
                        }
                }
            }
        }
    }
}

struct CardsListView_Previews: PreviewProvider {
    static var previews: some View {
        CardsListView()
            .environmentObject(ViewState())
            .environmentObject(CardStore(defaultData: true))
    }
}


