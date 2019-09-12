//
//  ViewController.swift
//  FlurryWatch_Swift
//
//  Created by Yilun Xu on 11/1/18.
//  Copyright © 2018 Flurry. All rights reserved.
//

import UIKit
import WatchConnectivity
import Flurry_iOS_SDK

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
        session?.sendMessage(["start_button_pressed" : true], replyHandler: nil, errorHandler: nil)
        let status = Flurry.logEvent("Timer_Reset_Pressed")
        print("log status : \(stringForEventRecordStatus(status: status))")
    }
    
    func stringForEventRecordStatus(status: FlurryEventRecordStatus) -> String {
        switch status {
        case FlurryEventFailed:
            return "Log Event Failed"
        case FlurryEventRecorded:
            return "Log Event Recorded"
        case FlurryEventUniqueCountExceeded:
            return "Log Event Unique Count Exceeded"
        case FlurryEventParamsCountExceeded:
            return "Log Event Params Count Exceeded"
        case FlurryEventLogCountExceeded:
            return "Log Event Count Exceeded"
        case FlurryEventLoggingDelayed:
            return "Log Event Delayed"
        case FlurryEventAnalyticsDisabled:
            return "Log Event Analytics Disabled"
        default:
            return "shoule not be here"
        }
    }

}

