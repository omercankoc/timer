import UIKit

class ViewController: UIViewController {

    // TR : Belli zaman araliklarinda belirlenen hedef nesnesini tetikler.
    // EN : It triggers the specified target object at specific time intervals.
    var timer = Timer()
    var seconds : Int = 0
    var minutes : Int = 0
    var hours : Int = 0
    
    @IBOutlet weak var LabelTimer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LabelTimer.text = "\(hours):\(minutes):\(seconds)"
    }
    
    // TR : Tetiklenecek Fonksiyon.
    // EN : Function to be triggered.
    @objc func counter(){
        
        seconds += 1
        
        if(seconds > 59){
            minutes += 1
            seconds = 0
        }
            
        if(minutes > 59){
            hours += 1
            minutes = 0
        }
        
        LabelTimer.text = "\(hours):\(minutes):\(seconds)"
        
    }

    @IBAction func start(_ sender: Any) {
        // TR : Zamanlayici nesnesini baslat.
        // EN : Initialize the timer object.
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil,repeats: true)
    }
    
    @IBAction func reset(_ sender: UIButton) {
        // TR : Sayaci sonlandir.
        // EN : Terminate the counter.
        timer.invalidate()
        seconds = 0
        minutes = 0
        hours = 0
        LabelTimer.text = "\(hours):\(minutes):\(seconds)"
    }
}
