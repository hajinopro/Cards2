//
//  TextPicker.swift
//  Cards2
//
//  Created by 하진호 on 2022/04/30.
//

import SwiftUI

struct TextPicker: View {
    @Binding var textElement: TextElement
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        TextField("Enter text", text: $textElement.text) {
            dismiss()
        }
    }
}

struct TextPicker_Previews: PreviewProvider {
    static var previews: some View {
        TextPicker(textElement: .constant(TextElement()))
    }
}
