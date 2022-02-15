

import WatchKit

class StatController: WKInterfaceController {
    var happycount : Int = 0
    var fullcount : Int = 0
    @IBOutlet weak var Statuschange: WKInterfaceLabel!
    @IBOutlet weak var FeedMe: WKInterfaceButton!
    @IBOutlet weak var PlayMe: WKInterfaceButton!
    
    override func awake(withContext context: Any?) {
//        setLabel()
    }
        override func willActivate() {
            // This method is called when watch view controller is about to be visible to user
            super.willActivate()
        }
    
        override func didDeactivate() {
            // This method is called when watch view controller is no longer visible
            super.didDeactivate()
        }
        
//        func setLabel() {
//            self.Statuschange.setText("🍽 : \(fullcount), 😀 : \(happycount)")
//        }
//
//    @IBAction func feedButtonClicked() {
//        fullcount = fullcount + 1
//        setLabel()
//    }
//    @IBAction func playbuttonClicked() {
//        happycount = happycount + 1
//        setLabel()
//    }
}
