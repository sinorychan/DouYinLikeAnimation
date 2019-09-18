# DouYinLikeAnimation
仿写抖音喜欢点赞动画 支持单击 屏幕触摸 支持自定义图片

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /// 处理触摸事件 处理单击冲突问题
        guard let touch = (touches as NSSet).anyObject() as? UITouch else {return}
        if touch.tapCount <= 1 {
            super.touchesBegan(touches, with: event)
        } else {
            //飘 💗💗
            DouYiLikeAnimation.startWithTouch(touches)
            //点赞视图 三角爆炸效果 💥 
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
