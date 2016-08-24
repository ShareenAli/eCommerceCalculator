//
//  RegisterUserParser.swift
//  AmazonCalculator
//
//  Created by Shareen Ali on 28/07/16.
//  Copyright © 2016 Shareen Ali. All rights reserved.
//

import UIKit

protocol RegisterUserParserDelegate : NSObjectProtocol
{
    func didReceivedRegisterUserStatus(resultCode resultCode : Int)
}

class RegisterUserParser: NSObject, AsyncLoaderModelDelegate {
    
    var loader : AsyncLoaderModel?
    weak var delegate : RegisterUserParserDelegate?
    
    func registerUser(name name : String!, mobileno: String!, emailid : String!)
    {
        let jsonDictionary = NSMutableDictionary()
        jsonDictionary.setValue(name, forKey: "userName")
        jsonDictionary.setValue(mobileno, forKey: "mobileNo")
        jsonDictionary.setValue(emailid, forKey: "email")
        jsonDictionary.setValue("NA", forKey: "deviceToken")
        jsonDictionary.setValue("I", forKey: "osType")
        
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
        let url = NSURL(string: AppConstant.Static.BASE_URL+"Register")
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
            delegate!.didReceivedRegisterUserStatus(resultCode: AppConstant.Static.CONNECTION_ERROR)
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
                let user = result.objectForKey("user") as! NSDictionary
                
                NSUserDefaults.standardUserDefaults().setObject(user.objectForKey("userId") as! Int, forKey: "userId")
                NSUserDefaults.standardUserDefaults().setObject(user.objectForKey("userName") as! String, forKey: "userName")
                NSUserDefaults.standardUserDefaults().setObject(user.objectForKey("email") as! String, forKey: "email")
                NSUserDefaults.standardUserDefaults().setObject(user.objectForKey("mobileNo")!, forKey: "mobileNo")
                NSUserDefaults.standardUserDefaults().setObject(user.objectForKey("deviceToken") as! String, forKey: "deviceTocken")
                NSUserDefaults.standardUserDefaults().setObject(user.objectForKey("osType") as! String, forKey: "osType")
                
                NSUserDefaults.standardUserDefaults().synchronize()
                
                if delegate != nil
                {
                    delegate!.didReceivedRegisterUserStatus(resultCode: AppConstant.Static.REGISTRATION_SUCCESS)
                }
            }
            else
            {
                if delegate != nil
                {
                    delegate!.didReceivedRegisterUserStatus(resultCode: AppConstant.Static.PROCESSING_ERROR)
                }
            }
        }
            catch
            {
                if delegate != nil
                {
                    delegate!.didReceivedRegisterUserStatus(resultCode: AppConstant.Static.PROCESSING_ERROR)
                }
            }
        }
}