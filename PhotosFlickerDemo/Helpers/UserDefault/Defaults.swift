//
//  Defaults.swift
//  BaseIOS
//
//  Created by Mabdu on 14/06/2021.
//  Copyright © 2021 com.mabdu. All rights reserved.
//

import Foundation

// MARK: - ...  Defaults properties
internal class Defaults {
    struct Static {
        static var instance: Defaults?
    }
    
    @StoredDefaults("userDataDefaults")
    var user: UserRoot?
    
    @StoredDefaults("USER_LOGIN_REMEMBER")
    var LoginRemember: Bool?
    
    @StoredDefaults("expires_in")
    var expiresToken: Int?
    
    @StoredDefaults("LOGIN_TIMESTAMP")
    var loginTimeStamp: Int?
    
    @StoredDefaults("DEVICE_TOKEN")
    var DEVICE_TOKEN: String?
    
    @StoredDefaults("locale")
    var locale: String?
    
    @StoredDefaults("default.language.ia")
    var defaultLangauge: String?
    
    @StoredDefaults("loginModel")
    var isLogin: Bool?
    
    @StoredDefaults("token")
    var token: String?
    
    @StoredDefaults("guestToken")
    var guestToken: String?
}
