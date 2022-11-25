//
//  ContentView2.swift
//  DragGestureTest
//
//  Created by 민성홍 on 2022/11/23.
//

import SwiftUI

struct ContentView2: View {
    @State private var shapes: [AnyView] = []

    var body: some View {
        ZStack {
            Rectangle()
                .fill(.clear)

            TwoFingerGestureView(numberOfTaps: 2) {
                withAnimation {
                    shapes = []
                }
            }

            ForEach(shapes.indices, id: \.self) {
                shapes[$0]
                    .draggableAndScaleable()
                    .transition(
                        .modifier(
                            active: OffsetOpacityModifier(
                                offset: getRandomOffset(),
                                opacity: 1.0
                            ),
                            identity: OffsetOpacityModifier(
                                offset: .zero,
                                opacity: 1.0
                            )
                        )
                    )
            }
        }
        .contentShape(Rectangle())
        .onTapGesture(count: 2) {
            shapes.append(
                Shapes.getRandomShape()
            )
        }
    }

    func getRandomOffset() -> CGPoint {
        return CGPoint(x: .random(in: -500 ... 500 ), y: .random(in: -500 ... 500 ))
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
