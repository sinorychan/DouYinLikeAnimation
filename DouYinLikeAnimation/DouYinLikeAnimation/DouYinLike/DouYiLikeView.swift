//
//  DouYiLikeView.swift
//  WisdomGuide
//
//  Created by chan on 2019/9/16.
//  Copyright © 2019 BJMHBT. All rights reserved.
//

import UIKit

class DouYiLikeView: UIView {
    
    private let imagWidth = 40.0
    
    var isLike : Bool = false
    
    lazy var likeBeforeImgView : UIImageView = {
        let  imageView = UIImageView(image: UIImage(named:"ic_home_like_before"))
        imageView.frame = CGRect(x: 0, y: 0, width: imagWidth, height: imagWidth)
        return imageView
    }()
    
    lazy var likeAfterImgView : UIImageView = {
        let  imageView = UIImageView(image: UIImage(named:"ic_home_like_after"))
        imageView.frame = CGRect(x: 0, y: 0, width: imagWidth, height: imagWidth)
        return imageView
    }()
    
    lazy var label : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.white
        label.textAlignment = .center 
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(likeBeforeImgView)
        addSubview(likeAfterImgView)
        addSubview(label)
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction(_:)))
        addGestureRecognizer(tap)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var imageCenter = likeBeforeImgView.center
        imageCenter.x = frame.width * 0.5
        likeBeforeImgView.center = imageCenter
        likeAfterImgView.center = imageCenter
        
        label.sizeToFit()
        let labelX = (frame.width - label.frame.width) * 0.5
        let labelY = frame.height - label.frame.height
        label.frame = CGRect(x: labelX, y: labelY, width: label.frame.width, height: label.frame.height)
    }

    /// 点击事件
    ///
    /// - Parameter ges:
    @objc private func tapAction(_ ges : UITapGestureRecognizer) {
        self.startAnimationWithIsLike(!isLike)
    }
    
    /// 设置动画
    ///
    /// - Parameter isLike:
    public func startAnimationWithIsLike(_ isLike: Bool) {
        if self.isLike == isLike { return }
        self.isLike = isLike
        if(isLike) {
            likeBeforeImgView.xy_addRriangleAnimation()
            likeAfterImgView.isHidden = false
            likeAfterImgView.alpha = 0.0
            likeAfterImgView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            
            UIView.animate(withDuration: 0.15, animations: {
                self.likeAfterImgView.transform = self.likeAfterImgView.transform.scaledBy(x: 1.0, y: 1.0)
                self.likeAfterImgView.alpha = 1
                self.likeBeforeImgView.alpha = 0.0
            }) { (finished) in
                self.likeAfterImgView.transform = .identity
                self.likeBeforeImgView.alpha = 1
            }
            
        } else {
            likeAfterImgView.alpha = 1
            likeAfterImgView.xy_sacleAnimation()
        }
    }
    
    /// 设置状态
    ///
    /// - Parameter isLike:
    public func setupLikeState(_ isLike: Bool) {
        self.isLike = isLike
        if isLike {
            likeAfterImgView.isHidden = false
        }else {
            likeAfterImgView.isHidden = true
        }
    }
    
    /// 设置数量
    ///
    /// - Parameter count:
    public func setupLikeCount(_ count: String) {
        label.text = count
        layoutSubviews()
    }
}


