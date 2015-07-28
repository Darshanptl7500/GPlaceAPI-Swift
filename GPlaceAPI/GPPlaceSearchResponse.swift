//
//  GPPlaceSearchResponse.swift
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
import Alamofire

class GPPlaceSearchResponse {
    
    var html_attributions: String?
    var next_page_token: String?
    var error_message: String?
    var results: [GPResult]!
    var status: GPRequestStatus!

    init(attributes: Dictionary<String, AnyObject>)
    {
        if let tmHtml_attributions = attributes["html_attributions"] as? String
        {
            self.html_attributions = tmHtml_attributions;
            
        }
        
        if let tmNext_page_token = attributes["next_page_token"] as? String
        {
            self.next_page_token = tmNext_page_token;
            
        }
        
        if let tmError_message = attributes["error_message"] as? String
        {
            self.error_message = tmError_message;
            
        }
        
        if let tmStatus = attributes["status"] as? String
        {
            self.status = self.requestStatus(tmStatus);
            
        }
        
        
        self.results = self.results(attributes)
        

    }
    
   private func results(info: Dictionary<String, AnyObject>) -> [GPResult]
    {
        let list = info["results"] as! [AnyObject]
        var muList = [GPResult]();
        
        for tempList in list
        {
            var dic = tempList as! Dictionary<String, AnyObject>
            var result = GPResult(attributes: dic)
            muList.append(result)
            
        }
        
        return muList
    }

    
    func requestStatus(string: String) -> GPRequestStatus
    {
        if string == GPRequestStatus.GPRequestStatusOK.rawValue
        {
            return .GPRequestStatusOK
            
        }else if string == GPRequestStatus.GPRequestStatusZERORESULTS.rawValue
        {
            return .GPRequestStatusZERORESULTS
            
        }
        else if string == GPRequestStatus.GPRequestStatusOVERQUERYLIMIT.rawValue
        {
            return .GPRequestStatusOVERQUERYLIMIT
            
        }
        else if string == GPRequestStatus.GPRequestStatusREQUESTDENIED.rawValue
        {
            return .GPRequestStatusREQUESTDENIED
            
        }
        else if string == GPRequestStatus.GPRequestStatusINVALIDREQUEST.rawValue
        {
            return .GPRequestStatusINVALIDREQUEST
            
        }
        
        return .GPRequestStatusOK
    }
}