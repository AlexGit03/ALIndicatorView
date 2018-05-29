//
//  ALViewIndicator.swift
//  ProvaAnimation
//
//  Created by Antonio Alessandro Chillura on 28/05/18.
//  Copyright © 2018 Antonio Alessandro Chillura. All rights reserved.
//

import UIKit

open class ALViewIndicator: UIView {
    
    @IBOutlet weak var viewIndicator: ALViewAnimation!
    
    //MARK: - Properties
    var view: UIView!
    
    static open let shared = ALViewIndicator.init(frame: UIScreen.main.bounds)
    private var isInLoading:Bool = false
    
    //MARK: - View Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    open func startIndicator(inView view:UIView) {
        if !self.isInLoading {
            viewIndicator.startAnimation()
            view.addSubview(self)
            self.isInLoading = true
        }
    }
    
    open func stopIndicator() {
        viewIndicator.stopAnimation()
        self.removeFromSuperview()
        self.isInLoading = false
    }
    
    open func setColorIndicator(_ color:UIColor) {
        viewIndicator.backgroundColor = color
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

private extension ALViewIndicator {
    func xibSetup() {
        view = loadNib()
        view.frame = bounds
        addSubview(view)
    }
}
