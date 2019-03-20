//
//  LoginModel.swift
//  CMS
//
//  Created by Jaspreet Singh on 1/16/19.
//  Copyright © 2019 Jaspreet Singh. All rights reserved.
//

import UIKit

class LoginModel {
    
    var access_token: String?
    var token_type: String?
    var refresh_token: String?
    var expires_in: String?
    var userID: String?
    
    init() {
        
    }
    
    init(dict: [String: Any]) {
        access_token = dict["access_token"] as? String
        token_type = dict["token_type"] as? String
        refresh_token =   dict["refresh_token"] as? String
        expires_in = dict["expires_in"] as? String
        userID = dict["UserID"] as? String
    }
}


