//
//  MyConnectListener.swift
//  BinaryResponse
//
//  Created by Nathan Hazout on 3/30/15.
//  Copyright (c) 2015 Sample. All rights reserved.
//

import UIKit

class MyConnectListener: NSObject, WLDelegate {
    func onSuccess(response: WLResponse!) {
        var resultText = "Connection success. "
        if(response != nil){
            resultText += response.responseText
        }
        NSLog("%@",resultText)
    }
    
    func onFailure(response: WLFailResponse!) {
        var resultText = "Connection failure. "
        if(response != nil){
            resultText += response.errorMsg
        }
        NSLog("%@",resultText)
    }
}
