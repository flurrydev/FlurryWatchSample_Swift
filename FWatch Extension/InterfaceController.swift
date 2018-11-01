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


class InterfaceController: WKInterfaceController{

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        FlurryWatch.logWatchEvent("flurry watch event")
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
