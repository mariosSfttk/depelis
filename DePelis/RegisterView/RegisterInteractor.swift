//
//  RegisterInteractor.swift
//  DePelis
//
//  Created by Mario Vargas on 12/11/24.
//

import Foundation


protocol ProtocolRegisterInteractor {
    var presenter: ProtocolRegisterPresenter? { get set}
    
    func receiveUserInfo(user: String, pass: String)
}


class RegisterInteractor: ProtocolRegisterInteractor {
    var presenter: (any ProtocolRegisterPresenter)?
    
    func receiveUserInfo(user: String, pass: String) {
        let userObject = User(usename: user, password: pass)
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(userObject)
            UserDefaults.standard.setValue(data, forKey: Strings.General.userInfo)
        } catch {
            print(Strings.General.wrongMessage)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.presenter?.redirectToAlert()
        }
        
    }
}
