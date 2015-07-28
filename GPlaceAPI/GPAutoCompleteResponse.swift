//
//  GPAutoCompleteResponse.swift
//  GPlaceAPI-Swift
//
//  Created by Darshan Patel on 7/24/15.
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
class GPAutoCompleteResponse {
    
    var predictions: [GPPredictions]?
    var status: GPRequestStatus!
    
    init(attributes: Dictionary<String, AnyObject>)
    {
        
        if let tmStatus = attributes["status"] as? String
        {
            self.status = self.requestStatus(tmStatus);
            
        }
        
        self.predictions = self.predictions(attributes)
        
    }
    
    private func predictions(info: Dictionary<String, AnyObject>) -> [GPPredictions]
    {
        
        var muList = [GPPredictions]();
        
        if let check_predictions = info["predictions"] as? Array<AnyObject>
        {
            var list  = check_predictions
            
            for tempList in list
            {
                var dic = tempList as! Dictionary<String, AnyObject>
                var result = GPPredictions(attributes: dic)
                muList.append(result)
                
            }
            
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