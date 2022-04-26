//
//  PreviewData.swift
//  Cards2
//
//  Created by 하진호 on 2022/04/18.
//

import SwiftUI

let initialCards: [Card] = [
    Card(backgroundColor: .green, elements: initialElements),
    Card(backgroundColor: .orange),
    Card(backgroundColor: .red),
    Card(backgroundColor: .purple),
    Card(backgroundColor: .yellow)
]

let initialElements: [CardElement] = [
    ImageElement(
        transform: Transform(
            size: CGSize(width: 412, height: 296),
            rotation: .init(degrees: -6),
            offset: CGSize(width: 4, height: -137)),
        image: Image("giraffe")),
    TextElement(
        transform: Transform(
            size: Settings.defaultElementSize * 1.2,
            offset: CGSize(width: 12, height: 81)),
        text: "Snack time!",
        textColor: .yellow)
]
