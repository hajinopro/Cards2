//
//  PencilPicker.swift
//  Cards2
//
//  Created by 하진호 on 2022/04/25.
//

import SwiftUI
import PencilKit

struct PencilPicker: View {
    @State private var canvasView = PKCanvasView()
    @Binding var pencilImage: UIImage?
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            CanvasView(canvas: $canvasView, pencilImage: $pencilImage)
                .toolbar {
                    ToolbarItem {
                        HStack {
                            Button("Done") {
                                dismiss()
                            }
                            Button(action: {
                                pencilImage = nil
                                canvasView.drawing = PKDrawing()
                            }) {
                                Image(systemName: "trash")
                            }
                        }
                    }
            }
        }
    }
}

struct PencilPicker_Previews: PreviewProvider {
    static var previews: some View {
        PencilPicker(pencilImage: .constant(UIImage()))
    }
}
