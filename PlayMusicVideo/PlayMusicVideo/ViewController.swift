//
//  ViewController.swift
//  PlayMusicVideo
//
//  Created by Admin on 8/25/16.
//  Copyright © 2016 congtruong. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var timePlayingProcessView: UIProgressView!
    
    var myAudioPlayer = AVAudioPlayer()
    var isPlay: Bool!
    var timer: NSTimer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        isPlay = false; // no playing music
        
        // get path file string
        let myPathFileString = NSBundle.mainBundle().pathForResource("We Don t Talk Anymore Heyder Remix - Charlie Puth Selena Gomez", ofType: "mp3")
        
        if let myPathFileString = myPathFileString {
            let myPathFileURL = NSURL(fileURLWithPath: myPathFileString)
            
            do {
                try myAudioPlayer = AVAudioPlayer(contentsOfURL: myPathFileURL)
                
                //myAudioPlayer.play()
            } catch {
                print("error")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func processPlay() {
        timePlayingProcessView.progress = Float(myAudioPlayer.currentTime / myAudioPlayer.duration)
    }

    @IBAction func playAudio(sender: UIButton) {
        // start process view
        if myAudioPlayer.currentTime == 0 {
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(ViewController.processPlay), userInfo: nil, repeats: true)
        }
        
        // pause audio
        if isPlay == true {
            myAudioPlayer.pause()
            sender.setImage(UIImage(named: "play"), forState: .Normal)
            
            isPlay = false
            return
        }
        
        // play audio
        myAudioPlayer.play()
        sender.setImage(UIImage(named: "pause"), forState: UIControlState.Normal)
        isPlay = true
    }

    @IBAction func stopAudio(sender: UIButton) {
        playButton.setImage(UIImage(named: "play"), forState: .Normal)
        myAudioPlayer.stop()
        myAudioPlayer.currentTime = 0
        isPlay = false
        timePlayingProcessView.progress = 0
        timer?.invalidate()
    }
    
    @IBAction func controlVolume(sender: UISlider) {
        myAudioPlayer.volume = sender.value
    }
}

