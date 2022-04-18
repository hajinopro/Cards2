//
//  CardsListView.swift
//  Cards2
//
//  Created by 하진호 on 2022/04/17.
//

import SwiftUI

struct CardsListView: View {
    let gridItems = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: gridItems) {
                    ForEach(0 ..< 10) { _ in
                        NavigationLink {
                            CardDetailView()
                        } label: {
                            CardThumbnailView()
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
    }
}


