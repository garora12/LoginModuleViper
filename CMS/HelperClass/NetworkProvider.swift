//
//  NetworkProvider.swift
//  ViperDemo
//
//  Created by Jaspreet Kaur on 1/17/19.
//  Copyright © 2019 Jaspreet Kaur. All rights reserved.
//

import UIKit
import Alamofire

class NetworkProvider: NSObject {

    typealias completionBlock = ([String: Any], DataResponse<Any>) -> Void
    typealias failureBlock = (Error) -> Void

    static let shared = NetworkProvider()
    
    func serviceApi(_ urlString: String, requestDict : [String :AnyObject]?, method: HTTPMethod, compBlock : @escaping completionBlock, failure : @escaping failureBlock) {
        
        var headers = [String: String]()
        let accessToken = Singleton.shared.loginToken
        
        headers["Accept"] = "application/json"
        headers["Content-Type"] = "application/x-www-form-urlencoded"
        headers["Authorization"] = "Bearer \(accessToken?.access_token ?? "")"
        
        if isInternetActive == true {
            
            Alamofire.request(urlString, method: method, parameters: requestDict, encoding:  URLEncoding.httpBody, headers: headers).responseJSON { (response:DataResponse<Any>) in
                switch(response.result) {
                    
                case .success(_):
                    
                    if response.result.value != nil{
                        //                    print(response.result.value ?? )
                        let statusCode = (response.response?.statusCode)!
                        print("...HTTP code: \(statusCode)")
                        var responseDict = [String: Any]()
                        
                        if let jsonDict = response.result.value as? [String: Any] {
                            
                            responseDict = jsonDict
                        }
                        compBlock(responseDict, response)
                    }
                    break
                case .failure(_):
                    failure(response.result.error!)
                    break
                }
            }
        } else {
//            compBlock([:], Any)
        }
    }
    
//    func MultipartServiceApi(_ urlString: String,fileData: Data, requestDict : [String :AnyObject]?, method: HTTPMethod, compBlock : @escaping completionBlock, failure : @escaping failureBlock) {
//
//        var headers = [String: String]()
//        let accessToken = Singleton.shared.loginToken
//
//        headers["Accept"] = "application/json"
//        headers["Content-Type"] = "application/x-www-form-urlencoded"
//        headers["Authorization"] = "Bearer \(accessToken?.access_token ?? "")"
//
//        if isInternetActive == true {
//
//            Alamofire.upload(multipartFormData: { (multipartFormData) in
//                multipartFormData.append(fileData, withName: "payload", fileName: "someFile.jpg", mimeType: "image/jpeg")
//
//            }, to: urlString, encodingCompletion: { (encodingResult) in
//                                    switch encodingResult {
//                                    case .Success(let upload, _, _):
//
//                                        upload.responseJSON { request, response, JSON, error in
//
//
//                                        }
//                                    case .Failure(let encodingError):
//
//                                    }
//
//            })
////            Alamofire.upload(
////                .POST,
////                URLString: urlString, // http://httpbin.org/post
////                multipartFormData: { multipartFormData in
////                    multipartFormData.appendBodyPart(fileURL: imagePathUrl!, name: "photo")
////                    multipartFormData.appendBodyPart(fileURL: videoPathUrl!, name: "video")
////                    multipartFormData.appendBodyPart(data: Constants.AuthKey.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!, name :"authKey")
////                    multipartFormData.appendBodyPart(data: "\(16)".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!, name :"idUserChallenge")
////                    multipartFormData.appendBodyPart(data: "comment".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!, name :"comment")
////                    multipartFormData.appendBodyPart(data:"\(0.00)".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!, name :"latitude")
////                    multipartFormData.appendBodyPart(data:"\(0.00)".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!, name :"longitude")
////                    multipartFormData.appendBodyPart(data:"India".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!, name :"location")
////            },
////                encodingCompletion: { encodingResult in
////                    switch encodingResult {
////                    case .Success(let upload, _, _):
////                        upload.responseJSON { request, response, JSON, error in
////
////
////                        }
////                    case .Failure(let encodingError):
////
////                    }
////            }
////            )
////            Alamofire.request(urlString, method: method, parameters: requestDict, encoding:  URLEncoding.httpBody, headers: headers).responseJSON { (response:DataResponse<Any>) in
////                switch(response.result) {
////
////                case .success(_):
////
////                    if response.result.value != nil{
////                        //                    print(response.result.value ?? )
////                        let statusCode = (response.response?.statusCode)!
////                        print("...HTTP code: \(statusCode)")
////                        var responseDict = [String: Any]()
////
////                        if let jsonDict = response.result.value as? [String: Any] {
////
////                            responseDict = jsonDict
////                        }
////                        compBlock(responseDict, response)
////                    }
////                    break
////                case .failure(_):
////                    failure(response.result.error!)
////                    break
////                }
////            }
////        } else {
////            //            compBlock([:], Any)
////        }
//    }
////
////
////
////
////
}

