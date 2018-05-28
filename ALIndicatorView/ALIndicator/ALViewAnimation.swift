//
//  ALView.swift
//  ProvaAnimation
//
//  Created by Antonio Alessandro Chillura on 25/05/18.
//  Copyright © 2018 Antonio Alessandro Chillura. All rights reserved.
//

import UIKit

@IBDesignable
class ALViewAnimation: UIView {
    
    @IBOutlet weak var viewOne:UIView!
    @IBOutlet weak var viewTwo:UIView!
    @IBOutlet weak var viewThree:UIView!
    
    private let durationAnimation:TimeInterval = 0.3
    private let staleTransform:CGFloat = 1.3
    
    private var stopAnimationFlag:Bool = false
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var isCircle: Bool {
        get {
            return layer.cornerRadius == self.frame.height/2
        }
        set {
            layer.cornerRadius = self.frame.height/2
            layer.masksToBounds = layer.cornerRadius > 0
        }
    }
    
    func startAnimation() {
        stopAnimationFlag = false
        
        UIView.animate(withDuration: 0.0,
                       animations: {
                        self.viewOne.transform = CGAffineTransform(scaleX: self.staleTransform, y: self.staleTransform)
        },
                       completion: { _ in
                        UIView.animate(withDuration: self.durationAnimation) {
                            self.viewOne.transform = CGAffineTransform.identity

                            self.startViewTwo()
                        }
        })
    }
    
    func stopAnimation() {
        stopAnimationFlag = true
    }
    
    private func startViewTwo() {
        UIView.animate(withDuration: 0.0,
                       animations: {
                        self.viewTwo.transform = CGAffineTransform(scaleX: self.staleTransform, y: self.staleTransform)
        },
                       completion: { _ in
                        UIView.animate(withDuration: self.durationAnimation) {
                            self.viewTwo.transform = CGAffineTransform.identity

                            self.startViewThree()
                        }
        })
    }
    
    private func startViewThree() {
        UIView.animate(withDuration: 0.0,
                       animations: {
                        self.viewThree.transform = CGAffineTransform(scaleX: self.staleTransform, y: self.staleTransform)
        },
                       completion: { _ in
                        
                        UIView.animate(withDuration: self.durationAnimation, animations: {
                            self.viewThree.transform = CGAffineTransform.identity
                        }, completion: { _ in
                            UIView.animate(withDuration: self.durationAnimation, animations: {
                                if !self.stopAnimationFlag {
                                    self.startAnimation()
                                }
                            })
                        })
        })
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
    }
    */

}
