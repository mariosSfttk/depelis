//
//  LoginInteractor.swift
//  DePelis
//
//  Created by Mario Vargas on 12/11/24.
//

import Foundation


protocol ProtocolLoginInteractor {
    var presenter: ProtocolLoginPresenter? { get set}
    
    func invokeFakeLoginService(user: String, password: String)
    func interactorGetAuthenticationToken()
}

class LoginInteractor: ProtocolLoginInteractor {
    var presenter: (any ProtocolLoginPresenter)?
    private var userName: String?
    private var password: String?
    
    func invokeFakeLoginService(user: String, password: String) {
        validateData(name: user, password: password)
    }
    
    func interactorGetAuthenticationToken() {
        let url = String(format: "%@authentication/token/new?api_key=%@", BASE_API_URL, API_KEY)
        
        invokeServerForOperation(operation: OPERATION_REQUEST_TOKEN, url: url)
    }
    
    
    func getPersistData() -> User? {
        if let data = UserDefaults.standard.data(forKey: Strings.General.userInfo) {
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(User.self, from: data)
                return user
            } catch {
                print(Strings.General.wrongMessage)
            }
        }
        return nil
    }
    
    func validateData(name: String, password: String) {
        if let user = getPersistData(), user.usename == name, user.password == password {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                Loader.sharedInstance.hideIndicator()
                self.presenter?.presentRedirectToInit()
            }
            
        } else {
            self.userName = name
            self.password = password
            interactorGetAuthenticationToken()
        }
    }
    
    func interactorValidateLogin(token: String) {
        let url = String(format: "%@%@%@", BASE_API_URL, AUTHENTICATION_LOGIN, API_KEY)
        let params = NSMutableDictionary()
        params.setValue(self.userName, forKey: Strings.General.usernameKey)
        params.setValue(self.password, forKey: Strings.General.passKey)
        params.setValue(token, forKey: Strings.Server.requestToken)
        
        invokeServerforPostOperation(url: url, operation: OPERATION_VALIDATE_LOGIN, params: params as! [String : Any])
    }
    
    func invokeServerForOperation(operation: Int, url: String) {
        Server.sharedInstance.simpleService(fromUrlString: url, operationCode: operation) { (operationCode, result) in
            switch operationCode {
            case OPERATION_REQUEST_TOKEN:
                switch result {
                case .failure(let error):
                    Loader.sharedInstance.hideIndicator()
                    print(error.localizedDescription)
                    self.presenter?.presentErrorAlert(message: error.localizedDescription)
                    break
                case .success(let data):
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        guard let response: NSDictionary = json as? NSDictionary else { return }
                        self.interactorValidateLogin(token: response.value(forKey: Strings.Server.requestToken) as! String)
                    } catch {
                        print(Strings.General.wrongMessage + error.localizedDescription)
                    }
                }
                break
            default:
                print(Strings.General.wrongMessage)
            }
            
        }
    }
    
    func invokeServerforPostOperation(url: String, operation: Int, params: [String: Any]) {
        Server.sharedInstance.simplePostUrl(fromURLString: url, parameters: params, operationCode: operation) { (opCode, result) in
            Loader.sharedInstance.hideIndicator()
            switch opCode {
            case OPERATION_VALIDATE_LOGIN:
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                    self.presenter?.presentErrorAlert(message: error.localizedDescription)
                    break
                case .success(let data):
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        guard let response: NSDictionary = json as? NSDictionary else { return }
                        if let status = response.value(forKey: "success"), status as! Bool == true {
                            DispatchQueue.main.async {
                                self.presenter?.presentRedirectToInit()
                            }
                        } else {
                            DispatchQueue.main.async {
                                self.presenter?.presentErrorAlert(message: response.value(forKey: "status_message") as! String)
                            }
                        }
                    } catch {
                        print(Strings.General.wrongMessage + error.localizedDescription)
                    }
                }
                break
            default:
                print(Strings.General.wrongMessage)
            }
        }
    }
}
