//
//  CardModal.swift
//  Cards2
//
//  Created by 하진호 on 2022/04/17.
//

import SwiftUI

enum CardModal: Identifiable {
    var id: Int {
        hashValue
    }
    case photoPicker, framePicker, stickerPicker, textPicker, pencilPicker
}
