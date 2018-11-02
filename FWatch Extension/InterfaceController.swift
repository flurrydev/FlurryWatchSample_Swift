//
//  InterfaceController.swift
//  FWatch Extension
//
//  Created by Yilun Xu on 11/1/18.
//  Copyright © 2018 Flurry. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController, WCSessionDelegate{
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    

    @IBOutlet var timer: WKInterfaceTimer!
    var session : WCSession?
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        if WCSession.isSupported() {
            session = WCSession.default
            session?.delegate = self
            session?.activate()
        }
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print (message)
        timer.setDate(NSDate.init(timeIntervalSinceNow: 0) as Date)
        timer.start()
        let status = Flurry.logEvent("Started_Timed_Watch")
        print("log status : \(stringForEventRecordStatus(status: status))")
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
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
