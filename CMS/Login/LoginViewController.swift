//
//  LoginViewController.swift
//  CMS
//
//  Created by Jaspreet Singh on 1/16/19.
//  Copyright © 2019 Jaspreet Singh. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    var  presenter: ViewToPresenterProtocol?
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passowrdTextField: UITextField!
    @IBOutlet weak var emailStackView: UIStackView!
    @IBOutlet weak var passwordStackView: UIStackView!
    @IBOutlet weak var remembermeButtonOutlet: UIButton!
    @IBOutlet weak var loginButtonOutlet: UIButton!
    @IBOutlet weak var emailLabelOutline: UILabel!
    @IBOutlet weak var passwordLabelOutline: UILabel!
    
    var rememberTick = false
    
    var postDict = [String: Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        emailTextField.delegate = self
        passowrdTextField.delegate = self
        
        if UserDefaults.standard.value(forKey: "RememberMe") != nil {
            if let remeberMe = UserDefaults.standard.value(forKey: "RememberMe") as? Bool {
                rememberTick = remeberMe
                if rememberTick == true {
                    remembermeButtonOutlet.setImage(#imageLiteral(resourceName: "tick_icon"), for: .normal)
                    emailTextField.text = UserDefaults.standard.value(forKey: "Email") as? String
                    passowrdTextField.text = UserDefaults.standard.value(forKey: "Password") as? String
                }
            }
        }
    }
    
    
    func setup() {
        emailLabelOutline.layer.borderWidth = 1
        emailLabelOutline.layer.borderColor = UIColor.lightGray.cgColor
        passwordLabelOutline.layer.borderWidth = 1
        passwordLabelOutline.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- ButtonAction
    @IBAction func remembermeButtonAction(_ sender: Any) {
        
        if  remembermeButtonOutlet.image(for: .normal) == #imageLiteral(resourceName: "untick_icon") {
            remembermeButtonOutlet.setImage(#imageLiteral(resourceName: "tick_icon"), for: .normal)
            rememberTick = true
            
        } else {
            rememberTick = false
            remembermeButtonOutlet.setImage(#imageLiteral(resourceName: "untick_icon"), for: .normal)
            UserDefaults.standard.setValue(nil, forKey: "Email")
            UserDefaults.standard.setValue(nil, forKey: "Password")
            UserDefaults.standard.setValue(nil, forKey: "RememberMe")
        }
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        if validateInformation() {
            loginActionApi()
        } else {
            ShowAlert.shared.showAlertView(title: Constant.TitleApp, message: "Service error", controller: self)
        }
    }
    
    @IBAction func forgotpassButtonAction(_ sender: Any) {
    }
    
    //MARK:- function
    func loginActionApi() {
        
        if isInternetActive == true {
            LoaderView.shared.showOnView()
            postDict["username"] = emailTextField.text
            postDict["password"] = passowrdTextField.text
            postDict["grant_type"] = "password"
            if rememberTick == true {
                UserDefaults.standard.setValue(emailTextField.text, forKey: "Email")
                UserDefaults.standard.setValue(passowrdTextField.text, forKey: "Password")
                UserDefaults.standard.setValue(rememberTick, forKey: "RememberMe")
            }
            presenter?.updateView(UserDict: postDict)
        } else {
            ShowAlert.shared.showAlertView(title: Constant.TitleApp, message: "Please check your Internet connection.", controller: self)
        }
    }
    
    //MARK:- ValidateFunction
    func validateInformation()->Bool    {
        let objValidate   = Validate()
        var (status,message) = objValidate.validateEmailField(emailTextField as! ExtendedTextField)
        if !status{
            switch message {
            case "Empty field":
                ShowAlert.shared.showAlertView(title: Constant.TitleApp, message: "Please enter email", controller: self)
                break
            case "Invalid Email format":
                ShowAlert.shared.showAlertView(title: Constant.TitleApp, message: "Please enter valid email", controller: self)
                break
            default:
                break
            }
            return false
        }
        (status,message) = objValidate.validateField(passowrdTextField as! ExtendedTextField)
        if !status{
            switch message {
            case "Empty field":
                ShowAlert.shared.showAlertView(title: Constant.TitleApp, message: "Please enter password", controller: self)
                break
            case "Short length text":
                ShowAlert.shared.showAlertView(title: Constant.TitleApp, message: "Password must be atleast 6 characters", controller: self)
                break
            case "Long length text":
                ShowAlert.shared.showAlertView(title: Constant.TitleApp, message: "Password is too long", controller: self)
                break
            default:
                break
            }
            return false
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentCharacterCount = textField.text?.count ?? 0
        if range.length + range.location > currentCharacterCount {
            return false
        }
        let newLength = currentCharacterCount + string.count - range.length
        return newLength <= 20
    }

}

extension LoginViewController: PresenterToViewProtocol {
    
    func showUserDetail(Userdetail: LoginModel) {
        
          presenter?.presentDashboard()
    }
    
    func showError() {
        ShowAlert.shared.showAlertView(title: Constant.TitleApp, message: "User not exist", controller: self)
    }
}
