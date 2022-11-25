//
//  ContentView.swift
//  DragGestureTest
//
//  Created by 민성홍 on 2022/11/22.
//

import SwiftUI

struct ContentView: View {
    @State private var location: CGPoint = CGPoint(x: 200, y: 400)
    @State private var inputText: String = ""
    @State private var borderOpacity: Bool = false
    @State private var currentAmount = 0.0
    @State private var finalAmount = 1.0
//    @GestureState var magnifyBy = 1.0

    private var simpleDrag: some Gesture {
        DragGesture()
            .onChanged { value in
                self.location = value.location
                borderOpacity = true
            }
            .onEnded { _ in
                borderOpacity = false
            }
    }

    private var magnification: some Gesture {
        MagnificationGesture()
//            .updating($finalAmount) { currentState, gestureState, transaction in
//                gestureState = currentState.magnitude
//            }
            .onChanged { amount in
                borderOpacity = true
                currentAmount = amount - 1
            }
            .onEnded { _ in
                borderOpacity = false
                finalAmount += currentAmount
                currentAmount = 0
            }
    }

    var body: some View {
        ZStack {
            TextField("입력해주세요", text: $inputText)
                .padding(.horizontal, 16)
                .frame(width: 300, height: 200)
                .border(
                    .gray
                )

            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 100, height: 100)
                    .border(
                        .gray
                    )
                    .position(location)
                    .opacity(borderOpacity ? 1 : 0)

                Circle()
                    .foregroundColor(.blue)
                    .frame(width: 100, height: 100)
                    .position(location)
                    .gesture(
                        simpleDrag
                    )
                    .onTapGesture {
                        borderOpacity.toggle()
                    }
            }
            .scaleEffect(finalAmount + currentAmount)
            .simultaneousGesture(
                magnification
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
