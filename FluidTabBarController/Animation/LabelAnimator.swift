//
//  LabelAnimator.swift
//  FluidTabBarController
//
//  Created by Hubert Kuczyński on 19/07/2018.
//  Copyright © 2018 10Clouds Sp. z o.o.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

final class LabelAnimator {

    // MARK: Private properties

    private let layer: CALayer

    // MARK: Initializers

    init(layer: CALayer) {
        self.layer = layer
    }

    // MARK: Public methods

    func animatePosition(beginTime: CFTimeInterval, duration: CFTimeInterval, toValue: CGFloat) {
        let animation = CAKeyframeAnimation(keyPath: "position.y")
        let startValue = layer.position.y
        let easeIn = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        let easeOut = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animation.timingFunctions = [easeOut, easeIn, easeOut]
        animation.values = [startValue, toValue - toValue * 0.2, toValue + toValue * 0.1, toValue]
        animation.fillMode = CAMediaTimingFillMode.backwards
        animation.beginTime = beginTime
        animation.duration = duration

        layer.add(animation, forKey: "position.y")
        layer.position.y = toValue
    }
}