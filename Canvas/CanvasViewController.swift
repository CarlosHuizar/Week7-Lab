//
//  CanvasViewController.swift
//  Canvas
//
//  Created by Carlos Huizar-Valenzuela on 3/18/18.
//  Copyright © 2018 Carlos Huizar-Valenzuela. All rights reserved.
//

import UIKit

class CanvasViewController: UIViewController {

    @IBOutlet weak var trayView: UIView!
    var trayOriginalCenter: CGPoint!
    var trayDownOffset: CGFloat! = nil
    var trayUp: CGPoint!
    var trayDown: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trayDownOffset = 210
        trayUp = trayView.center // The initial position of the tray
        trayDown = CGPoint(x: trayView.center.x ,y: trayView.center.y + trayDownOffset)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func didPanTray(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        var velocity = sender.velocity(in: view)
        
        
        if sender.state == .began
        {
            print("Gesture began")
            trayOriginalCenter = trayView.center
        }
        else if sender.state == .changed
        {
            print("Gesture is changing")
            trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
        }
        else if sender.state == .ended
        {
            print("Gesture is ending")
            if(velocity.y > 0)
            {
                UIView.animate(withDuration:0.004, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1, options:[] ,
                               animations: { () -> Void in
                                self.trayView.center = self.trayDown
                }, completion: nil)
            }
            else
            {
                UIView.animate(withDuration:0.004, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1, options:[] ,
                               animations: { () -> Void in
                                self.trayView.center = self.trayUp
                }, completion: nil)
            }
            
        }
            
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}