//
//  CardThumbnailView.swift
//  Cards2
//
//  Created by 하진호 on 2022/04/17.
//

import SwiftUI

struct CardThumbnailView: View {
    let card: Card
    var size: CGSize = .zero
    
    var body: some View {
        card.backgroundColor
            .cornerRadius(10)
            .frame(width: Settings.thumbnailSize(size: size).width, height: Settings.thumbnailSize(size: size).height)
            .shadow(color: Color("shadow-color"), radius: 3, x: 0, y: 0)
    }
}

struct CardThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        CardThumbnailView(card: initialCards[0], size: CGSize(width: 150, height: 250))
    }
}
