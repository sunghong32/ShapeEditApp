//
//  OffsetOpacityModifier.swift
//  DragGestureTest
//
//  Created by 민성홍 on 2022/11/24.
//

import SwiftUI

struct OffsetOpacityModifier: ViewModifier {
    let offset: CGPoint
    let opacity: Double

    func body(content: Content) -> some View {
        content
            .offset(x: offset.x, y: offset.y)
            .opacity(opacity)
    }
}

