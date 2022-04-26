//
//  Shapes.swift
//  Cards2
//
//  Created by 하진호 on 2022/04/26.
//

import SwiftUI

struct Shapes: View {
    let currentShape = Triangle()
    
    var body: some View {
        currentShape
            .aspectRatio(1, contentMode: .fit)
            .background(Color.yellow)
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
            .previewLayout(.sizeThatFits)
    }
}

struct Triangle: Shape {
    
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        var path = Path()
        path.addLines([
            CGPoint(x: width * 0.13, y: height * 0.2),
            CGPoint(x: width * 0.87, y: height * 0.47),
            CGPoint(x: width * 0.4, y: height * 0.93)
        ])
        path.closeSubpath()
        return path
    }
}
