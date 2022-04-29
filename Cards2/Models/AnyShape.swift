//
//  AnyShape.swift
//  Cards2
//
//  Created by 하진호 on 2022/04/27.
//

import SwiftUI

struct AnyShape: Shape {
    let path: (CGRect) -> Path
    
    init<CustomShape>(_ shape: CustomShape) where CustomShape: Shape {
        self.path = { rect in
            shape.path(in: rect)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        path(rect)
    }
}

extension AnyShape: Equatable {
    static func == (lhs: AnyShape, rhs: AnyShape) -> Bool {
        let rect = CGRect(origin: .zero, size: CGSize(width: 100, height: 100))
        let lhsPath = lhs.path(in: rect)
        let rhsPath = rhs.path(in: rect)
        return lhsPath == rhsPath
    }
}

//struct NewAnyView: View {
//    let content: some View
//
//    init<CustomView>(_ view: CustomView) where CustomView: View {
//        self.content = view
//    }
//
//    var body: some View {
//        content
//    }
//}
