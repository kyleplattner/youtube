//
//  HamburgerViewController.swift
//  YouTube
//
//  Created by Kyle Plattner on 10/6/15.
//  Copyright (c) 2015 Kyle Plattner. All rights reserved.
//

import UIKit

class HamburgerViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var topView: UIView!
    var menuViewController: MenuViewController!
    var feedViewController: FeedViewController!
    var imageCenter: CGPoint!
    
    
    func convertValue(value: CGFloat, r1Min: CGFloat, r1Max: CGFloat, r2Min: CGFloat, r2Max: CGFloat) -> CGFloat {
        var ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        menuViewController = storyboard.instantiateViewControllerWithIdentifier("MenuViewController") as MenuViewController
        feedViewController = storyboard.instantiateViewControllerWithIdentifier("FeedViewController") as FeedViewController
        
        topView.addSubview(feedViewController.view)
        containerView.addSubview(menuViewController.view)
        
        
        
        // The onCustomPan: method will be defined in Step 3 below.
        var panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "onCustomPan:")
        
        // Attach it to a view of your choice. If it's a UIImageView, remember to enable user interaction
        view.addGestureRecognizer(panGestureRecognizer)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func onCustomPan(panGestureRecognizer: UIPanGestureRecognizer) {
        var point = panGestureRecognizer.locationInView(view)
        var velocity = panGestureRecognizer.velocityInView(view)
        var translation = panGestureRecognizer.translationInView(view)
        var offset = Float(topView.center.x)
        var panConversion = convertValue(CGFloat(offset), r1Min: 160, r1Max: 320, r2Min: 0.9, r2Max: 1.0)
        var angleConversion = convertValue(CGFloat(offset), r1Min: 160, r1Max: 320, r2Min: 0, r2Max: CGFloat(45 * M_PI / 180))

        var transform = CATransform3DIdentity;
        transform.m34 = 1.0 / 500.0;
        
        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
            println("Gesture began at: \(point)")
            imageCenter = topView.center

        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
            println("Gesture changed at: \(point)")
//            println(imageCenter)
            println(translation)
            transform = CATransform3DRotate(transform, angleConversion, 0, 1, 0)
            transform = CATransform3DTranslate(transform, 0, 0, 50)

            topView.layer.transform = transform

            topView.center.x = translation.x + imageCenter.x
            containerView.transform = CGAffineTransformMakeScale(panConversion, panConversion)
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            println("Gesture ended at: \(point)")
            if (velocity.x > 0){
               println("velocity")
            
                UIView.animateWithDuration(0.1, animations: { () -> Void in
                    self.topView.center.x = 435
                    self.containerView.transform = CGAffineTransformMakeScale(1, 1)
                })
                
            }else{
                self.topView.center.x = 160
            }
            
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
