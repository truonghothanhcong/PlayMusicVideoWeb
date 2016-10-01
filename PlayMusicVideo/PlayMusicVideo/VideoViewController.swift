//
//  VideoViewController.swift
//  PlayMusicVideo
//
//  Created by Admin on 8/25/16.
//  Copyright © 2016 congtruong. All rights reserved.
//

import UIKit
import MediaPlayer
import AVKit

class VideoViewController: UIViewController {
    
    @IBOutlet weak var videoWebView: UIWebView!
    @IBOutlet weak var videoPreview: UIView!
    var player: AVPlayer!
    var avpController = AVPlayerViewController()
    
    var playerLayer: AVPlayerLayer?


    override func viewDidLoad() {
        super.viewDidLoad()
//          // play video fix in UIView
//        let moviePath = NSBundle.mainBundle().pathForResource("Lamborghini Huracan", ofType: "mp4")
//        if let path = moviePath {
//            let url = NSURL.fileURLWithPath(path)
//            self.player = AVPlayer(URL: url)
//            self.avpController = AVPlayerViewController()
//            self.avpController.player = self.player
//            self.addChildViewController(avpController)
//            self.avpController.view.frame = self.videoPreview.bounds
//            self.videoPreview.addSubview(avpController.view)
//        }
        
        // play video from web (stream video)
        //let stringURL = "http://techslides.com/demos/sample-videos/small.mp4"
        let url = NSURL(string: "http://s1.mp3.zdn.vn/28e3152e8c6a65343c7b/1821708010200833360?key=N4xgLu7kKTY_eksErAJU6A&expires=1472304038")
        if let url = url {
            self.player = AVPlayer(URL: url)
            self.avpController = AVPlayerViewController()
            self.avpController.player = self.player
            self.addChildViewController(avpController)
            self.avpController.view.frame = self.videoPreview.bounds
            self.videoPreview.addSubview(avpController.view)
        }

        
//        // get path file string
//        let myPathFileString = NSBundle.mainBundle().pathForResource("Lamborghini Huracan", ofType: "mp4")
//        let myPathFileURL = NSURL(fileURLWithPath: myPathFileString!)
//        // play video in webView
//        videoWebView.loadHTMLString("<iframe width = \"\(self.videoWebView.frame.width)\" height = \"\(self.videoWebView.frame.height)\" src = \"\(myPathFileURL)\"></iframe>", baseURL: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
