//
//  Validate.swift
//  CMS
//
//  Created by Jaspreet Singh on 2/15/19.
//  Copyright © 2019 Jaspreet Singh. All rights reserved.
//

import UIKit
import Foundation

fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l < r
    case (nil, _?):
        return true
    default:
        return false
    }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l > r
    default:
        return rhs < lhs
    }
}


class Validate: NSObject {
    
    func validateField(_ txtField: ExtendedTextField)-> (Bool, NSString)
    {
        if txtField.text!.isEmpty{
            return (false,"Empty field")
        }
        if (txtField.text!.trimmingCharacters(in: CharacterSet.whitespaces)).count == 0 {
            txtField.text = ""
            return (false,"Empty field")
        }
        if txtField.sizeLimit{
            if txtField.minLength > txtField.text?.count{
                return (false,"Short length text")
            }
            if txtField.maxLength < txtField.text?.count{
                return (false,"Long length text")
            }
        }
        
        return (true,"")
    }
    
    func validateEmailField(_ txtField: ExtendedTextField)-> (Bool, NSString)
    {
        if txtField.text!.isEmpty{
            return (false,"Empty field")
        }
        if (txtField.text!.trimmingCharacters(in: CharacterSet.whitespaces)).count == 0 {
            txtField.text = ""
            return (false,"Empty field")
        }
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        let result = emailTest.evaluate(with: txtField.text)
        
        if result{
            return(true,"")
        }
        else{
            return(false, "Invalid Email format")
        }
    }
}
