//
//  CardsView.swift
//  Cards2
//
//  Created by 하진호 on 2022/04/20.
//

import SwiftUI

struct CardsView: View {
    @EnvironmentObject var viewState: ViewState
    @EnvironmentObject var store: CardStore
    var createButton: some View {
        Button(action: {
            viewState.selectedCard = store.addCard()
            viewState.showAllCards = false
        }) {
            Label("Create New", systemImage: "plus")
                .frame(maxWidth: .infinity)
        }
        .font(.system(size: 16, weight: .bold))
        .padding(.vertical, 10)
        .background(Color("barColor"))
        .accentColor(.white)
    }
    
    var body: some View {
        ZStack {
            CardsListView()
            VStack {
                Spacer()
                createButton
                    .padding(.bottom, 5)
            }
            if !viewState.showAllCards {
                SingleCardView()
                    .transition(.move(edge: .bottom))
                    .zIndex(1)
            }
        }
        .background(
            Color("background")
                .edgesIgnoringSafeArea(.all)
        )
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView()
            .environmentObject(ViewState())
            .environmentObject(CardStore(defaultData: true))
    }
}
