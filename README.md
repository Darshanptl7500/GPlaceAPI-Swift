#GPlaceAPI-Swift

GPlaceAPI-Swift is an open-source iOS Swift library for fetching [Google Places API][1] using simple API callbacks.

Its Main purpose it to use Google Places API requests with ease in a less lines of code. 

This includes following:

 - [Place Search][2]
     - Nearby Search (search places in a specified area)
     - Text Search (search places based on a search string)
 - [Place Details][3] (get more comprehensive information about a place)
 - [Place Autocomplete][7]  (Get place predictions based on the search text)
 - [Query Autocomplete][8](Get on-the-fly geographic query predictions)

##How To Use


### Manual
 1. Add [Alamofire][4]
    - GPlaceAPI-Swift uses [Alamofire][4] so, you need to add Alamofire in your project 
 2. Download source files from this repository
 3. Add all files from *GPlaceAPI* folder to your project's target

##Usage

You can take a look at the detailed example usage project *GPlaceAPIExample-Swift/GPlaceAPIExample-Swift.xcodeproj*.

#### 1. Setup Google Place API key

In order to communicate with a Google Places API, you must first generate your own API key. Please take a look at [Introduction - Google Places API][5].

You must provide API key to a `GPlaceAPI-Swift` before making any request using it.

//Open "AppDelegate.swift" and set your API_KEY

` GPlaceAPISetup.sharedInstance.setApi_key("SET_API_KEY") `

#### 2. Making a request & get Resonse

```

	var location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(-33.8670522, 151.1957362)
        
        var request = GPPlaceSearchRequest(location: location)
        request.radius = 5000
        request.doFetchPlaces { (response, error) -> Void in
            if error == nil
            {
                if let response = response
                {
                    print(response.results[0].icon!)
                }
                
                
            }
        }

```
Please check [Google Places API documentation][1] for request and resonse. you can search all request parameters and get response of all objects mentioned in [Google Places API documentation][1].


##Compatibility

 - iOS 8.0+

##TODOs

- Add Example project on how to use this library.
- Write test cases for this library.

##Contact

GPlaceAPI-Swift is developed by [Darshan Patel](http://iosexception.com). Please [email](mailto:developer.ios89@gmail.com) to let me know you how you are using this library and anything related to this library.

##Contributing and notes

 - If you like this library, please consider giving it a Github star.

Pull requests are very welcome expecting you follow few rules:

 - Document your changes in a code comments and Git commit message
 - Please do make sure your changes don't trouble with any existing code

##Version history

#### 1.0 Initial Pre-release
- Added first version.


##License
The MIT License (MIT)

Copyright (c) 2015 Darshan Patel

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.


  [1]: https://developers.google.com/places/documentation/
  [2]: https://developers.google.com/places/documentation/search
  [3]: https://developers.google.com/places/documentation/details
  [4]: https://github.com/Alamofire/Alamofire
  [5]: https://developers.google.com/places/documentation/#Authentication
  [7]: https://developers.google.com/places/webservice/autocomplete
  [8]: https://developers.google.com/places/webservice/query
  
