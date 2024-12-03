//
//  RegisterRouter.swift
//  DePelis
//
//  Created by Mario Vargas on 12/11/24.
//

import Foundation
import UIKit

protocol ProtocolRegisterRouter {
    var view: (UIViewController & ProtocolRegisterView)? { get set }
    
    static func start() -> ProtocolRegisterRouter
    func presentSuccessAlert()
}

class RegisterRouter: ProtocolRegisterRouter {
    var view: (any UIViewController & ProtocolRegisterView)?
    
    static func start() -> any ProtocolRegisterRouter {
        
        let router = RegisterRouter()
        
        var view: ProtocolRegisterView = RegisterView()
        var presenter: ProtocolRegisterPresenter = RegisterPresenter()
        var interactor: ProtocolRegisterInteractor = RegisterInteractor()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.view = view as? (UIViewController & ProtocolRegisterView)
        
        return router
    }
    
    func presentSuccessAlert() {
        Loader.sharedInstance.hideIndicator()
        AlertHelpper.showAlert(parent: self.view!, title: Strings.RegisterScreen.congrats, message: Strings.RegisterScreen.successRegister,twoButtons: false, completionOk:  {
            self.view?.navigationController?.popViewController(animated: true)
        })
    }
    
    
}

