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
    
    var myAudioPlayer = AVPlayer()
    var myAVPlayerItem: AVPlayerItem!
    var isPlay: Bool!
    var timer: NSTimer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        isPlay = false; // no playing music
        
//        // get path file string
//        let myPathFileString = NSBundle.mainBundle().pathForResource("We Don t Talk Anymore Heyder Remix - Charlie Puth Selena Gomez", ofType: "mp3")
//        
//        if let myPathFileString = myPathFileString {
//            let myPathFileURL = NSURL(fileURLWithPath: myPathFileString)
//            
//            do {
//                myAVPlayerItem = AVPlayerItem(URL: myPathFileURL!)
//                try myAudioPlayer = AVPlayer(playerItem: myAVPlayerItem)
//                
//                //myAudioPlayer.play()
//            } catch {
//                print("error")
//            }
//        }
        
        let myPathFileURL = NSURL(string: "http://s1.mp3.zdn.vn/fc3c49f140b5a9ebf0a4/6766685698147718612?key=n7H1mVzFd2O1rVHghq-2QA&expires=1472306204")
        myAVPlayerItem = AVPlayerItem(URL: myPathFileURL!)
        myAudioPlayer = AVPlayer(playerItem: myAVPlayerItem)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func processPlay() {
        let timeOfSecondDuration = CMTimeGetSeconds(myAVPlayerItem.duration)
        let timeOfSecondCurrenTime = CMTimeGetSeconds(myAVPlayerItem.currentTime())
        timePlayingProcessView.progress = Float(timeOfSecondCurrenTime / timeOfSecondDuration)
    }

    @IBAction func playAudio(sender: UIButton) {
        // start process view
        let timeOfSecondCurrenTime = CMTimeGetSeconds(myAVPlayerItem.currentTime())
        if timeOfSecondCurrenTime == 0 {
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
//        playButton.setImage(UIImage(named: "play"), forState: .Normal)
//        myAudioPlayer.stop()
//        myAudioPlayer.currentTime = 0
//        isPlay = false
        timePlayingProcessView.progress = 0
        timer?.invalidate()
    }
    
    @IBAction func controlVolume(sender: UISlider) {
        myAudioPlayer.volume = sender.value
    }
}

