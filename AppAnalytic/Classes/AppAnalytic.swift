//
//  AppAnalytics.swift
//  AppAnalytics
//
//  Created by Vahid Sayad on 2016-05-28.
//  Copyright © 2016 Vahid Sayad. All rights reserved.
//

import Foundation

public class AppAnalytics{
    
    private let _accessKey: String
    private var _APIURL = "http://appanalytics.ir/api/v1/androidservice/initialize/";
    private let _UUID: String
    
    //MARK: submitCampain Function
    public func submitCampaign(){
        //print("ACCESS KEY \(self._accessKey)")
        print("UUID: \(self._UUID)")
        
        self._APIURL += self._UUID
        let url = NSURL(string: self._APIURL)
        let request = NSMutableURLRequest(URL: url!)
        
        
        request.setValue(self._accessKey, forHTTPHeaderField: "Access-Key")
        //let dic = ["userId": "32"]
        
        NSURLSession.sharedSession().dataTaskWithRequest(request) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            print(String(data: data!, encoding: NSUTF8StringEncoding))
        }.resume()
    }
    
    //MARK: Init class
    public init(accessKey key: String){
        self._accessKey = key
        self._UUID = UIDevice.currentDevice().identifierForVendor!.UUIDString
    }
}