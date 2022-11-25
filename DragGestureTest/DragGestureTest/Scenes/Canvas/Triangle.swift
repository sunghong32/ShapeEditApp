//
//  Triangle.swift
//  DragGestureTest
//
//  Created by 민성홍 on 2022/11/23.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0.0, y: rect.height))
        path.addLine(to: CGPoint(x: rect.width / 2 , y: 0.0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.closeSubpath()
        return path
    }
}

struct Triangle_Previews: PreviewProvider {
    static var previews: some View {
        Triangle()
    }
}
