//
//  CardDrop.swift
//  Cards2
//
//  Created by 하진호 on 2022/04/25.
//

import SwiftUI

struct CardDrop: DropDelegate {
    @Binding var card: Card
    
    func performDrop(info: DropInfo) -> Bool {
        let itemProviders = info.itemProviders(for: [.image])
        for item in itemProviders {
            if item.canLoadObject(ofClass: UIImage.self) {
                item.loadObject(ofClass: UIImage.self) { image, error in
                    if let error = error {
                        print("Error!", error.localizedDescription)
                    } else {
                        if let image = image as? UIImage {
                            DispatchQueue.main.async {
                                card.addElement(uiImage: image)
                            }
                        }
                    }
                }
            }
        }
        return true
    }
}
