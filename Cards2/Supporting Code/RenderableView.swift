//
//  RenderableView.swift
//  Cards2
//
//  Created by 하진호 on 2022/05/05.
//

import SwiftUI

// This is a pass-through ViewBuilder with simple screenshot ability
// It watches viewState.shouldScreenshot, and when it is true,
// it takes a full screenshot.
// It takes a thumbnail screenshot when the view is taken down
// and saves it to documents with the same filename as the card id.

struct RenderableView<Content>: View where Content: View {
    @EnvironmentObject var viewState: ViewState
    
    let content: () -> Content
    @Binding var card: Card
    
    init(
        card: Binding<Card>,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content
        self._card = card
    }
    
    var body: some View {
        content()
        // Share
            .onChange(of: viewState.shouldScreenshot) { _ in
                if viewState.shouldScreenshot {
                    viewState.shouldScreenshot = false
                    card.shareImage = content().screenShot(size: Settings.cardSize)
                }
            }
        // Thumbnail
            .onDisappear {
                DispatchQueue.main.async {
                    if let image = content().screenShot(size: Settings.thumbnailSize(size: Settings.cardSize)) {
                        _ = image.save(to: card.id.uuidString)
                        card.image = image
                    }
                }
            }
    }
}

private extension View {
    func screenShot(size: CGSize) -> UIImage? {
        let controller = UIHostingController(rootView: self)
        guard let renderView = controller.view,
              let window = UIApplication.shared.windows.first else { return nil }
        renderView.frame = CGRect(x: 0, y: CGFloat(Int.max), width: 1, height: 1)
        window.rootViewController?.view.addSubview(renderView)
        
        let viewSize = controller.sizeThatFits(in: size)
        renderView.bounds = CGRect(origin: .zero, size: viewSize)
        renderView.sizeToFit()
        
        let image = UIGraphicsImageRenderer(bounds: renderView.bounds).image { _ in
            renderView.drawHierarchy(in: renderView.bounds, afterScreenUpdates: true)
        }
        renderView.removeFromSuperview()
        return image.resize(to: size)
    }
}

