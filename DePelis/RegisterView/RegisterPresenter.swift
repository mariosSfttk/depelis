//
//  RegisterPresenter.swift
//  DePelis
//
//  Created by Mario Vargas on 12/11/24.
//

import Foundation


protocol ProtocolRegisterPresenter {
    var view: ProtocolRegisterView? { get set }
    var interactor: ProtocolRegisterInteractor? { get set }
    var router: ProtocolRegisterRouter? { get set }
    
    func receiveUserData(user: String, password: String)
    func redirectToAlert()
}


class RegisterPresenter: ProtocolRegisterPresenter {
    
    var view: (any ProtocolRegisterView)?
    var interactor: (any ProtocolRegisterInteractor)?
    var router: (any ProtocolRegisterRouter)?
    
    func receiveUserData(user: String, password: String) {
        interactor?.receiveUserInfo(user: user, pass: password)
    }
    
    func redirectToAlert() {
        router?.presentSuccessAlert()
    }
    
}
