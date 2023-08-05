//
//  FlickerDemo
//
//  Created by apple on 8/4/23.
//  Copyright © 2023 Mahmoud.Heshmat. All rights reserved.
//


import Foundation

// MARK: - ...  Entity
struct MoviesModel: Codable {
    let photos: Photos?
    let stat: String?
    
    // MARK: - Photos
    struct Photos: Codable {
        let page, pages, perpage, total: Int?
        let photo: [Photo]?
    }
    
    // MARK: - Photo
    struct Photo: Codable {
        var id, owner, secret, server: String?
        var farm: Int?
        var title: String?
        var ispublic, isfriend, isfamily: Int?
        var type: PhotoType?
        
        init(type: PhotoType){
            self.type = type
        }
        
        var movieImg: String? {
            guard let farm = farm,
                  let server = server,
                  let id = id,
                  let secret = secret else { return nil }
            return "http://farm\(farm).static.flickr.com/\(server)/\(id)_\(secret).jpg"
        }
    }
}

enum PhotoType: String, Codable {
    case movie, banner
}
