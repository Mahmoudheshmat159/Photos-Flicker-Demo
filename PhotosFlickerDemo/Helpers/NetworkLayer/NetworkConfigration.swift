//
//  EndPoint.swift
//  SupportI
//
//  Created by Mohamed Abdu on 3/20/20.
//  Copyright © 2020 MahmoudHeshmat. All rights reserved.
//

import Foundation
import UIKit
// MARK: - ...  Network layer configration
struct NetworkConfigration {
    static let URL = "https://www.flickr.com/services/"
    static let VERSION = "v1"
    static var useAuth: Bool = false
    // MARK: - ...  The Endpoints
    public enum EndPoint: String {
        case token
        case rest
        
    }
}

extension NetworkConfigration.EndPoint {
    static func endPoint(point: NetworkConfigration.EndPoint, paramters: [Any]) -> String {
        let method = NetworkManager.instance.slugs(point, paramters)
        return method
    }
}

