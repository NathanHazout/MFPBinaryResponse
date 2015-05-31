//
//  ViewController.swift
//  BinaryResponse
//
//  Created by Nathan Hazout on 3/30/15.
//  Copyright (c) 2015 Sample. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var code: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func generate(sender: UIButton) {
        
        let request = WLResourceRequest(URL: NSURL(string: "/adapters/QR/" + self.code.text), method: WLHttpMethodGet)
        
        var delegate = BinaryDelegate(imageView: self.imageView)
        
        
        request.sendWithDelegate(delegate)
    
    }
    
    

}

