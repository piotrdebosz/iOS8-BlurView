//
//  ViewController.swift
//  BlurEffect
//
//  Created by Piotr Debosz on 13/06/2014.
//  Copyright (c) 2014 Piotr Debosz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet var blurView : UIView
    @IBOutlet var squareView : UIView
    
    var shouldAnimate = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .Dark))
        visualEffectView.frame = blurView.bounds
        
        blurView.addSubview(visualEffectView)
        blurView.sendSubviewToBack(visualEffectView)
    }
    
    @IBAction func hideBlurView(sender : AnyObject) {
        squareView.hidden = true
        blurView.hidden = true;
        shouldAnimate = false
    }
    
    @IBAction func showBlurView(sender : AnyObject) {
        squareView.hidden = false
        blurView.hidden = false
        shouldAnimate = true
        animateSquare()
    }
    
    func animateSquare() {
        if (!shouldAnimate) {
            return
        }
        
        let randomX = arc4random() % 320;
        let randomY = arc4random() % 568;
        let duration = 1.0
        
        UIView.animateWithDuration(duration, animations: {
            self.squareView.frame.origin.x = CGFloat(randomX)
            self.squareView.frame.origin.y = CGFloat(randomY)
        }, completion: { b in
            self.animateSquare()
        })
    }
}

