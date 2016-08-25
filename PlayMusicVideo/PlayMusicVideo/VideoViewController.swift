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


    override func viewDidLoad() {
        super.viewDidLoad()

        let moviePath = NSBundle.mainBundle().pathForResource("Lamborghini Huracan", ofType: "mp4")
        if let path = moviePath{
            let url = NSURL.fileURLWithPath(path)
            let item = AVPlayerItem(URL: url)
            self.player = AVPlayer(playerItem: item)
            self.avpController = AVPlayerViewController()
            self.avpController.player = self.player
            avpController.view.frame = videoPreview.frame
            self.addChildViewController(avpController)
            self.view.addSubview(avpController.view)
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
