//
//  Card.swift
//  Cards2
//
//  Created by 하진호 on 2022/04/19.
//

import SwiftUI

struct Card: Identifiable {
    let id = UUID()
    var backgroundColor: Color = .yellow
    var elements: [CardElement] = []
    
    mutating func remove(_ element: CardElement) {
        if let index = element.index(in: elements) {
            elements.remove(at: index)
        }
    }
    
    mutating func addElement(uiImage: UIImage) {
        let image = Image(uiImage: uiImage)
        let element = ImageElement(image: image)
        elements.append(element)
    }
}

protocol CardElement {
    var id: UUID { get }
    var transform: Transform { get set }
    
}

struct ImageElement: CardElement {
    let id = UUID()
    var transform = Transform()
    var image: Image
}

struct TextElement: CardElement {
    let id = UUID()
    var transform = Transform()
    var text = ""
    var textColor = Color.black
    var textFont = "San Fransisco"
}

extension CardElement {
    func index(in array: [CardElement]) -> Int? {
        array.firstIndex { $0.id == id }
    }
}
