//
//  GPPredictions.swift
//  GPlaceAPI-Swift
//
//  Created by Darshan Patel on 7/23/15.
//  Copyright (c) 2015 Darshan Patel. All rights reserved.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 Darshan Patel
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation
class GPPredictions {
    var place_description: String?
    var autoId: String?
    var matched_substrings: [GPMatchedSubstring]?
    var place_id: String?
    var reference: String?
    var terms: [GPTerms]?
    var types: [String]?;
    
    init(attributes: Dictionary<String, AnyObject>)
    {
        if let place_description = attributes["place_description"] as? String
        {
            self.place_description = place_description;
            
        }
        
        if let autoId = attributes["autoId"] as? String
        {
            self.autoId = autoId;
            
        }
        
        if let place_id = attributes["place_id"] as? String
        {
            self.place_id = place_id;
            
        }
        
        if let reference = attributes["reference"] as? String
        {
            self.reference = reference;
            
        }
        
        if let types = attributes["types"] as? Array<String>
        {
            self.types = types;
            
        }
        
        self.matched_substrings = self.matched_substrings(attributes)
        
        self.terms = self.terms(attributes);
    }
    
    private func matched_substrings(info: Dictionary<String, AnyObject>) -> [GPMatchedSubstring]
    {
        let list = info["matched_substrings"] as! [AnyObject]
        var muList = [GPMatchedSubstring]();
        
        for tempList in list
        {
            var dic = tempList as! Dictionary<String, AnyObject>
            var result = GPMatchedSubstring(attributes: dic)
            muList.append(result)
            
        }
        
        return muList
    }
    
    private func terms(info: Dictionary<String, AnyObject>) -> [GPTerms]
    {
        var muList = [GPTerms]();
        
        if let terms = info["terms"] as? Array<AnyObject>
        {
            var list  = terms
            
            for tempList in list
            {
                var dic = tempList as! Dictionary<String, AnyObject>
                var result = GPTerms(attributes: dic)
                muList.append(result)
            }
        }
        return muList
    }
}