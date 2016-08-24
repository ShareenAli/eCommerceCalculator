//
//  String+EmailValidation.swift
//  ZarJewels
//
//  Created by Priyank Ranka on 06/08/15.
//  Copyright (c) 2015 Nimap Infotech. All rights reserved.
//

import Foundation

extension String {
    var isEmail: Bool {
        let regex = try? NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .CaseInsensitive)
        return regex?.firstMatchInString(self, options: [], range: NSMakeRange(0, self.characters.count)) != nil
    }
    
    func containsWithCaseInsensitive(find: String) -> Bool{
        return self.lowercaseString.rangeOfString(find.lowercaseString) != nil
    }
    
    func containsWithCaseSensitive(find: String) -> Bool{
        return self.rangeOfString(find) != nil
    }
    
    func indexOf(target: String) -> Int
    {
        let range = self.rangeOfString(target)
        if let range = range {
            return self.startIndex.distanceTo(range.startIndex)
        } else {
            return -1
        }
    }
}