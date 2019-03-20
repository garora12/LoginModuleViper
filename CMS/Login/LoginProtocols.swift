//
//  LoginProtocols.swift
//  CMS
//
//  Created by Jaspreet Singh on 1/16/19.
//  Copyright © 2019 Jaspreet Singh. All rights reserved.
//

import UIKit
import Foundation

protocol PresenterToViewProtocol {
    func showUserDetail(Userdetail: LoginModel)
    func showError()
}

protocol InterectorToPresenterProtocol {
    func fetchUser(Userdetail: LoginModel)
    func fetchUserFailed()
}

protocol PresentorToInterectorProtocol {
   var presenter: InterectorToPresenterProtocol? {get set} ;
    func fetchUser(UserDict: [String: Any])
}

protocol ViewToPresenterProtocol {
    var view: PresenterToViewProtocol? {get set}
    var interector: PresentorToInterectorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func presentDashboard()
    func updateView(UserDict: [String: Any]);
}

protocol PresenterToRouterProtocol: class {
    static func createModule() -> UIViewController;
    func goTodashboard(view: PresenterToViewProtocol, user: LoginModel)
}


