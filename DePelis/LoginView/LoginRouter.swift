//
//  LoginRouter.swift
//  DePelis
//
//  Created by Mario Vargas on 12/11/24.
//

import Foundation
import UIKit
import CoreData


protocol ProtocolLoginRouter {
    var view: (UIViewController & ProtocolLoginView)? { get set }
    static func start(managedObject: NSManagedObjectContext) -> ProtocolLoginRouter
    
    func loginRedirectToRegister()
    func presentErrorAut(message: String)
    func redirectToInitView(userName: String)
}

class LoginRouter: ProtocolLoginRouter {
    var view: (any UIViewController & ProtocolLoginView)?
    
    static func start(managedObject: NSManagedObjectContext) -> any ProtocolLoginRouter {
        let router = LoginRouter()
        
        var view: ProtocolLoginView = LoginView()
        var presenter: ProtocolLoginPresenter = LoginPresenter()
        var interactor: ProtocolLoginInteractor = LoginInteractor()
        
        view.presenter = presenter
        view.managedObject = managedObject
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.view = view as? (UIViewController & ProtocolLoginView)
        
        return router
    }
    
    func loginRedirectToRegister() {
        let registerRouter = RegisterRouter.start()
        self.view?.navigationController?.pushViewController(registerRouter.view!, animated: true)
    }
    
    func presentErrorAut(message: String) {
        AlertHelpper.showAlert(parent: self.view!, title: "Error", message: message, twoButtons: false, completionOk: {
            self.view?.navigationController?.popViewController(animated: true)
        })
    }
    
    func redirectToInitView(userName: String) {
        let tabView = TabBarController()
        tabView.managedObject = self.view?.managedObject
        self.view?.navigationController?.pushViewController(tabView, animated: true)
        
    }
}
