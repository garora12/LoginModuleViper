//
//  ExtendedTextField.swift
//  E-Ticketing
//
//  Created by Beant Singh on 2/10/16.
//  Copyright © 2016 Navroz Singh. All rights reserved.
//

//import Foundation
import UIKit

@objc protocol TextFieldCustomDelegate {
    @objc optional func didBegin(_ currentTextfield: UITextField)
    @objc optional func shouldBegin(_ currentTextfield: UITextField)-> Bool
    
    @objc optional func didEnd(_ currentTextfield: UITextField)
    @objc optional func returnKey(_ currentTextfield: UITextField)
    @objc optional func customtextField(_ currentTextfield: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String, classObject:ExtendedTextField) -> Bool
}

class ExtendedTextField: UITextField ,UITextFieldDelegate {
    
    @IBInspectable internal var maxLength: Int = 0
    @IBInspectable internal var minLength: Int  = 0
    @IBInspectable internal var sizeLimit: Bool = false
    @IBInspectable internal var email: Bool = false
    @IBInspectable internal var allowedCharacters: String = ""
    @IBInspectable internal var allowAllCharacters: Bool = false
    @IBInspectable internal var phone: Bool = false
    
    var extendedTextFieldDelegate: ExtendedTextField?
    var customDelegate:TextFieldCustomDelegate?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.delegate = self
    }
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool{
        
        if(customDelegate?.shouldBegin?(textField) == false) {
            return false
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) ->
        
        Bool {
            
            if(customDelegate?.customtextField?(textField, shouldChangeCharactersInRange: range, replacementString: string,classObject:self) == false) {
                return false
            }
            if string.isEmpty{
                
                return true
                
            }
            else if self.phone{
                
                if self.sizeLimit{
                    if self.maxLength < (self.text?.characters.count)! + 1{
                        return false
                    }
                }
                
                let charSet         =   CharacterSet(charactersIn: self.allowedCharacters)
                let rangeOfChar     =   string.rangeOfCharacter(from: charSet)
                
                // range will be nil if no letters is found
                if (rangeOfChar != nil) {
                    let newString = (textField.text! as NSString).replacingCharacters(in: range, with: string)
                    let components = newString.components(separatedBy: CharacterSet.decimalDigits.inverted)
                    
                    let decimalString = components.joined(separator: "") as NSString
                    let length = decimalString.length
                    let hasLeadingOne = length > 0 && decimalString.character(at: 0) == (1 as unichar)
                    
                    if length == 0 || (length > 10 && !hasLeadingOne) || length > 11{
                        
                        let newLength = (textField.text! as NSString).length + (string as NSString).length - range.length as Int
                        
                        return (newLength > 10) ? false : true
                    }
                    var index = 0 as Int
                    let formattedString = NSMutableString()
                    
                    if hasLeadingOne{
                        
                        formattedString.append("1 ")
                        index += 1
                    }
                    if (length - index) > 3{
                        
                        let areaCode = decimalString.substring(with: NSMakeRange(index, 3))
                        formattedString.appendFormat("%@-", areaCode)
                        index += 3
                    }
                    if length - index > 3
                    {
                        let prefix = decimalString.substring(with: NSMakeRange(index, 3))
                        formattedString.appendFormat("%@-", prefix)
                        index += 3
                    }
                    
                    let remainder = decimalString.substring(from: index)
                    formattedString.append(remainder)
                    textField.text = formattedString as String
                    return false
                }
                else {
                    return false
                }
                //return true
            }
            else if self.allowAllCharacters {
                
                
                if self.sizeLimit{
                    
                    if self.maxLength < (self.text?.characters.count)! + 1{
                        return false
                    }
                }
                return true
                
                
            }
            else{
                
                let charSet =   CharacterSet(charactersIn: self.allowedCharacters)
                let range   =   string.rangeOfCharacter(from: charSet)
                
                // range will be nil if no letters is found
                if (range != nil) {
                    
                    if self.sizeLimit{
                        
                        if self.maxLength < (self.text?.characters.count)! + 1{
                            return false
                        }
                    }
                    return true
                    
                }
                else {
                    return false
                }
            }
    }
    
    // MARK: - For padding
    let  padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return self.newBounds(bounds)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return self.newBounds(bounds)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return self.newBounds(bounds)
    }
    
    fileprivate func newBounds(_ bounds: CGRect) -> CGRect {
        
        var newBounds = bounds
        newBounds.origin.x += padding.left
        newBounds.origin.y += padding.top
        newBounds.size.height -= padding.top + padding.bottom
        newBounds.size.width -= padding.left + padding.right
        return newBounds
    }
    
    // MARK: - Text filed custom delegate
    func textFieldDidBeginEditing(_ textField: UITextField){
        customDelegate?.didBegin!(textField)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        customDelegate?.didEnd!(textField)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        customDelegate?.returnKey!(textField)
        return true
    }
    
}
