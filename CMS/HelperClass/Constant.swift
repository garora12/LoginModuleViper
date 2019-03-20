 
 //
 //  BikeDataMapper.swift
 //  BiFoot
 //
 //  Created by Damandeep Kaur on 9/25/17.
 //  Copyright © 2017 Singh Arshdeep. All rights reserved.
 //

  import Foundation
  import UIKit
  import AVFoundation
  import NVActivityIndicatorView
  
 public struct Constant {
    
    static let TitleApp = "CMS"
    
    //------------local Url--------------------//
    //    webservices
    static let baseURL = "your base url here"
    
    static let loginUrl = "/login"
    
    
    struct ScreenSize
    {
        static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
        static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
        static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
        static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    }
    
    enum Segue_Identifiers :String {
        case Tabbar_segue               =   "Tabbar"
        case LaunchScreenToSignUp       =   "signUpScreen"
    }
    
    enum StoryBoardIDs :String {
        
        case LoginViewController            =   "LoginViewController"
        case LandingVC                      =   "LandingViewControllerID"
        case HomeVC                         =   "HomeStory"
        case DashboardContainerVC           =   "d"
        case DashboardDetailVC              =   "DashboardVCStoryboardID"
        case DashboardInfoVC                =   "s"
    }
    
    enum NavigationIDs :String {
        
        case HomeVC     = "HomeNavigation"
        case LoginVC    = "LoginNavigation"
    }
    
    //MARK: - Storyboard Names
    enum StoryboardNames:String {
        case Main       = "Main"
    }
    
    static func viewControllerWithId(_ name:StoryBoardIDs, storyboardName:StoryboardNames? = Constant.StoryboardNames.Main) -> UIViewController{
        return UIStoryboard.init(name: storyboardName!.rawValue , bundle: nil).instantiateViewController(withIdentifier: name.rawValue)
    }
    
    static func validateEmail(_ candidate: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: candidate)
    }
 }
 
 //MARK: - LoaderView class
 class LoaderView: UIViewController, NVActivityIndicatorViewable {
    
    static let shared = LoaderView()
    let appRedColour = UIColor(red:201.0/255.0, green:32.0/255.0, blue:39.0/255.0, alpha:1.0)
    func showOnView() {
        let size = CGSize(width: 60.0, height: 60.0)
        startAnimating(size, type: .circleStrokeSpin , color: appRedColour)
    }
    
    func hideFromView() {
        stopAnimating()
    }
 }
 
 typealias OKActionCompletionBlock = ()-> Void
 class ShowAlert: UIViewController {
    
    static let shared = ShowAlert()
    func showAlertView(title: String, message: String, controller: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { _ in
           
        }))
        controller.present(alert, animated: true, completion: nil)
    }
 }
 

 
  //MARK: - User Defaults
  struct Defaults {
    
    static let loggedInUserKey = "loggedInUser"
    
    static func save(value: Any? = nil, values:[String:Any?]? = [:], key: String? = "") {
      if let value = value, let key = key{
        
        let data = NSKeyedArchiver.archivedData(withRootObject: value)
        
        UserDefaults.standard.setValue(data, forKey: key)
      }
      for obj in (values ?? [:]){
        if let value = obj.value{
          UserDefaults.standard.setValue(value, forKey: obj.key)
        }
      }
      UserDefaults.standard.synchronize()
    }
    
    static func remove(key: String? = nil, keys:[String]? = nil) {
      if let key = key{
        UserDefaults.standard.removeObject(forKey: key)
      }
      for key in (keys ?? []){
        UserDefaults.standard.removeObject(forKey: key)
      }
      UserDefaults.standard.synchronize()
    }
    
    static func valueFor(key: String) -> Any? {
      
      if let data = UserDefaults.standard.value(forKey: key) {
        let dataValue = NSKeyedUnarchiver.unarchiveObject(with:data as! Data)
        return dataValue
      }
      ///  UserDefaults.standard.setValue(data, forKey: key)
      
      return nil
    }
  }
  
  //MARK: - Font Constants
  struct FontConstants {
    static func FontRegular(_ size:CGFloat) -> UIFont{ return UIFont.init(name: "Roboto-Regular", size: size)!}
    static func FontMedium(_ size:CGFloat) -> UIFont{ return UIFont.init(name: "Roboto-Medium", size: size)!}
  }


