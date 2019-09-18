//
//  ViewController.swift
//  DouYinLikeAnimation
//
//  Created by chan on 2019/9/18.
//  Copyright © 2019 BJMHBT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var likeView : DouYiLikeView = {
         let likeView = DouYiLikeView(frame: CGRect(x: 190, y: 200, width: 60, height: 60))
        likeView.setupLikeCount("12.1w")
         return likeView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        view.addSubview(likeView)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /// 处理触摸事件 冲突问题
        guard let touch = (touches as NSSet).anyObject() as? UITouch else {return}
        if touch.tapCount <= 1 {
            super.touchesBegan(touches, with: event)
        } else {
            DouYiLikeAnimation.startWithTouch(touches)
            likeView.startAnimationWithIsLike(true)
        }
    }
}

