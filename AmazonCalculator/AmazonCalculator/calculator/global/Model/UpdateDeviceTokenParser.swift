//
//  UpdateDeviceTokenParser.swift
//  AmazonCalculator
//
//  Created by Shareen Ali on 02/08/16.
//  Copyright © 2016 Shareen Ali. All rights reserved.
//

import UIKit

protocol UpdateDeviceTokenDelegate : NSObjectProtocol
{
    func didReceivedUpdateDeviceTokenResult(resultCode resultCode : Int)
}


class UpdateDeviceTokenParser: NSObject, AsyncLoaderModelDelegate
{
    var loader : AsyncLoaderModel?
    weak var delegate : UpdateDeviceTokenDelegate?
    
    func addDeviceToken()
    {
        let jsonDict = NSMutableDictionary()
        
        jsonDict.setValue(NSUserDefaults.standardUserDefaults().valueForKey("devicetoken") as! String, forKey: "DeviceToken")
        jsonDict.setValue(NSUserDefaults.standardUserDefaults().valueForKey("userId") as! String, forKey: "userId")
     
        var jsonData : NSData?
        do{
            jsonData = try NSJSONSerialization.dataWithJSONObject(jsonDict, options: NSJSONWritingOptions.PrettyPrinted)
        }
        catch
        {
            jsonData = nil
        }
        let jsonDataLength = "\(jsonData!.length)"
        let url = NSURL(string: AppConstant.Static.BASE_URL+"updateDeviceToken")
        let request = NSMutableURLRequest(URL: url!)
        request.addValue("application/json;charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.addValue(jsonDataLength, forHTTPHeaderField: "Content-Length")
        request.HTTPMethod = "POST"
        request.HTTPBody = jsonData
        
        loader = AsyncLoaderModel()
        loader!.getDataFromRequest(request: request, dataIndex: -1)
        loader!.delegate = self
    }
    
    func didReceivedData(data data: NSData!, loader: AsyncLoaderModel!, dataIndex: Int)
    {
        processUpdateDeviceToken(data: data)
        let string = NSString(data: data!, encoding: NSUTF8StringEncoding)
        print("Login Response: \(string!)")
        
        self.loader = nil
    }
    
    func didReceivedErrorLoader(loader loader: AsyncLoaderModel!, dataIndex: Int)
    {
        if delegate != nil
        {
            delegate!.didReceivedUpdateDeviceTokenResult(resultCode: AppConstant.Static.CONNECTION_ERROR)
        }
    }
    
    func processUpdateDeviceToken(data data : NSData)
    {
        do
        {
            let result = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as! String
            
            if result != ""
            {
                if delegate != nil
                {
                    delegate!.didReceivedUpdateDeviceTokenResult(resultCode: AppConstant.Static.ADD_USER_SUCCESS)
                }
            }
            else
            {
                if delegate != nil
                {
                    delegate!.didReceivedUpdateDeviceTokenResult(resultCode: AppConstant.Static.PROCESSING_ERROR)
                }
            }
            
        }
        catch
        {
            if delegate != nil
            {
                delegate!.didReceivedUpdateDeviceTokenResult(resultCode: AppConstant.Static.PROCESSING_ERROR)
            }
        }
    }
}