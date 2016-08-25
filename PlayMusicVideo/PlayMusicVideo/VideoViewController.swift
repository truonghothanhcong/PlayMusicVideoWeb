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

        let moviePath = NSBundle.mainBundle().pathForResource("Lamborghini Huracan", ofType: "mp4")
        if let path = moviePath {
            let url = NSURL.fileURLWithPath(path)
            self.player = AVPlayer(URL: url)
            self.avpController = AVPlayerViewController()
            self.avpController.player = self.player
            self.addChildViewController(avpController)
            self.avpController.view.frame = self.videoPreview.bounds
            self.videoPreview.addSubview(avpController.view)
            
            
//            let url = NSURL.fileURLWithPath(path)
//            self.player = AVPlayer(URL: url)
//            self.playerLayer = AVPlayerLayer(player: player);
//            self.playerLayer!.videoGravity = AVLayerVideoGravityResizeAspectFill;
//            self.playerLayer!.frame =  videoPreview.bounds;
//            self.videoPreview.layer.addSublayer(playerLayer!);
//            //player.play();
        }
        
        

        
//        // get path file string
//        let myPathFileString = NSBundle.mainBundle().pathForResource("Lamborghini Huracan", ofType: "mp4")
//        let myPathFileURL = NSURL(fileURLWithPath: myPathFileString!)
//        
//        videoWebView.loadHTMLString("<iframe width = \"\(self.videoWebView.frame.width)\" height = \"\(self.videoWebView.frame.height)\" src = \"\(myPathFileURL)\"></iframe>", baseURL: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
