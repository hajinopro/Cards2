//
//  ContentView.swift
//  Cards2
//
//  Created by 하진호 on 2022/04/17.
//

import SwiftUI

struct LayoutView: View {
    var body: some View {
        GeometryReader { proxy in
            HStack {
                Text("Hello, world!")
                    .background(Color.red)
                Text("Hello, world!")
                    .padding()
                    .background(Color.red)
            }
            .frame(width: proxy.size.width * 0.8)
            .background(Color.gray)
            .padding(.leading, (proxy.size.width - proxy.size.width * 0.8) / 2)
        }
        .background(Color.yellow)
    }
}

struct LayoutView_Previews: PreviewProvider {
    static var previews: some View {
        LayoutView()
            .previewLayout(.fixed(width: 500, height: 300))
    }
}
