//
//  Shapes.swift
//  DragGestureTest
//
//  Created by 민성홍 on 2022/11/23.
//

import SwiftUI

final class Shapes {
    static func getRandomShape() -> AnyView {
        AnyView(shape())
    }

    static func getRandomColor() -> Color {
        [
            .blue,
            .purple,
            .orange,
            .red,
            .green,
            .yellow,
            .pink
        ]
            .randomElement() ?? .black
    }

    @ViewBuilder
    static func shape() -> some View {
        let random = Int.random(in: 1 ... 4)

        if random == 1 {
            Circle()
                .fill(getRandomColor())
                .frame(width: 100, height: 100)
        } else if random == 2 {
            Rectangle()
                .fill(getRandomColor())
                .frame(width: 100, height: 100)
        } else if random == 3 {
            Rectangle()
                .fill(getRandomColor())
                .frame(width: 150, height: 100)
        } else if random == 4 {
            Triangle()
                .fill(getRandomColor())
                .frame(width: 150, height: 100)
        }
    }
}
