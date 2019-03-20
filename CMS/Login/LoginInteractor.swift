//
//  LoginInteractor.swift
//  CMS
//
//  Created by Jaspreet Singh on 1/16/19.
//  Copyright © 2019 Jaspreet Singh. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class LoginInteractor: PresentorToInterectorProtocol {
    
    var presenter: InterectorToPresenterProtocol?
    
    func fetchUser(UserDict: [String : Any]) {
        
        NetworkProvider.shared.serviceApi(Constant.loginUrl, requestDict: UserDict as [String : AnyObject], method: .post, compBlock: { (responseDict, response)  in
              LoaderView.shared.hideFromView()
            print(responseDict)
            if response.response?.statusCode == 200 {
                var dict = [String: Any]()
                dict["token_type"] = responseDict["token_type"]
                dict["access_token"] = responseDict["access_token"]
                dict["refresh_token"] = responseDict["refresh_token"]
                dict["expires_in"] = responseDict["expires_in"]
                dict["UserID"]  = responseDict["UserID"] 
                let tokenInfo = LoginModel(dict: dict)
                Singleton.shared.loginToken = tokenInfo
                self.presenter?.fetchUser(Userdetail: tokenInfo)
            }
            
        }) { (failure) in
             LoaderView.shared.hideFromView()
            self.presenter?.fetchUserFailed()
            print(failure.localizedDescription)
        }
    }
}
