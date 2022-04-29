//
//  TextExtensions.swift
//  Cards2
//
//  Created by 하진호 on 2022/04/18.
//

import SwiftUI

extension Text {
    func scalableText(font: Font = Font.system(size: 1000)) -> some View {
        self
            .font(font)
            .minimumScaleFactor(0.01)
            .lineLimit(1)
    }
}
