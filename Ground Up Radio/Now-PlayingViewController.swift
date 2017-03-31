//
//  Now-PlayingViewController.swift
//  Ground Up Radio
//
//  Created by I AM PR Agency on 3/28/17.
//  Copyright © 2017 Avenir Design. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import MediaPlayer




class Now_PlayingViewController: UIViewController {
    
  
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var playBtn: UIButton!
    
  
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            UIApplication.shared.beginReceivingRemoteControlEvents()
            print("Receiving remote control events\n")
        } catch {
            print("Audio Session error.\n")
        }
        
        if NSClassFromString("MPNowPlayingInfoCenter") != nil {
            let image:UIImage = UIImage(named: "logo_player_background")!
            let albumArt = MPMediaItemArtwork.init(boundsSize: image.size, requestHandler: { (size) -> UIImage in
                return image
            })
            let songInfo = [
                MPMediaItemPropertyTitle: "Ground Up Radio",
                MPMediaItemPropertyArtist: "http://GroundUpRadio.com",
                MPMediaItemPropertyArtwork: albumArt
            ] as [String : Any]
            MPNowPlayingInfoCenter.default().nowPlayingInfo = songInfo
            
        }

    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func playButtonPressed(_ sender: UIButton) {
        toggle()
        
    }
    
    func toggle() {
        if RadioPlayer.sharedInstance.currentlyPlaying() {
            
            pauseRadio()
        } else {
            
            playRadio()
        }
    }
    
    func playRadio() {
        RadioPlayer.sharedInstance.play()
        playBtn.setImage(#imageLiteral(resourceName: "pause---img"), for: UIControlState.normal)
    }
    
    func pauseRadio() {
        RadioPlayer.sharedInstance.pause()
        playBtn.setImage(#imageLiteral(resourceName: "play---img"), for: UIControlState.normal)
        
    }

}
