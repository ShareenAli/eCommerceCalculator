//
//  GetCategoryParser.swift
//  AmazonCalculator
//
//  Created by Shareen Ali on 02/08/16.
//  Copyright © 2016 Shareen Ali. All rights reserved.
//

import UIKit

@objc protocol GetCategoryParserDelegate : NSObjectProtocol
{
    func didReceivedCategory(categories category : [GetCategoryModel])
    func didReceivedCategoryWithError(status status : Int)
}


class GetCategoryParser: NSObject, AsyncLoaderModelDelegate {

    var loader : AsyncLoaderModel?
    weak var delegate : GetCategoryParserDelegate?

    func getCategory()
    {
        loader = AsyncLoaderModel()
        loader!.getDataFromURLString(webURL: AppConstant.Static.BASE_URL + "getCategories" , dataIndex: -1 )
        loader!.delegate = self
    }
 
    func didReceivedData(data data: NSData!, loader: AsyncLoaderModel!, dataIndex: Int)
    {
        let responseString = NSString(data: data, encoding: NSUTF8StringEncoding)
        print("ResponseString of Products \(responseString!)")
        processData(data: data)
        self.loader = nil
    }
    
    func didReceivedErrorLoader(loader loader: AsyncLoaderModel!, dataIndex: Int) {
        if delegate != nil
        {
            delegate!.didReceivedCategoryWithError(status: AppConstant.Static.CONNECTION_ERROR)
        }
        
        self.loader = nil
    }
    
    func processData(data data : NSData)
    {
        do
        {
            let result = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
            
            let getCategoryModel = GetCategoryModel()

            var categoryArrayDict = result.objectForKey("category") as! [NSDictionary]!
            
            var categoryArray : [GetCategoryModel] = []
            for j in 0..<categoryArrayDict.count
            {
                let getCategoryDict = categoryArrayDict[j]
                let getCategories = GetCategoryModel()
                
                getCategories.categoryId = getCategoryDict.objectForKey("categeoryId") as! Int!
                getCategories.categoryName = getCategoryDict.objectForKey("categoryName") as! String!
                getCategories.referralFees = getCategoryDict.objectForKey("referralFees") as! Float!
                
                let closingArrayDict = getCategoryDict.objectForKey("listClosingFees") as! [NSDictionary]!
                
                var listClosingArray : [ListClosingFeesModel] = []
                for k in 0..<closingArrayDict.count
                {
                    let listClosingDict = closingArrayDict[k]
                    let listClosing = ListClosingFeesModel()
                    
                    listClosing.initialValue = Int(listClosingDict.objectForKey("initialValue") as! String!)
                    listClosing.finalValue = Int(listClosingDict.objectForKey("finalValue") as! String!)
                    listClosing.closingFees = listClosingDict.objectForKey("closingFees") as! Double!

                }
                
                getCategories.listClosingFees = listClosingArray
                
                categoryArray.append(getCategories)
            }
            if result != ""
            {
                if delegate != nil
                {
                    delegate!.didReceivedCategory(categories : categoryArray)
                }
            }
            else
            {
                if delegate != nil
                {
                    delegate!.didReceivedCategoryWithError(status: AppConstant.Static.PROCESSING_ERROR)
                }
            }

        }
        catch
        {
            if delegate != nil
            {
                delegate!.didReceivedCategoryWithError(status: AppConstant.Static.PROCESSING_ERROR)
            }
        }
    }
}