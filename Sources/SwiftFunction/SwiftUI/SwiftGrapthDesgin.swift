//
//  SwiftDesideGraphView.swift
//
//
//  Created by 永田大祐 on 2021/10/09.
//

import SwiftUI

@available(iOS 15.0, *)
struct SwiftDesideGraphView: View {

    var body: some View {
        Path { path in
            
            path.move(to: CGPoint(x: 45,
                                  y: 250))

            path.addArc(center: CGPoint(x: 50,
                                        y: 250),
                        radius: 5,
                        startAngle: Angle(degrees: 0),
                        endAngle: Angle(degrees: 360),
                        clockwise: false)

            path.addLine(to: CGPoint(x: 100,
                                     y: 200))

            path.addArc(center: CGPoint(x: 100,
                                        y: 200),
                        radius: 5,
                        startAngle: Angle(degrees: 0),
                        endAngle: Angle(degrees: 360),
                        clockwise: false)

            path.addLine(to: CGPoint(x: 150,
                                     y: 143))

            path.addArc(center: CGPoint(x: 150,
                                        y: 143),
                        radius: 5,
                        startAngle: Angle(degrees: 0),
                        endAngle: Angle(degrees: 360),
                        clockwise: false)

            path.addLine(to: CGPoint(x: 200,
                                     y: 150))

            path.addArc(center: CGPoint(x: 200,
                                        y: 150),
                        radius: 5,
                        startAngle: Angle(degrees: 0),
                        endAngle: Angle(degrees: 360),
                        clockwise: false)

            path.addLine(to: CGPoint(x: 250,
                                     y: 120))

            path.addArc(center: CGPoint(x: 250,
                                        y: 120),
                        radius: 5,
                        startAngle: Angle(degrees: 0),
                        endAngle: Angle(degrees: 360),
                        clockwise: false)

            path.addLine(to: CGPoint(x: 300,
                                     y: 124))

            path.addArc(center: CGPoint(x: 300,
                                        y: 124),
                        radius: 5,
                        startAngle: Angle(degrees: 0),
                        endAngle: Angle(degrees: 360),
                        clockwise: false)

            path.addLine(to: CGPoint(x: 350,
                                     y: 65))

            path.addArc(center: CGPoint(x: 350,
                                        y: 65),
                        radius: 5,
                        startAngle: Angle(degrees: 0),
                        endAngle: Angle(degrees: 360),
                        clockwise: false)
        }
        .stroke(Color.blue, lineWidth: 5)
    }
}

@available(iOS 15.0, *)
struct SwiftDesideGraphView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftDesideGraphView()
    }
}
