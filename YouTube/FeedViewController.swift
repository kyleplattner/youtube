//
//  FeedViewController.swift
//  YouTube
//
//  Created by Kyle Plattner on 10/6/15.
//  Copyright (c) 2015 Kyle Plattner. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // The onCustomPan: method will be defined in Step 3 below.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func onCustomPan(panGestureRecognizer: UIPanGestureRecognizer) {
//        var point = panGestureRecognizer.locationInView(view)
//        var velocity = panGestureRecognizer.velocityInView(view)
//        var translation = panGestureRecognizer.translationInView(view)
//
//        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
//            println("Gesture began at: \(point)")
//        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
//            println("Gesture changed at: \(point)")
//            
//            
//            
//        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
//            println("Gesture ended at: \(point)")
//        }
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
