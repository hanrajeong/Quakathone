import WatchKit
import Foundation


class StatController: WKInterfaceController {

    var happypoints=0 //  점수를 담을 변수 하나 선언
    var playpoints=0
    
    @IBOutlet weak var score: WKInterfaceLabel!//   label을 연결
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
//      현재 점수 표시
        score.setText("Happy : \(self.happypoints), Fullness : \(self.playpoints)")         // Configure interface objects here.
        
    }
    override func willActivate() {
        super.willActivate()
    }

    override func didDeactivate() {
        super.didDeactivate()
    }

    @IBAction func feeding() {
        self.happypoints=self.happypoints+1
    }
    @IBAction func playing() {
        self.playpoints=self.playpoints+1
    }
    

}
