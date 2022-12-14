//
//  TwoFingerGestureView.swift
//  DragGestureTest
//
//  Created by 민성홍 on 2022/11/24.
//

import SwiftUI

struct TwoFingerGestureView: UIViewRepresentable {
    var numberOfTaps: Int = 1
    let onTap: () -> Void

    func makeCoordinator() -> TwoFingerGestureViewCoordinator {
        return TwoFingerGestureViewCoordinator(numberOfTaps: numberOfTaps, onTap: onTap)
    }

    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        context.coordinator.addGestureToView(view)
        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {

    }
}

class TwoFingerGestureViewCoordinator {
    let onTap: () -> Void
    let numberOfTaps: Int

    init(numberOfTaps: Int, onTap: @escaping () -> Void) {
        self.numberOfTaps = numberOfTaps
        self.onTap = onTap
    }

    func addGestureToView(_ view: UIView) {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tappedWithTwoFingers))
        gesture.numberOfTouchesRequired = 2
        gesture.numberOfTapsRequired = numberOfTaps
        view.addGestureRecognizer(gesture)
    }

    @objc func tappedWithTwoFingers() {
        onTap()
    }
}
