//
//  GameMenuController.swift
//  MiniSpaceJourneyApp
//
//  Created by Daniil Popov on 6/17/19.
//  Copyright © 2019 Daniil Popov. All rights reserved.
//

import WatchKit
import UIKit


class ShuttleController: WKInterfaceController {
    
//    @IBOutlet weak var startTitle: WKInterfaceLabel!
//    var Full: String = "Full";
//    var Happy: String = "Happy";
//    @IBOutlet weak var status: WKInterfaceLabel!
//
//    func showStatus(withContext context: Any?) {
////        super.awake(withContext: context)
//
//        // Configure interface objects here.
//        let defaults = UserDefaults.standard;
//        let fullness = defaults.integer(forKey: self.Full);
//        let happiness = defaults.integer(forKey: self.Happy);
//
//        status.setText("Full: \(fullness), Happy : \(happiness)");
//    }
//
//    override func willActivate() {
//        // This method is called when watch view controller is about to be visible to user
//        super.willActivate()
//    }
//
//    override func didDeactivate() {
//        // This method is called when watch view controller is no longer visible
//        super.didDeactivate()
//    }
    
    var happycount : Int = 0
    var fullcount : Int = 0
    @IBOutlet weak var Statuschange: WKInterfaceLabel!
    @IBOutlet weak var FeedMe: WKInterfaceButton!
    @IBOutlet weak var PlayMe: WKInterfaceButton!
    
    override func awake(withContext context: Any?) {
        setLabel()
    }
        override func willActivate() {
            // This method is called when watch view controller is about to be visible to user
            super.willActivate()
        }
    
        override func didDeactivate() {
            // This method is called when watch view controller is no longer visible
            super.didDeactivate()
        }
        
        func setLabel() {
            self.Statuschange.setText("🍽 : \(fullcount), 😀 : \(happycount)")
        }
    
    @IBAction func feedButtonClicked() {
        fullcount = fullcount + 1
        setLabel()
    }
    @IBAction func playbuttonClicked() {
        happycount = happycount + 1
        setLabel()
    }
}
