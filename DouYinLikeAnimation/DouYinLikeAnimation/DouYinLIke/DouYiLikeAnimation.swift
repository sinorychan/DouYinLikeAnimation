//
//  DouYiLikeAnimation.swift
//  WisdomGuide
//
//  Created by chan on 2019/9/18.
//  Copyright © 2019 BJMHBT. All rights reserved.
//

import UIKit

struct  DouYiLikeAnimation {
    
    //自定义图片的名字
    static private let imageNanme = "likeHeart"
    //自定义图片的宽度
    static private let width = 80
    //自定义图片的高度
    static private let height = 80
    
    /// 系统的触摸事件 touch
    ///
    /// - Parameter touches:
    static func startWithTouch(_ touches: Set<UITouch>) {
        guard let touch = (touches as NSSet).anyObject() as? UITouch,
            touch .tapCount > 0 else {return}
        
        let point = touch.location(in: touch.view)
        let image = UIImage(named: imageNanme)
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.center = point
        touch.view?.addSubview(imageView)
        imageView.xy_douYinAnimation()
       
    }
    
    /// 点击触发动画
    ///
    /// - Parameter tap:
    static func startAnimationWithTap(_ tap: UITapGestureRecognizer) {
        guard let tapView = tap.view else {return}
        
        let point =  tap.location(in: tapView)
        let image = UIImage(named: imageNanme)
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: width))
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.center = point
        tapView.addSubview(imageView)
        imageView.xy_douYinAnimation()
    }
}



