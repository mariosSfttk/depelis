//
//  LoginView.swift
//  DePelis
//
//  Created by Mario Vargas on 12/11/24.
//

import UIKit
import CoreData

protocol ProtocolLoginView {
    var presenter: ProtocolLoginPresenter? { get set}
    var managedObject: NSManagedObjectContext! { get set }
}

class LoginView: UIViewController, ProtocolLoginView {
    var managedObject: NSManagedObjectContext!
    var presenter: (any ProtocolLoginPresenter)?
    
    
    lazy var imgAPI: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: Strings.Icons.loginLogo)
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    lazy var txtUserName: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.borderStyle = .roundedRect
        txt.font = UIFont.systemFont(ofSize: 18)
        txt.placeholder = Strings.LoginScreen.userPlaceHolder
        txt.addTarget(self, action: #selector(updateTextField), for: .editingChanged)
        txt.backgroundColor = .colorTextBackground
        return txt
    }()
    
    lazy var txtPassword: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.borderStyle = .roundedRect
        txt.isSecureTextEntry = true
        txt.font = UIFont.systemFont(ofSize: 18)
        txt.placeholder = Strings.LoginScreen.passwordPlaceHolder
        txt.addTarget(self, action: #selector(updateTextField), for: .editingChanged)
        txt.backgroundColor = .colorTextBackground
        return txt
    }()
    
    lazy var btnLogin: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didPressLogin), for: .touchUpInside)
        btn.setTitle(Strings.LoginScreen.btnLogin, for: .normal)
        btn.backgroundColor = .inactiveButton
        btn.layer.cornerRadius = 5
        return btn
    }()
    
    var lblNotUser: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = Strings.LoginScreen.notRegistered
        lbl.textAlignment = .center
        return lbl
    }()
    
    lazy var btnCreateAccount: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didPressCreateAccount), for: .touchUpInside)
        btn.setTitle(Strings.LoginScreen.createAccount, for: .normal)
        btn.setTitleColor(.blue, for: .normal)
        return btn
    }()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addingSubViews()
        setupComponentsView()
        
        
        view.backgroundColor = .colorBackground
    }
    
    @objc
    func didPressLogin() {
        Loader.sharedInstance.showIndicator(view: self)
        if let user = txtUserName.text, let pass = txtPassword.text {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.txtUserName.text = ""
                self.txtPassword.text = ""
                self.btnLogin.isEnabled = false
                self.btnLogin.backgroundColor = .inactiveButton
                self.presenter?.sendUserInfo(name: user, pass: pass)
            }
        }
    }
    
    @objc
    func didPressCreateAccount() {
        presenter?.presentRegisterView()
    }
    
    @objc func updateTextField(_ textField: UITextField) {
        let isValid = txtPassword.text!.count > 0 && txtUserName.text!.count > 0
        btnLogin.isEnabled = isValid
        btnLogin.backgroundColor = isValid ? .activeButton : .inactiveButton
    }

}
