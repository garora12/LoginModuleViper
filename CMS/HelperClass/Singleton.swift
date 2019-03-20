//
//  Singleton.swift
//  CMS
//
//  Created by Jaspreet Singh on 1/24/19.
//  Copyright © 2019 Jaspreet Singh. All rights reserved.
//

import UIKit

class Singleton: NSObject {
    
    static let shared = Singleton()
    
    var loginToken: LoginModel?
    
    var selectedProjectID = 1
    
    var latitude = "30.710747"
    
    var longitude = "76.709366"
    
    func UTCToLocal(date:String) -> String {
        let dateFormatter = DateFormatter()
//        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        let dt = dateFormatter.date(from: date)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return dateFormatter.string(from: dt!)
    }
    
    func colourFromText(colourText: String)-> UIColor{
        if colourText.capitalized == "RED"{
            return UIColor.red
        }else if colourText.capitalized == "YELLOW"{
            return UIColor.yellow
        }else if colourText.capitalized == "GREEN"{
            return UIColor.green
        }else{
            return UIColor.red
        }
    }
    
    func UTCToLocalDay(date:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        let dt = dateFormatter.date(from: date)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "MMMM dd,yyyy"
        
        return dateFormatter.string(from: dt!)
    }
}

class Manager: NSObject {
    
    static let instance: Manager = {
        
        return Manager()
    }()
    
    func startInternetConnectionNotifier() {
        
        internetConnectionReachability = Reachability.reachabilityForInternetConnection()
        
        let currentStatus = internetConnectionReachability.currentReachabilityStatus
        
        isInternetActive = false
        
        if(currentStatus == Reachability.NetworkStatus.reachableViaWiFi || currentStatus == Reachability.NetworkStatus.reachableViaWWAN) {
            isInternetActive = true
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.reachabilityChanged(_:)), name: NSNotification.Name.init(rawValue: "ReachabilityChangedNotification"), object: nil)
        
        _ = internetConnectionReachability.startNotifier()
}
    
    @objc func reachabilityChanged(_ notification: Notification) {
        
        isInternetActive = false
        
        if(internetConnectionReachability.isReachable()) {
            isInternetActive = true
        }
    }

}
