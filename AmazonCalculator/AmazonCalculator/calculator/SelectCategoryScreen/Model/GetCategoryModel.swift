//
//  GetCategoryModel.swift
//  AmazonCalculator
//
//  Created by Shareen Ali on 02/08/16.
//  Copyright © 2016 Shareen Ali. All rights reserved.
//

import UIKit

class GetCategoryModel: NSObject {

    var categoryId : Int?
    var categoryName : String?
    var referralFees : Float?
    
    var listClosingFees : [ListClosingFeesModel!]?
        
}

/*
 "listClosingFees": [{
 "initialValue": "0",
 "finalValue": "250",
 "closingFees": 0.0
 },
 */