//
//  CardElement.swift
//  Cards2
//
//  Created by 하진호 on 2022/05/02.
//

import SwiftUI

protocol CardElement {
    var id: UUID { get }
    var transform: Transform { get set }
    
}

struct ImageElement: CardElement {
    let id = UUID()
    var transform = Transform()
    var image: Image
    var frame: AnyShape?
    var imageFilename: String?
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

extension ImageElement: Codable {
    enum CodingKeys: CodingKey {
        case transform, imageFilename, frame
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        transform = try container.decode(Transform.self, forKey: .transform)
        imageFilename = try container.decodeIfPresent(String.self, forKey: .imageFilename)
        if let imageFilename = imageFilename,
           let uiImage = UIImage.load(uuidString: imageFilename) {
            image = Image(uiImage: uiImage)
        } else {
            image = Image("error-image")
        }
        if let index = try container.decodeIfPresent(Int.self, forKey: .frame) {
            frame = Shapes.shapes[index]
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(transform, forKey: .transform)
        try container.encodeIfPresent(imageFilename, forKey: .imageFilename)
        if let index = Shapes.shapes.firstIndex(where: { $0 == frame }) {
            try container.encode(index, forKey: .frame)
        }
    }
}

extension TextElement: Codable {
    enum CodingKeys: CodingKey {
        case transform, text, textColor, textFont
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        transform = try container.decode(Transform.self, forKey: .transform)
        text = try container.decode(String.self, forKey: .text)
        let textColorComponents = try container.decode([CGFloat].self, forKey: .textColor)
        textColor = Color.color(components: textColorComponents)
        textFont = try container.decode(String.self, forKey: .textFont)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(transform, forKey: .transform)
        try container.encode(text, forKey: .text)
        let textColorComponents = textColor.colorComponents()
        try container.encode(textColorComponents, forKey: .textColor)
        try container.encode(textFont, forKey: .textFont)
    }
}
