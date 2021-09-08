# Timer

Timers work in conjunction with run loops. Run loops maintain strong references to their timers, so you don’t have to maintain your own strong reference to a timer after you have added it to a run loop.

To use a timer effectively, you should be aware of how run loops operate. See Threading Programming Guide for more information.

A timer is not a real-time mechanism. If a timer’s firing time occurs during a long run loop callout or while the run loop is in a mode that isn't monitoring the timer, the timer doesn't fire until the next time the run loop checks the timer. Therefore, the actual time at which a timer fires can be significantly later. See also Timer Tolerance.

Timer is toll-free bridged with its Core Foundation counterpart, CFRunLoopTimer. See Toll-Free Bridging for more information.

### Define the timer object.
```swift
var timer = Timer()
var seconds : Int = 0
var minutes : Int = 0
var hours : Int = 0
```

### Function to be triggered.
```swift
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
```

### Initialize the timer object.
```swift
@IBAction func start(_ sender: Any) {
    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil,repeats: true)
}
```

### Terminate the counter.
```swift
@IBAction func reset(_ sender: UIButton) {
    timer.invalidate()
    seconds = 0
    minutes = 0
    hours = 0
    LabelTimer.text = "\(hours):\(minutes):\(seconds)"
}
```
