//
//  CardDetailView.swift
//  Cards2
//
//  Created by 하진호 on 2022/04/17.
//

import SwiftUI

struct CardDetailView: View {
    @State private var currentModal: CardModal?
    
    var content: some View {
        ZStack {
            Capsule()
                .foregroundColor(.yellow)
                .resizableView()
            Text("Resize Me!")
                .fontWeight(.bold)
                .font(.system(size: 500))
                .minimumScaleFactor(0.01)
                .lineLimit(1)
                .resizableView()
            Circle()
                .resizableView()
                .offset(CGSize(width: 50, height: 200))
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
            CardDetailView()
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
