//
//  BinaryDelegate.swift
//  BinaryResponse
//
//  Created by Nathan Hazout on 3/30/15.
//  Copyright (c) 2015 Sample. All rights reserved.
//

import UIKit

class BinaryDelegate: NSObject, NSURLConnectionDataDelegate, NSURLConnectionDelegate {
    
    var responseData = NSMutableData()
    var imageView: UIImageView
    
    init(imageView : UIImageView){
        self.imageView = imageView
    }
    
    init(request: NSMutableURLRequest){
        self.imageView = UIImageView();
        NSLog("in init request")
    }
    
    func connection(connection: NSURLConnection,
        didReceiveResponse response: NSURLResponse){
            
            NSLog("In didReceiveResponse")
            
    }
    
    func connection(connection: NSURLConnection,
        didReceiveData data: NSData){
            NSLog("In didReceiveData");
            NSLog("%@", data)
            responseData.appendData(data)
    }
    
    
    func connection(connection: NSURLConnection,
        didFailWithError error: NSError){
           NSLog("In didFailWithError")
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection){
        NSLog("In connectionDidFinishLoading")
        self.imageView.image = UIImage(data: self.responseData)
    }
    
    func connection(connection: NSURLConnection, didSendBodyData bytesWritten: Int, totalBytesWritten: Int, totalBytesExpectedToWrite: Int) {
        NSLog("in didSendBodyData");
    }
    
    func connection(connection: NSURLConnection, willSendRequest request: NSURLRequest, redirectResponse response: NSURLResponse?) -> NSURLRequest? {
        NSLog("in willSendRequest")

        if ((response) != nil) {
            NSLog("with response not nil")
//            // we don't use the new request built for us, except for the URL
//            var newURL = request.URL
//            // Previously, store the original request in _originalRequest.
//            // We rely on that here!
//            NSMutableURLRequest *newRequest = [_originalRequest mutableCopy];
//            [newRequest setURL: newURL];
            return request;
        } else {
            NSLog("with response nil")
            return request;
        }
        
    }
    
    func connection(connection: NSURLConnection, needNewBodyStream request: NSURLRequest) -> NSInputStream? {
        NSLog("in needNewBodyStream")
        
        return nil;
    }
    
    func connection(connection: NSURLConnection, willCacheResponse cachedResponse: NSCachedURLResponse) -> NSCachedURLResponse? {
        NSLog("in willCacheResponse")
        
        return nil;
    }
    
    func connection(connection: NSURLConnection, willSendRequestForAuthenticationChallenge challenge: NSURLAuthenticationChallenge) {
        NSLog("willSendRequestForAuthenticationChallenge")
    }


}
