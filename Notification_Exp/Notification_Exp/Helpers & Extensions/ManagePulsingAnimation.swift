//
//  ManagePulsingAnimation.swift
//  Notification_Exp
//
//  Created by Shak Feizi on 10/31/21.
//

import UIKit


class ManagePulsingAnimation: CALayer {
    // SHAK: Properties
    var animationGroup = CAAnimationGroup()
    var animationDuration: TimeInterval = 1.5
    var radius: CGFloat = 300
    var numberOfPulses: Float = .infinity
    
    // SHAK: Initializer
    override init(layer: Any) {
        super.init(layer: layer)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(radius: CGFloat, numberOfPulses: Float = .infinity, position: CGPoint) {
        super.init()
        self.backgroundColor = UIColor.black.cgColor
        self.contentsScale = UIScreen.main.scale
        self.opacity = 0
        self.radius = radius
        self.numberOfPulses = numberOfPulses
        self.position = position
    }
    
    // SHAK: Functions
    func scaleAnimation() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "transform.scale.xy")
        animation.fromValue = NSNumber(value: 0)
        animation.toValue = NSNumber(value: 1)
        animation.duration = animationDuration
        return animation
    }
    
    func createOpacityAnimation() -> CAKeyframeAnimation {
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        opacityAnimation.duration = animationDuration
        opacityAnimation.keyTimes = [0, 0.3, 1]
        opacityAnimation.values = [0.4, 0.8, 0]
        return opacityAnimation
    }
}
