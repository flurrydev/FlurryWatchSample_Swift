//
//  ViewController.swift
//  FlurryWatch_Swift
//
//  Created by Yilun Xu on 11/1/18.
//  Copyright © 2018 Flurry. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    var session : WCSession?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if WCSession.isSupported() {
            session = WCSession.default
            session?.delegate = self
            session?.activate()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func reset(_ sender: UIButton) {
        session?.sendMessage(["go" : true], replyHandler: nil, errorHandler: nil)
        Flurry.logEvent("Timer_Reset_Pressed")
    }
    

}

