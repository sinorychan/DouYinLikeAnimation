# DouYinLikeAnimation
仿写抖音双击点赞动画  红心点赞动画 

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /// 处理触摸事件 处理单击冲突问题
        guard let touch = (touches as NSSet).anyObject() as? UITouch else {return}
        if touch.tapCount <= 1 {
            super.touchesBegan(touches, with: event)
        } else {
            //双击飘心 💗💗
            DouYiLikeAnimation.startWithTouch(touches)
            //红心点赞动画 💥 
            likeView.startAnimationWithIsLike(true)
        }
    }
    
    
    /// 系统的触摸事件 touch
    ///
    /// - Parameter touches:
    internal static func startWithTouch(_ touches: Set<UITouch>)

    /// 点击触发动画
    ///
    /// - Parameter tap:
    internal static func startAnimationWithTap(_ tap: UITapGestureRecognizer)
   
![Image text](https://github.com/sinorychan/DouYinLikeAnimation/blob/master/love.gif)
