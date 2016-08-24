//
//  GetOTPParser.swift
//  AmazonCalculator
//
//  Created by Shareen Ali on 28/07/16.
//  Copyright © 2016 Shareen Ali. All rights reserved.
//

import UIKit

protocol GetOTPParserDelegate : NSObjectProtocol
{
    func didReceivedGetOTPStatus(resultCode resultCode : Int, otp : String?)
}

class GetOTPParser: NSObject, AsyncLoaderModelDelegate {
    
    var loader : AsyncLoaderModel?
    weak var delegate : GetOTPParserDelegate?
    
    func getOTP(mobileno: String!, emailid : String!)
    {
        let jsonDictionary = NSMutableDictionary()
        jsonDictionary.setValue(mobileno, forKey: "mobileNo")
        jsonDictionary.setValue(emailid, forKey: "email")
        
        var jsonData: NSData?
        do
        {
            jsonData = try NSJSONSerialization.dataWithJSONObject(jsonDictionary, options: NSJSONWritingOptions.PrettyPrinted)
        }
        catch
        {
            jsonData = nil
        }
        
        let requestString = NSString(data: jsonData!, encoding: NSUTF8StringEncoding)
        print("register requestString is \(requestString!)")
        
        let jsonDataLength = "\(jsonData!.length)"
        let url = NSURL(string: AppConstant.Static.BASE_URL+"getOtp")
        let request = NSMutableURLRequest(URL: url!)
        request.addValue("application/json;charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.addValue(jsonDataLength, forHTTPHeaderField: "Content-Length")
        request.HTTPMethod = "POST"
        request.HTTPBody = jsonData
        
        loader = AsyncLoaderModel()
        loader!.getDataFromRequest(request: request, dataIndex: -1)
        loader!.delegate = self
    }
    func didReceivedData(data data : NSData!, loader : AsyncLoaderModel!, dataIndex : Int)
    {
        let responseString = NSString(data: data, encoding: NSUTF8StringEncoding)
        print("register responseString is \(responseString!)")
        
        processData(data: data)
        self.loader = nil
    }
    
    func didReceivedErrorLoader(loader loader : AsyncLoaderModel!, dataIndex : Int)
    {
        if delegate != nil
        {
            delegate!.didReceivedGetOTPStatus(resultCode: AppConstant.Static.CONNECTION_ERROR, otp: "NA")
        }
        
        self.loader = nil
    }
    
    func processData(data data : NSData)
    {
        var result : NSDictionary!
        
        do
        {
            try result = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary
            
            let Status = result.objectForKey("statusId") as! Int
            
            if Status == 200
            {
                let otp = result.objectForKey("otp") as! String
                NSUserDefaults.standardUserDefaults().setObject(otp, forKey: "otp")
            
                if delegate != nil
                {
                    delegate!.didReceivedGetOTPStatus(resultCode: AppConstant.Static.OTP_SUCCESS, otp: otp)
                }
                
            }
            else {
                if delegate != nil
                {
                    delegate!.didReceivedGetOTPStatus(resultCode: AppConstant.Static.PROCESSING_ERROR, otp: "NA")
                }
                
            }
        }
        catch
        {
            if delegate != nil
            {
                delegate!.didReceivedGetOTPStatus(resultCode: AppConstant.Static.PROCESSING_ERROR, otp: "NA")
            }
        }
    }
}