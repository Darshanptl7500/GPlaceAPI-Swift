//
//  GPReviews.swift
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
class GPReviews {
    
    var aspects: [GPReviewsAspects]?
    var author_name: String?
    var author_url: String?
    var language: String?
    var rating: Int?
    var text: String?
    var time: Int?
    
    init(attributes: Dictionary<String, AnyObject>)
    {
        if let author_name = attributes["author_name"] as? String
        {
            self.author_name = author_name;
            
        }
        
        if let author_url = attributes["author_url"] as? String
        {
            self.author_url = author_url;
            
        }
        
        if let language = attributes["language"] as? String
        {
            self.language = language;
            
        }
        
        if let rating = attributes["rating"] as? Int
        {
            self.rating = rating;
            
        }
        
        if let text = attributes["text"] as? String
        {
            self.text = text;
            
        }
        
        if let time = attributes["time"] as? Int
        {
            self.time = time;
            
        }
        
        self.aspects = self.aspects(attributes)
        
       
    }
    
    private func aspects(info: Dictionary<String, AnyObject>) -> [GPReviewsAspects]
    {
    
        var muList = [GPReviewsAspects]();
        
        if let aspects = info["aspects"] as? Array<AnyObject>
        {
            var list  = aspects
            
            for tempList in list
            {
                var dic = tempList as! Dictionary<String, AnyObject>
                var result = GPReviewsAspects(attributes: dic)
                muList.append(result)
            }
        }

        
        return muList
    }

}