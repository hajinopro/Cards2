//
//  CardElementView.swift
//  Cards2
//
//  Created by 하진호 on 2022/04/19.
//

import SwiftUI

struct CardElementView: View {
    let element: CardElement
    let selected: Bool
    
    var body: some View {
        if let element = element as? ImageElement {
            ImageElementView(element: element, selected: selected)
        }
        if let element = element as? TextElement {
            TextElementView(element: element)
                .border(Settings.borderColor, width: selected ? Settings.borderWidth : 0)
        }
    }
}

struct ImageElementView: View {
    let element: ImageElement
    let selected: Bool
    
    var bodyMain: some View {
        element.image
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
    
    var body: some View {
        if let frame = element.frame {
            bodyMain
                .clipShape(frame)
                .overlay(frame.stroke(Settings.borderColor, lineWidth: selected ? Settings.borderWidth : 0))
                .contentShape(frame)
        } else {
            bodyMain
                .border(Settings.borderColor, width: selected ? Settings.borderWidth : 0)
        }
    }
}

struct TextElementView: View {
    let element: TextElement
    
    var body: some View {
        if !element.text.isEmpty {
            Text(element.text)
                .font(.custom(element.textFont, size: 200))
                .foregroundColor(element.textColor)
                .scalableText()
        }
    }
}

struct CardElementView_Previews: PreviewProvider {
    static var previews: some View {
        CardElementView(element: initialCards[0].elements[0], selected: false)
    }
}
