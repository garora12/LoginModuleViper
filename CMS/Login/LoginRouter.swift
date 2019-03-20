//
//  LoginRouter.swift
//  CMS
//
//  Created by Jaspreet Singh on 1/16/19.
//  Copyright © 2019 Jaspreet Singh. All rights reserved.
//

import UIKit
import Foundation

class LoginRouter: PresenterToRouterProtocol {
    
    static func createModule() -> UIViewController {
        
        let view = mainstoryboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        var presenter: ViewToPresenterProtocol & InterectorToPresenterProtocol = LoginPresenter()
        var interector: PresentorToInterectorProtocol = LoginInteractor()
        let router: PresenterToRouterProtocol = LoginRouter()
        
        view?.presenter = presenter
        presenter.view = view
        presenter.interector = interector
        presenter.router = router
        interector.presenter = presenter
        
        return view!
    }
    
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func goTodashboard(view: PresenterToViewProtocol, user: LoginModel) {
        let DashboardVC = LoginRouter.mainstoryboard.instantiateViewController(withIdentifier: Constant.StoryBoardIDs.HomeVC.rawValue) as? DashboardVC
        if let loginView = view as? UIViewController {
            loginView.navigationController?.pushViewController(DashboardVC!, animated: true)
        }
    }
}
