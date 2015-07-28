//
//  GPPlaceSearchRequest.swift
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
import CoreLocation
import Alamofire


class GPPlaceSearchRequest {
    
    typealias GooglePlaceSearchHandler = (GPPlaceSearchResponse?, NSError?)->Void
    
    var location: CLLocationCoordinate2D!
    var radius: Int!
    var rankby: GPRankBy!
    var keyword: String?
    var language: String?
    var minprice: Int?
    var maxprice: Int?
    var name: String?
    var opennow: Bool?
    var types:[String]?
    var pagetoken: String?
    
    init (location: CLLocationCoordinate2D) {
        
        self.location = location;
        self.radius = 1000
        self.minprice = -1
        self.maxprice = -1
        self.rankby = .GPRankByProminence
        
    }
    
    func params() -> Dictionary<String, AnyObject> {
        
        var dicParams = Dictionary<String, AnyObject>()
        
        dicParams["key"] = GPlaceAPISetup.sharedInstance.Api_Key
        dicParams["location"] = "\(self.location.latitude),\(self.location.longitude)"
        
        if let opRadius = self.radius
        {
            dicParams["radius"] = "\(self.radius)";
        }
        
        if let opKeyWord = self.keyword
        {
            dicParams["keyword"] = self.keyword;
        }
        
        if self.maxprice != -1
        {
            dicParams["maxprice"] =  "\(self.maxprice)";
            
        }
        
        if self.minprice != -1
        {
            dicParams["maxprice"] =  "\(self.minprice)";
            
        }
        
        if let opName = self.name
        {
            dicParams["name"]  = self.name
        }
        
        if self.opennow == true
        {
            dicParams["opennow"] = "\(self.opennow)"
        }
        
        if let language = self.language
        {
            dicParams["language"] = language
            
        }
        
        if let opPageToken = self.pagetoken
        {
            dicParams["pagetoken"]  = self.pagetoken
        }
        
        dicParams["rankBy"] = self.rankby.rawValue
        
        
        if let opTypes = self.types
        {
            if opTypes.count > 0
            {
                dicParams["types"] = join("|", opTypes)
            }
        }
        
        
        
        return dicParams
    }
    
    func doFetchPlaces(handler : GooglePlaceSearchHandler)
    {
        Alamofire.request(.GET, "\(GPlaceConstants.kAPI_PLACES_URL)nearbysearch/json", parameters: self.params(), encoding: .URL).responseJSON(options: .AllowFragments) { (request, response, data, error) -> Void in
            
            if error == nil
            {
                var gpResponse = GPPlaceSearchResponse(attributes: data as! Dictionary)
                
                handler(gpResponse, error)
                
                
            }else
            {
                handler(nil, error)
            }
        }
        
        
    }
    
}