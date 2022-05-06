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
        GeometryReader { proxy in
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns(size: proxy.size)) {
                    ForEach(store.cards) { card in
                        CardThumbnailView(card: card, size: proxy.size)
                            .contextMenu {
                                Button(action: { store.remove(card) }) {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                            .onTapGesture {
                                withAnimation {
                                    viewState.showAllCards.toggle()
                                }
                                viewState.selectedCard = card
                            }
                    }
                }
            }
        }
    }
    
    func columns(size: CGSize) -> [GridItem] {
        [GridItem(.adaptive(minimum: Settings.thumbnailSize(size: size).width))]
    }
}

struct CardsListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardsListView()
                .environmentObject(ViewState())
            .environmentObject(CardStore(defaultData: true))
            CardsListView()
                .previewDevice("iPad Pro (11-inch) (3rd generation)")
                .environmentObject(ViewState())
                .environmentObject(CardStore(defaultData: true))
        }
    }
}


