//
//  VideoError.swift
//  FlickerDemo
//
//  Created by apple on 4/12/22.
//  Copyright © 2022 Mahmoud.Heshmat. All rights reserved.
//

import Foundation

enum VideoError: String {
    case invalidUrl
    case failedToPlay
    
    var title: String {
        switch self {
        case .invalidUrl:
            return "No content avalible".localized
        case .failedToPlay:
            return "Failed play video".localized
        }
    }
}
