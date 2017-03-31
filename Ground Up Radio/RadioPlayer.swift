//
//  RadioPlayer.swift
//  Ground Up Radio
//
//  Created by I AM PR Agency on 3/31/17.
//  Copyright © 2017 Avenir Design. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

class RadioPlayer {
    static let sharedInstance = RadioPlayer()
    private var player = AVPlayer(url: NSURL(string: "http://groundupradio.out.airtime.pro:8000/groundupradio_a?_ga=1.181956583.1385940047.1469076586")! as URL)
    private var isPlaying = false
    
    func play() {
        player.play()
        isPlaying = true
    }
    
    func pause() {
        player.pause()
        isPlaying = false
    }
    
    func toggle() {
        if isPlaying == true {
            pause()
        } else {
            play()
        }
    }
    
    func currentlyPlaying() -> Bool {
        return isPlaying
    }
}
