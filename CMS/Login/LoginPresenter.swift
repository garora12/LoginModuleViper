//
//  LoginPresenter.swift
//  CMS
//
//  Created by Jaspreet Singh on 1/16/19.
//  Copyright © 2019 Jaspreet Singh. All rights reserved.
//

import UIKit

class LoginPresenter: ViewToPresenterProtocol {
    
    var view: PresenterToViewProtocol?
    var interector: PresentorToInterectorProtocol?
    var router: PresenterToRouterProtocol?
    
    func updateView(UserDict: [String : Any]) {
        interector?.fetchUser(UserDict: UserDict)
    }
    
    func presentDashboard() {
        let loginModule = LoginModel()
        router?.goTodashboard(view: view!, user: loginModule)
    }
}

extension LoginPresenter: InterectorToPresenterProtocol {
    
    func fetchUser(Userdetail: LoginModel) {
     view?.showUserDetail(Userdetail: Userdetail)
    }
    
    func fetchUserFailed() {
        view?.showError()
    }
}
