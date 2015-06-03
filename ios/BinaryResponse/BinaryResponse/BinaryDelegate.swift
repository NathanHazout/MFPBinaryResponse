//
//  BinaryDelegate.swift
//  BinaryResponse
//
//  Created by Nathan Hazout on 3/30/15.
//  Copyright (c) 2015 Sample. All rights reserved.
//

import UIKit

class BinaryDelegate: NSObject, NSURLConnectionDataDelegate {
    
    var responseData = NSMutableData()
    var imageView: UIImageView
    
    init(imageView : UIImageView){
        self.imageView = imageView
    }
    
    func connection(connection: NSURLConnection,
        didReceiveData data: NSData){
            NSLog("In didReceiveData");
            NSLog("%@", data)
            responseData.appendData(data)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection){
        NSLog("In connectionDidFinishLoading")
        self.imageView.image = UIImage(data: self.responseData)
    }
    
    func connection(connection: NSURLConnection, willSendRequest request: NSURLRequest, redirectResponse response: NSURLResponse?) -> NSURLRequest? {
        NSLog("in willSendRequest")

        return request;
        
    }


}
