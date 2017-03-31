//
//  NowPlayingViewController.swift
//  Ground Up Radio
//
//  Created by I AM PR Agency on 3/27/17.
//  Copyright © 2017 Avenir Design. All rights reserved.
//

import UIKit
import AVFoundation

class NowPlayingViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var radioWebView: UIWebView!
    @IBOutlet weak var volSlider: UISlider!
    
    var slider = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "http://tunein.com/embed/player/s265227/")
        let req = NSURLRequest(url: url! as URL)
        radioWebView.delegate = self
        radioWebView.loadRequest(req as URLRequest)
        

        // Do any additional setup after loading the view.
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        print("start loaded call")
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("loading call done")
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

   
 
    
    
    
}
