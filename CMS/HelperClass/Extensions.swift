//
//  Extensions.swift
//  CMS
//
//  Created by Singh Arshdeep on 3/20/19.
//  Copyright © 2019 Jaspreet Singh. All rights reserved.
//

import UIKit


extension String {
    func CurrentMonthToLocal() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        let dt = dateFormatter.string(from: date)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let result = dateFormatter.date(from: dt)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "MMM-yyyy"
        
        return dateFormatter.string(from: result!)
    }
    
    func CurrentToLocal() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        let dt = dateFormatter.string(from: date)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let result = dateFormatter.date(from: dt)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        return dateFormatter.string(from: result!)
    }
    
    func CurrentNextToLocal() -> String {
        let date = Date().addingTimeInterval(432000)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        let dt = dateFormatter.string(from: date)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let result = dateFormatter.date(from: dt)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        return dateFormatter.string(from: result!)
    }
    
    
    func UTCToLocal() -> String {
        let dateFormatter = DateFormatter()
        //        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'00:00:00"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        let dt = dateFormatter.date(from: self)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return dateFormatter.string(from: dt!)
    }
    
    func UTCToLocalDay() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'00:00:00"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        let dt = dateFormatter.date(from: self)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "EEE dd-MM-yyyy"
        
        return dateFormatter.string(from: dt!)
    }
    
    func CurrentToLocalMonth() -> String {
        let date = Date().addingTimeInterval(432000)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        let dt = dateFormatter.string(from: date)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let result = dateFormatter.date(from: dt)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "dd-MMM-yyyy"
        
        return dateFormatter.string(from: result!)
    }
    
    
}


extension NSAttributedString {
    
    func sizeWithMyFont(font:UIFont, size:CGSize) -> CGSize{
        let textRext = (self as NSAttributedString).boundingRect(with: CGSize(width: size.width, height: size.height),
                                                                 options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                                                 context: nil)
        return CGSize.init(width: CGFloat(ceilf(Float(textRext.width))), height: CGFloat(ceilf(Float(textRext.height))))
    }
}

extension AppDelegate {
    static var shared:AppDelegate {
        
        return UIApplication.shared.delegate as! AppDelegate
        
    }
}

public extension UserDefaults {
    
}

extension UIViewController {
    
    func presentAlertWithTitle(title: String, message : String, okAction: @escaping () -> Void)  {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) {
            (action: UIAlertAction) in
            okAction()
        }
        alertController.addAction(OKAction)
        let alertWindow = UIApplication.shared.keyWindow?.rootViewController
        alertWindow?.present(alertController, animated: true, completion: nil)
    }
    
    func showAlertActionView(title: String, message: String, controller: UIViewController, okAction: OKActionCompletionBlock? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { _ in
            okAction?()
        }))
        controller.present(alert, animated: true, completion: nil)
    }
}
