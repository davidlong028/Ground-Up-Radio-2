//
//  BlogViewController.swift
//  Ground Up Radio
//
//  Created by I AM PR Agency on 3/31/17.
//  Copyright © 2017 Avenir Design. All rights reserved.
//

import UIKit

class BlogViewController: UIViewController {

    @IBOutlet weak var webViewBlog: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBlog()

        // Do any additional setup after loading the view.
    }
    
    func loadBlog() {
        webViewBlog.loadRequest(URLRequest(url: URL(string: "http://groundupradio.com/")!))
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
