//
//  AsyncLoaderModel.swift
//  APIsProject
//
//  Created by Priyank Ranka on 20/02/15.
//  Copyright (c) 2015 Nimap Infotech. All rights reserved.
//

import UIKit

/*
In swift you can declare an enum, variable or function outside of any class or function and it will be available in all your classes (globally)(without the need to import a specific file).
*/

let DATA_NOT_DOWNLOADED =   0
let DATA_DOWNLOADING    =   1
let DATA_DOWNLOADED     =   2

let DATA_NOT_UPLOADED   =   3
let DATA_UPLOADING      =   4
let DATA_UPLOADED       =   5

@objc protocol AsyncLoaderModelDelegate : NSObjectProtocol{
    
    func didReceivedData(data data : NSData!, loader : AsyncLoaderModel!, dataIndex : Int)
    func didReceivedErrorLoader(loader loader : AsyncLoaderModel!, dataIndex : Int)
    
    optional func didReceiveError404Loader(loader loader : AsyncLoaderModel!, dataIndex : Int)
    optional func didReceiveError404Loader(loader loader : AsyncLoaderModel!, dataIndex : Int, sectionIndex: Int)
    
    optional func didreceiveUploadProgress (progress progress : Float, dataIndex : Int)
    optional func didreceiveDownloadProgress (progress progress : Float, dataIndex : Int)
    
    optional func didreceiveUploadProgress (progress progress : Float, dataIndex : Int, sectionIndex: Int)
    optional func didreceiveDownloadProgress (progress progress : Float, dataIndex : Int, sectionIndex: Int)
    
    optional func didReceivedData(data data : NSData!, loader : AsyncLoaderModel!, dataIndex : Int, sectionIndex: Int)
    optional func didReceivedErrorLoader(loader loader : AsyncLoaderModel!, dataIndex : Int, sectionIndex: Int)
}

class AsyncLoaderModel: NSObject {
   
    var webData:NSMutableData!
    
    var webConnection: NSURLConnection!
    
    var state : Int!
    var responseCode: Int!
    
    var dataIndex: Int!
    var sectionIndex: Int!
    var isImageDownloading: Bool!
    
    var delegate: AsyncLoaderModelDelegate?
    
    func getDataFromURLString(webURL  webURL:String!, dataIndex:Int!)
    {
        state               =   DATA_DOWNLOADING;
        self.dataIndex      =   dataIndex;
    
        var webDataURL: NSURL?

        /*
        We need to check whether URL contains % or not. If it already contains than
        we dont have to apply percentage in URL
        */
        if !webURL.containsWithCaseInsensitive("%")
        {
            webDataURL      =	NSURL(string: webURL.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!)
        }
        else
        {
            webDataURL      =	NSURL(string: webURL!)
        }
        let webRequest      =   NSURLRequest(URL: webDataURL!)
        webConnection       =   NSURLConnection(request: webRequest, delegate: self)
    }
    
    func getDataFromURLString(webURL  webURL:String!, dataIndex:Int!, sectionIndex:Int!){
        
        state               =   DATA_DOWNLOADING;
        self.dataIndex      =   dataIndex;
        self.sectionIndex   =   sectionIndex
        
    
        var webDataURL: NSURL?
        
        /*
        We need to check whether URL contains % or not. If it already contains than
        we dont have to apply percentage in URL
        */
        if !webURL.containsWithCaseInsensitive("%")
        {
            webDataURL      =	NSURL(string: webURL.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!)
        }
        else
        {
            webDataURL      =	NSURL(string: webURL!)
        }
        
        let webRequest      =   NSURLRequest(URL: webDataURL!)
        webConnection       =   NSURLConnection(request: webRequest, delegate: self)
    }
    
    
    func getDataFromRequest(request  request: NSURLRequest!, dataIndex:Int!)
    {
        state               =   DATA_DOWNLOADING;
        self.dataIndex      =   dataIndex;
        
        webConnection       =   NSURLConnection(request: request, delegate: self)
    }
    
    func getDataFromRequest(request  request: NSURLRequest!, dataIndex:Int!, sectionIndex:Int!)
    {
        state               =   DATA_DOWNLOADING;
        self.dataIndex      =   dataIndex;
        self.sectionIndex   =   sectionIndex
        
        webConnection       =   NSURLConnection(request: request, delegate: self)
    }
    
     /*
      make sure otherParameters dictionary will always have key and value both as String objects
    */
    
    func getJsonData(message  message : String!, jsonObjects: NSDictionary!, url:String!, otherParameters:NSDictionary!, key:String!, dataIndex: Int!)
    {
        state               =   DATA_DOWNLOADING;
        self.dataIndex      =   dataIndex;
        
        var request: NSMutableURLRequest?
        
        /*
        We need to check whether URL contains % or not. If it already contains than
        we dont have to apply percentage in URL
        */
        if url.containsWithCaseInsensitive("%")
        {
            request = NSMutableURLRequest(URL: NSURL(string: url)!)
        }
        else
        {
            request = NSMutableURLRequest(URL: NSURL(string: url.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!)!)
        }
        
        request!.HTTPMethod  =   "POST"
        
        if jsonObjects != nil {
            
            //var error: NSErrorPointer! = nil;
            var data: NSData?
            do {
                data = try NSJSONSerialization.dataWithJSONObject(jsonObjects, options: NSJSONWritingOptions.PrettyPrinted)
            } catch _ {
                //# /* TODO: Finish migration: handle the expression passed to error arg: error */
                data = nil
            }
            
            request!.HTTPBody    =   data
            
            let contentLength = data!.length
            request!.setValue(String(contentLength), forHTTPHeaderField: "Content-Length")
        }
        request!.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        if otherParameters != nil
        {
            /*
            this means that there are other header parameter to be set for the request for 
            eg: [request setValue:@"nimap iOS 1.0 " forHTTPHeaderField:@"User-Agent"];
            */
            for (key,value) in otherParameters
            {
                request!.setValue(value as? String, forHTTPHeaderField: key as! String)
            }
        }
       
        webConnection       =   NSURLConnection(request: request!, delegate: self)
    }
    
    func getJsonData(message  message : String!, jsonObjects: NSDictionary!, url:String!, otherParameters:NSDictionary!, key:String!, dataIndex: Int!, sectionIndex : Int!)
    {
        state               =   DATA_DOWNLOADING
        self.dataIndex      =   dataIndex
        self.sectionIndex   =   sectionIndex
        
       
        var request: NSMutableURLRequest?
        
        /*
        We need to check whether URL contains % or not. If it already contains than
        we dont have to apply percentage in URL
        */
        if url.containsWithCaseInsensitive("%")
        {
            request = NSMutableURLRequest(URL: NSURL(string: url)!)
        }
        else
        {
            request = NSMutableURLRequest(URL: NSURL(string: url.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!)!)
        }
        
        request!.HTTPMethod  =   "POST"
        
        /*
         If web service has some paramters to pass to the Post method
        */
        if jsonObjects != nil {
         
            //var error: NSErrorPointer! = nil;
            var data: NSData?
            do {
                data = try NSJSONSerialization.dataWithJSONObject(jsonObjects, options: NSJSONWritingOptions.PrettyPrinted)
            } catch _ {
                //# /* TODO: Finish migration: handle the expression passed to error arg: error */
                data = nil
            }
            
            request!.HTTPBody    =   data
            
            let contentLength = data!.length
            request!.setValue(String(contentLength), forHTTPHeaderField: "Content-Length")
        }
        
        request!.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        if otherParameters != nil {
            
            /*
            this means that there are other header parameter to be set for the request for
            eg: [request setValue:@"nimap iOS 1.0 " forHTTPHeaderField:@"User-Agent"];
            */
            for (key,value) in otherParameters{
                
                request!.setValue(value as? String, forHTTPHeaderField: key as! String)
            }
        }
        
        webConnection       =   NSURLConnection(request: request!, delegate: self)
    }
    
    func uploadDataToServer(data  data: NSData!, url:String!,dataIndex: Int!){
     
        state               =   DATA_UPLOADING
        self.dataIndex      =   dataIndex
        
        var request: NSMutableURLRequest?
        
        /*
        We need to check whether URL contains % or not. If it already contains than
        we dont have to apply percentage in URL
        */
        if url.containsWithCaseInsensitive("%")
        {
            request = NSMutableURLRequest(URL: NSURL(string: url)!)
        }
        else
        {
            request = NSMutableURLRequest(URL: NSURL(string: url.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!)!)
        }
        
        request!.timeoutInterval = 60.0
        request!.HTTPMethod  =   "POST"
        request!.setValue("image/jpeg", forHTTPHeaderField:"Content-Type")
        request!.HTTPBodyStream = NSInputStream(data: data)
        
        webConnection       =   NSURLConnection(request: request!, delegate: self)
    }
    
    func uploadDataToServer(data  data: NSData!, url:String!,dataIndex: Int!, sectionIndex : Int!){
        
        state               =   DATA_UPLOADING
        self.dataIndex      =   dataIndex
        self.sectionIndex   =   sectionIndex
        
        var request: NSMutableURLRequest?
        
        /*
        We need to check whether URL contains % or not. If it already contains than
        we dont have to apply percentage in URL
        */
        if url.containsWithCaseInsensitive("%")
        {
            request = NSMutableURLRequest(URL: NSURL(string: url)!)
        }
        else
        {
            request = NSMutableURLRequest(URL: NSURL(string: url.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!)!)
        }
        request!.timeoutInterval = 60.0
        request!.HTTPMethod  =   "POST"
        request!.setValue("image/jpeg", forHTTPHeaderField:"Content-Type")
        request!.HTTPBodyStream = NSInputStream(data: data)
        
        webConnection       =   NSURLConnection(request: request!, delegate: self)
    }
    
    func cancel(){
        
        if webConnection != nil {
            
            webConnection.cancel()
            webConnection   =   nil
        }
    }
    
// MARK: NSURLConnectionDelegate callbacks
    
    func connection(connection: NSURLConnection, didFailWithError error: NSError)
    {
        state  =   DATA_NOT_DOWNLOADED;
        
        if delegate != nil
        {
            if delegate!.respondsToSelector(Selector("didReceivedErrorLoader:::"))
            {
                delegate!.didReceivedErrorLoader!(loader: self, dataIndex: dataIndex, sectionIndex: sectionIndex)
            }
            else
            {
                delegate!.didReceivedErrorLoader(loader: self, dataIndex: self.dataIndex)   
            }
            
        }
        
        webConnection  =   nil;
        webData     =   nil;

    }
    
    func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse)
    {
        responseCode = (response as! NSHTTPURLResponse).statusCode;
        
        //print("didReceiveResponse \(responseCode)")
        
        if(responseCode == 404)
        {
            self.state  =   DATA_NOT_DOWNLOADED;
            
            if delegate != nil
            {
                if delegate!.respondsToSelector(Selector("didReceiveError404Loader::"))
                {
                    delegate!.didReceiveError404Loader!(loader: self, dataIndex: dataIndex)
                }
                else if delegate!.respondsToSelector(Selector("didReceiveError404Loader:::"))
                {
                    delegate!.didReceiveError404Loader!(loader: self, dataIndex: dataIndex, sectionIndex: sectionIndex)
                }
                else{
                    
                    if delegate!.respondsToSelector(Selector("didReceivedErrorLoader:::"))
                    {
                        delegate!.didReceivedErrorLoader!(loader: self, dataIndex: dataIndex, sectionIndex: sectionIndex)
                    }
                    else
                    {
                        delegate!.didReceivedErrorLoader(loader: self, dataIndex: self.dataIndex)
                    }
                }
                
            }

            webConnection.cancel()
            webConnection  =   nil;
            webData     =   nil;
        }
        else
        {
            webData = NSMutableData()
        }
    }
    
    func connection(connection: NSURLConnection, didReceiveData data: NSData)
    {
        webData.appendData(data)
    }
    
    func connection(connection: NSURLConnection, didSendBodyData bytesWritten: Int, totalBytesWritten: Int, totalBytesExpectedToWrite: Int)
    {
        if self.delegate != nil
        {
            let progress = (totalBytesWritten as NSNumber).floatValue/(totalBytesExpectedToWrite as NSNumber).floatValue;
            
            if delegate!.respondsToSelector(Selector("didreceiveUploadProgress::"))
            {
                delegate!.didreceiveUploadProgress!(progress: progress, dataIndex: dataIndex)
            }
            else if delegate!.respondsToSelector(Selector("didreceiveUploadProgress:::"))
            {
                delegate!.didreceiveUploadProgress!(progress: progress, dataIndex: dataIndex, sectionIndex: sectionIndex)
            }
        }
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection)
    {
        self.state  =   DATA_DOWNLOADED;
        //println("connectionDidFinishLoading")
        if delegate != nil
        {
            if delegate!.respondsToSelector(Selector("didReceivedData:::"))
            {
                delegate!.didReceivedData!(data: webData, loader: self, dataIndex: dataIndex, sectionIndex: sectionIndex)
            }
            else
            {
                delegate!.didReceivedData(data: webData, loader: self, dataIndex: dataIndex)
            }
            
        }
        webConnection  =   nil;
        webData     =   nil;
    }
}
