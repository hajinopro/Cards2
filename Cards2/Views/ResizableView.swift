//
//  ResizableView.swift
//  Cards2
//
//  Created by 하진호 on 2022/04/17.
//

import SwiftUI

struct ResizableView: ViewModifier {
    @State private var transform = Transform()
    @State private var previousOffset: CGSize = .zero
    @State private var previousRotation: Angle = .zero
    @State private var scale: CGFloat = 1.0
    
    func body(content: Content) -> some View {
        let dragGesture = DragGesture()
            .onChanged { value in
                transform.offset = value.translation + previousOffset
            }
            .onEnded { _ in
                previousOffset = transform.offset
            }
        
        let rotationGesture = RotationGesture()
            .onChanged { rotation in
                transform.rotation += rotation - previousRotation
                previousRotation = rotation
            }
            .onEnded { _ in
                previousRotation = .zero
            }
        
        let scaleGesture = MagnificationGesture()
            .onChanged { scale in
                self.scale = scale
            }
            .onEnded { scale in
                transform.size = transform.size * scale
                self.scale = 1.0
            }
        
        content
            .frame(width: transform.size.width, height: transform.size.height)
            .rotationEffect(transform.rotation)
            .scaleEffect(scale)
            .offset(transform.offset)
            .gesture(dragGesture)
            .gesture(SimultaneousGesture(rotationGesture, scaleGesture))
    }
}

struct ResizableView_Previews: PreviewProvider {
    static var previews: some View {
        Capsule()
            .foregroundColor(.red)
            .resizableView()
    }
}

extension View {
    func resizableView() -> some View {
        modifier(ResizableView())
    }
}
