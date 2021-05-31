//
//  MathematicsFunction.swift
//  
//
//  Created by 永田大祐 on 2021/06/01.
//

import UIKit

public class MathematicsFunction {
    var horizonal: CGPoint
    var vertical: CGPoint

    init(h: CGPoint, v: CGPoint) {
        horizonal = h
        vertical = v
    }

    public func angle(a: CGPoint, b: CGPoint) -> Double {
        var r = atan2(b.y - a.y, b.x - a.x)
        if r < 0 {
            r = r + CGFloat(2 * Double.pi)
        }
        return Double(r * 360 / CGFloat(2 * Double.pi))
    }

    public func angleLength( p1: CGPoint, _ p2: MathematicsFunction) -> CGFloat {
        return sqrt(pow(p1.x - p2.horizonal.x, 2) + pow(p1.y - p2.vertical.y, 2))
    }

    public func distance(a: CGPoint, b: CGPoint) -> Double {
        return sqrt(Double(pow(b.x - a.x, 2) + pow(b.y - a.y, 2)))
    }

    public func coordinate(cg: Double)->(Double, Double, Double) {
        let radian: Double = cg * Double.pi / 180
        return(sin(radian), cos(radian) , tan(radian))
    }
}
