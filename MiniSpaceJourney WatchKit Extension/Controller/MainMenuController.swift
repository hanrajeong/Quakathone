

import WatchKit


class MainMenuController: WKInterfaceController {
    
    var highestScorekey: String = "MiniSpaceJourneyHighestScore";

    @IBOutlet weak var highestScoreLabel: WKInterfaceLabel!

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        let defaults = UserDefaults.standard;
        let highestScore = defaults.integer(forKey: self.highestScorekey);

//        highestScoreLabel.setText("Highest score: \(highestScore)");
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
