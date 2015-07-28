//
//  GPReviewsAspects.swift
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

class GPReviewsAspects {
    
    var rating: Int?
    var type: GPReviewAspectType!
    
    init(attributes: Dictionary<String, AnyObject>)
    {
        if let rating = attributes["rating"] as? Int
        {
            self.rating = rating
            
        }
        
        if let type = attributes["type"] as? String
        {
            self.type = self.aspectType(type)
            
        }

    }
    
    private func aspectType(string: String) -> GPReviewAspectType
    {
        if string == GPReviewAspectType.GPReviewAspectTypeAppeal.rawValue
        {
            return .GPReviewAspectTypeAppeal
            
        }else if string == GPReviewAspectType.GPReviewAspectTypeAtmosphere.rawValue
        {
            return .GPReviewAspectTypeAtmosphere
            
        }
        else if string == GPReviewAspectType.GPReviewAspectTypeDecor.rawValue
        {
            return .GPReviewAspectTypeDecor
            
        }
        else if string == GPReviewAspectType.GPReviewAspectTypeFacilities.rawValue
        {
            return .GPReviewAspectTypeFacilities
            
        }
        else if string == GPReviewAspectType.GPReviewAspectTypeFood.rawValue
        {
            return .GPReviewAspectTypeFood
            
        }
        
        return .GPReviewAspectTypeAppeal
    }
}