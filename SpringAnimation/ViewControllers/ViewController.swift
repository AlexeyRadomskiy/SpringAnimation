//
//  ViewController.swift
//  SpringAnimationApp
//
//  Created by Alexey on 15.03.2022.
//

import Spring

class ViewController: UIViewController {

    @IBOutlet var coreAnimationView: UIView!
    
    @IBOutlet var springAnimationView: SpringView!
    
    private var animationStarted = false

    @IBAction func runCoreAnimation(_ sender: UIButton) {
        sender.pulsate()
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: [.autoreverse, .repeat]) {
                
            if !self.animationStarted {
                self.coreAnimationView.frame.origin.x += 40
                self.animationStarted.toggle()
            }
        }
    }
    
    @IBAction func runSpringAnimation(_ sender: SpringButton) {
        springAnimationView.animation = "morph"
        springAnimationView.curve = "easeIn"
        springAnimationView.force = 2
        springAnimationView.duration = 1
        springAnimationView.animate()
        
        sender.animation = "wobble"
        sender.animate()
    }
}

