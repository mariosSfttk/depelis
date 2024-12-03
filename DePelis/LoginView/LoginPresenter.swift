//
//  LoginPresenter.swift
//  DePelis
//
//  Created by Mario Vargas on 12/11/24.
//

import Foundation


protocol ProtocolLoginPresenter {
    var view: ProtocolLoginView? { get set }
    var interactor: ProtocolLoginInteractor? { get set }
    var router: ProtocolLoginRouter? { get set }
    
    func presentRegisterView()
    func sendUserInfo(name: String, pass: String)
    func presentRedirectToInit()
    func presentErrorAlert(message: String)
    func presenterGetAuthenticationToken()
}

class LoginPresenter: ProtocolLoginPresenter {
    var view: (any ProtocolLoginView)?
    var interactor: (any ProtocolLoginInteractor)?
    var router: (any ProtocolLoginRouter)?
    private var userName: String?
    
    func presentRegisterView() {
        router?.loginRedirectToRegister()
    }
    
    func sendUserInfo(name: String, pass: String) {
        self.userName = name
        interactor?.invokeFakeLoginService(user: name, password: pass)
    }
    
    func presentRedirectToInit(){
        router?.redirectToInitView(userName: self.userName ?? "")
    }
    
    func presentErrorAlert(message: String){
        router?.presentErrorAut(message: message)
    }
    
    func presenterGetAuthenticationToken() {
        interactor?.interactorGetAuthenticationToken()
    }
    
}
