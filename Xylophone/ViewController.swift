import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        let key = sender.currentTitle!
        playSound(with: key)
        print("Start")
        sender.layer.opacity = 0.5
        startTimer(sender)
    }
    
    func playSound(with key: String) {
        let url = Bundle.main.url(forResource: key, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    func startTimer(_ sender: UIButton) {
        _ = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(changeOpacity), userInfo: sender, repeats: false)
    }
                                         
    @objc func changeOpacity(_ timer: Timer) {
        let button = timer.userInfo as? UIButton
        button?.layer.opacity =  1
        print("End")
    }
}
