///**

/**

PhotosFlickerDemo

Created by: apple on 8/4/23

Copyright (c) 2023 Rowaad


**/


import Foundation

struct APIParamConstantHelper {
    
    static let shared = APIParamConstantHelper()
    
    public var method: String = "flickr.photos.search"
    public var format: String = "json"
    public var text: String = "Color"
    public var perPage = 20
    public var api_key: String = Authentication.shared.key
    public var nojsoncallback = 50
}

