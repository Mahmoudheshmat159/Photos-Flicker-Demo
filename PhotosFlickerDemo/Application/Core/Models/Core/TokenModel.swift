//
//  TokenModel.swift
//
//  Created by Mohamed Abdu on 6/21.
//

import Foundation
// MARK: - ...  Token & refresh Token Model
class TokenModel: Codable {
    var data: String?
    var expires_in: Int?
    var access_token: String?
    var refresh_token: String?
}
