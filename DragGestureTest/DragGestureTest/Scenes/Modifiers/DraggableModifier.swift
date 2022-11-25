//
//  DraggableModifier.swift
//  DragGestureTest
//
//  Created by 민성홍 on 2022/11/23.
//

import SwiftUI

struct DraggableModifier: ViewModifier {
    @State private var offset: CGPoint = .zero
    @State private var previousTranslation: CGSize?

    func body(content: Content) -> some View {
        content
            .offset(x: offset.x, y: offset.y)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        if let translation = previousTranslation {
                            let delta = CGSize(
                                width: value.translation.width - translation.width,
                                height: value.translation.height - translation.height
                            )

                            offset.x += delta.width
                            offset.y += delta.height
                            previousTranslation = value.translation
                        } else {
                            previousTranslation = value.translation
                        }
                    }
                    .onEnded { _ in
                        previousTranslation = nil
                    }
            )
    }
}

extension View {
    func draggable() -> some View {
        self
            .modifier(DraggableModifier())
    }
}
