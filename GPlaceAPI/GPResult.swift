//
//  GPResult.swift
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
class GPResult {
    
    var icon: String?
    var name: String?
    var place_id: String?
    var rating: Double?
    var reference: String?
    var scope: String?
    var types: [String]?
    var vicinity: String?
    var geometry: GPGeometry?
    var opening_hours: GPOpeningHours?
    var photos: [GPPhoto]?
    var formatted_address: String?
    var price_level: GPPriceLevel!
    var address_components: [GPAddressComponents]?
    var adr_address: String?
    var formatted_phone_number: String?
    var international_phone_number: String?
    var reviews: [GPReviews]?
    var url: String?
    var user_ratings_total: Int?
    var utc_offset: Int?
    var website: String?
    
    
    init(attributes: Dictionary<String, AnyObject>)
    {
        if let icon = attributes["icon"] as? String
        {
            self.icon = icon;
            
        }
        
        if let name = attributes["name"] as? String
        {
            self.name = name;
            
        }
        
        if let place_id = attributes["place_id"] as? String
        {
            self.place_id = place_id;
            
        }
        
        if let rating = attributes["rating"] as? Double
        {
            self.rating = rating;
            
        }
        
        if let reference = attributes["reference"] as? String
        {
            self.reference = reference;
            
        }
        
        if let scope = attributes["scope"] as? String
        {
            self.scope = scope;
            
        }
        
        if let vicinity = attributes["vicinity"] as? String
        {
            self.vicinity = vicinity;
            
        }
        
        if let types = attributes["types"] as? [String]
        {
            self.types = types;
            
        }
        
        
        if let formatted_address = attributes["formatted_address"] as? String
        {
            self.formatted_address = formatted_address;
            
        }
        
        if let adr_address = attributes["adr_address"] as? String
        {
            self.adr_address = adr_address;
            
        }
        
        if let formatted_phone_number = attributes["formatted_phone_number"] as? String
        {
            self.formatted_phone_number = formatted_phone_number;
            
        }
        
        if let international_phone_number = attributes["international_phone_number"] as? String
        {
            self.international_phone_number = international_phone_number;
            
        }
        
        
        if let url = attributes["url"] as? String
        {
            self.url = url;
            
        }
        
        if let user_ratings_total = attributes["user_ratings_total"] as? Int
        {
            self.user_ratings_total = user_ratings_total;
            
        }
        
        if let utc_offset = attributes["utc_offset"] as? Int
        {
            self.utc_offset = utc_offset;
            
        }
        
        if let website = attributes["website"] as? String
        {
            self.website = website;
            
        }
        
        
        self.geometry = GPGeometry(attributes: attributes["geometry"] as! Dictionary<String, AnyObject>)
        
        
        if let opening_hours = attributes["opening_hours"] as? Dictionary<String, AnyObject>
        {
            self.opening_hours = GPOpeningHours(attributes: opening_hours)
        }
        
      
        if let price_level = attributes["price_level"] as? Int
        {
            self.price_level = self.priceLevel("\(price_level)")
            
        }
        
        self.photos = self.photos(attributes)
        
        self.address_components = self.address_components(attributes)
        
        self.reviews = self.reviews(attributes)
        
    }
    
    private func photos(info: Dictionary<String, AnyObject>) -> [GPPhoto]
    {
        
        var muList = [GPPhoto]();
        
        if let check_photos = info["photos"] as? Array<AnyObject>
        {
            var list  = check_photos
         
            for tempList in list
            {
                var dic = tempList as! Dictionary<String, AnyObject>
                var result = GPPhoto(attributes: dic)
                muList.append(result)
                
            }

        }
        
        return muList
    }
    
    
    private func address_components(info: Dictionary<String, AnyObject>) -> [GPAddressComponents]
    {
        
        var muList = [GPAddressComponents]();
        
        if let check_address = info["address_components"] as? Array<AnyObject>
        {
            var list  = check_address
            
            for tempList in list
            {
                var dic = tempList as! Dictionary<String, AnyObject>
                var result = GPAddressComponents(attributes: dic)
                muList.append(result)
                
            }
            
        }
        return muList
    }
    
    private func reviews(info: Dictionary<String, AnyObject>) -> [GPReviews]
    {
        var muList = [GPReviews]();
        
        if let reviews = info["reviews"] as? Array<AnyObject>
        {
            var list  = reviews
            for tempList in list
            {
                var dic = tempList as! Dictionary<String, AnyObject>
                var result = GPReviews(attributes: dic)
                muList.append(result)
                
            }
            
        }
        
        return muList
    }
    
    func priceLevel(string: String) -> GPPriceLevel
    {
        if string == GPPriceLevel.GPPriceLevelFree.rawValue
        {
            return .GPPriceLevelFree
            
        }else if string == GPPriceLevel.GPPriceLevelExpensive.rawValue
        {
            return .GPPriceLevelExpensive
            
        }
        else if string == GPPriceLevel.GPPriceLevelInexpensive.rawValue
        {
            return .GPPriceLevelInexpensive
            
        }
        else if string == GPPriceLevel.GPPriceLevelModerate.rawValue
        {
            return .GPPriceLevelModerate
            
        }
        else if string == GPPriceLevel.GPPriceLevelVeryExpensive.rawValue
        {
            return .GPPriceLevelVeryExpensive
            
        }
        
        return .GPPriceLevelFree
    }
}