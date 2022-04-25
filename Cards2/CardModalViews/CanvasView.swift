//
//  PencilPicker.swift
//  Cards2
//
//  Created by 하진호 on 2022/04/25.
//

import SwiftUI
import PencilKit

struct CanvasView: UIViewRepresentable {
    @Binding var canvas: PKCanvasView
    @Binding var pencilImage: UIImage?
    var toolPicker = PKToolPicker()
    
    func makeUIView(context: Context) -> PKCanvasView {
        canvas.drawingPolicy = .anyInput
        canvas.tool = PKInkingTool(.pen, color: .gray, width: 10)
        toolPicker.setVisible(true, forFirstResponder: canvas)
        toolPicker.addObserver(canvas)
        canvas.becomeFirstResponder()
        canvas.delegate = context.coordinator
        return canvas
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        
    }
    
    func makeCoordinator() -> PencilCoordinator {
        PencilCoordinator(parent: self)
    }
    
    class PencilCoordinator: NSObject, PKCanvasViewDelegate {
        let parent: CanvasView
        
        init(parent: CanvasView) {
            self.parent = parent
        }
        
        func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
            if !canvasView.drawing.bounds.isEmpty {
                let uiImage = canvasView.drawing.image(from: canvasView.bounds, scale: 1.0)
                parent.pencilImage = uiImage
            }
        }
        
        func canvasViewDidFinishRendering(_ canvasView: PKCanvasView) {
            
        }
    }
}

struct CanvasView_Previews: PreviewProvider {
    static var previews: some View {
        CanvasView(canvas: .constant(PKCanvasView()), pencilImage: .constant(UIImage()))
    }
}
