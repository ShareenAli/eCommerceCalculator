//
//  SaveAFNAndMFNParser.swift
//  AmazonCalculator
//
//  Created by Shareen Ali on 02/08/16.
//  Copyright © 2016 Shareen Ali. All rights reserved.
//

import UIKit

protocol SaveAFNAndMFNParserDelegate : NSObjectProtocol
{
    func didReceivedSaveAFNAndMFNStatus(resultCode resultCode : Int)
}

class SaveAFNAndMFNParser: NSObject, AsyncLoaderModelDelegate {
    
    
    var loader : AsyncLoaderModel?
    
    weak var delegate : SaveAFNAndMFNParserDelegate?
    
    func saveAFNAndMFN()
    {
        
        let jsonDict = NSMutableDictionary()
        
//        jsonDict.setValue((), forKey: <#T##String#>)
        
        
        var jsonData : NSData?
        do
        {
            jsonData = try NSJSONSerialization.dataWithJSONObject(jsonDict, options:NSJSONWritingOptions.PrettyPrinted)
        }
        catch
        {
            jsonData = nil
        }
        let jsonDataLength = "\(jsonData!.length)"
        
        let url = NSURL(string: AppConstant.Static.BASE_URL+"")
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
        processSaveData(data: data)
        let string = NSString(data: data!, encoding: NSUTF8StringEncoding)
        print("Login Response: \(string!)")
        self.loader = nil
    }
    
    func didReceivedErrorLoader(loader loader: AsyncLoaderModel!, dataIndex: Int)
    {
        if delegate != nil
        {
            delegate!.didReceivedSaveAFNAndMFNStatus(resultCode: AppConstant.Static.CONNECTION_ERROR)
        }
    }
    
    func processSaveData(data data : NSData)
    {
        do
        {
            let result = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
            
            NSUserDefaults.standardUserDefaults().setObject(result.objectForKey("Status"), forKey: "Status")
            
            if delegate != nil
            {
                delegate!.didReceivedSaveAFNAndMFNStatus(resultCode: AppConstant.Static.ADD_USER_SUCCESS)
            }
        }
        catch
        {
            if delegate != nil
            {
                delegate!.didReceivedSaveAFNAndMFNStatus(resultCode: AppConstant.Static.PROCESSING_ERROR)
            }
        }
    }
}