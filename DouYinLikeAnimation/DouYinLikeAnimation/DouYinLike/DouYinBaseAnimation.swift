//
//  DouYinBaseAnimation.swift
//  WisdomGuide
//
//  Created by chan on 2019/9/18.
//  Copyright © 2019 BJMHBT. All rights reserved.
//

import UIKit

protocol DouYinBaseAnimation {
    
    /// 抖音触摸点赞
    func xy_douYinAnimation()
    
    /// 向上 放大 漂移 透明
    func xy_topAnimation()
    
    /// 向四周炸开三角 
    func xy_addRriangleAnimation()
    
    /// 缩小 消失
    func xy_sacleAnimation()
}

extension UIView : DouYinBaseAnimation {}

extension  DouYinBaseAnimation where Self : UIView {
    
    /// 抖音触摸点赞
    func xy_douYinAnimation() {
        //左右随机显示
        var leftOrRight = Int(arc4random() % 2)
        leftOrRight = leftOrRight == 1 ? leftOrRight : -1
        transform = transform.rotated(by: CGFloat(Double.pi/9.00  * Double(leftOrRight)))
        
        // 出现的时候回弹一下
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = self.transform.scaledBy(x: 1.2, y: 1.2)
        }) { (finished) in
            self.transform = self.transform.scaledBy(x: 0.8, y: 0.8)
            //放大漂移
            self.xy_topAnimation()
        }
    }
    
    /// 向上 放大 漂移 透明
    func xy_topAnimation() {
        
        UIView.animate(withDuration: 1.0, delay: 0.3, options: .allowUserInteraction, animations: {
            var viewRect = self.frame
            viewRect.origin.y -= 100
            self.frame = viewRect
            self.transform = self.transform.scaledBy(x: 1.8, y: 1.8)
            self.alpha = 0
        }) { (finished) in
            self.removeFromSuperview()
        }
    }
    
    /// 向四周炸开三角
    func xy_addRriangleAnimation() {
        let length = 30.0
        let duration = 0.5
        for i in 0 ..< 6 {
            let layer = CAShapeLayer()
            layer.position = center
            layer.fillColor = UIColor(red: 231.0/255.0, green: 50.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
            let startPath = UIBezierPath()
            startPath.move(to: CGPoint(x: -2, y: -length))
            startPath.addLine(to: CGPoint(x: 2, y: -length))
            startPath.addLine(to: CGPoint(x: 0, y: 0))
            layer.path = startPath.cgPath
            
            layer.transform = CATransform3DMakeRotation(CGFloat(Double.pi / 3.0 * Double(i)), 0, 0, 1.0)
            superview?.layer.addSublayer(layer)
            
            let group = CAAnimationGroup()
            group.isRemovedOnCompletion = false
            group.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            group.fillMode = .forwards
            group.duration = duration
            
            let scaleAnim = CABasicAnimation(keyPath: "transform.scale")
            scaleAnim.fromValue = 0.0
            scaleAnim.toValue = 1.0
            scaleAnim.duration = duration * 0.2
            
            let endPath = UIBezierPath()
            endPath.move(to: CGPoint(x: -2, y: -length))
            endPath.addLine(to: CGPoint(x: 2, y: -length))
            endPath.addLine(to: CGPoint(x: 0, y: -length))
            
            let pathAnim = CABasicAnimation(keyPath: "path")
            pathAnim.fromValue = layer.path
            pathAnim.toValue = endPath.cgPath
            pathAnim.beginTime = duration * 0.2
            pathAnim.duration = duration * 0.8
            
            group.animations = [scaleAnim, pathAnim]
            layer.add(group, forKey: nil)
        }
    }
    
    /// 缩小 消失
    func xy_sacleAnimation() {
        transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        UIView.animate(withDuration: 0.15, animations: {
            self.transform = self.transform.scaledBy(x: 0.3, y: 0.3)
        }) { (finished) in
            self.transform = .identity
            self.isHidden = true
        }
    }
}
