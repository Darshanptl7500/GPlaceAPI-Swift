//
//  GPOpeningHours.swift
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

class GPOpeningHours {
    
    var open_now: Bool?
    var weekday_text: [String]?
    var periods: [GPOpeningHoursPeriods]?

    init(attributes: Dictionary<String, AnyObject>)
    {
        if let open_now = attributes["open_now"] as? Bool
        {
            self.open_now = open_now;
            
        }
        
        if let weekday_text = attributes["weekday_text"] as? Array<String>
        {
            self.weekday_text = weekday_text;
            
        }
        
        
        self.periods = self.periods(attributes)
        
    }
    
    private func periods(info: Dictionary<String, AnyObject>) -> [GPOpeningHoursPeriods]
    {

        var muList = [GPOpeningHoursPeriods]();
        
        if let periods = info["periods"] as? Array<AnyObject>
        {
            var list  = periods
            for tempList in list
            {
                var dic = tempList as! Dictionary<String, AnyObject>
                var result = GPOpeningHoursPeriods(attributes: dic)
                muList.append(result)
                
            }
            
        }
        
        return muList
    }
}