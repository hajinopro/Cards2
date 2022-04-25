//
//  ViewState.swift
//  Cards2
//
//  Created by 하진호 on 2022/04/17.
//

import SwiftUI

class ViewState: ObservableObject {
    @Published var showAllCards = true {
        didSet {
            if showAllCards {
                selectedCard = nil
            }
        }
    }
    var selectedCard: Card?
    
    convenience init(card: Card) {
        self.init()
        showAllCards = false
        selectedCard = card
    }
}
