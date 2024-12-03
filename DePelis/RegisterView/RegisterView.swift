//
//  RegisterView.swift
//  DePelis
//
//  Created by Mario Vargas on 12/11/24.
//

import UIKit



protocol ProtocolRegisterView {
    var presenter: ProtocolRegisterPresenter? { get set}
}


class RegisterView: UIViewController, ProtocolRegisterView {
    var presenter: (any ProtocolRegisterPresenter)?
    
    var safeView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .colorNavigation
        return view
    }()
    
    lazy var btnBack: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didPressBack), for: .touchUpInside)
        btn.setImage(UIImage(systemName: Strings.Icons.backArrow)?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        return btn
    }()
    
    var lblTitleHeader: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = Strings.RegisterScreen.titleHeader
        lbl.textColor = .white
        return lbl
    }()
    
    var lblDescription: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = Strings.RegisterScreen.descriptionText
        lbl.numberOfLines = 0
        return lbl
    }()
    
    lazy var txtUserName: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.borderStyle = .roundedRect
        txt.font = UIFont.systemFont(ofSize: 18)
        txt.addTarget(self, action: #selector(updateTextField), for: .editingChanged)
        txt.backgroundColor = .colorTextBackground
        return txt
    }()
    
    var lblName: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = Strings.RegisterScreen.nameLabel
        return lbl
    }()
    
    lazy var txtPassword: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.borderStyle = .roundedRect
        txt.font = UIFont.systemFont(ofSize: 18)
        txt.addTarget(self, action: #selector(updateTextField), for: .editingChanged)
        txt.backgroundColor = .colorTextBackground
        return txt
    }()
    
    var lblPassword: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = Strings.RegisterScreen.passLabel
        lbl.textAlignment = .left
        return lbl
    }()
    
    lazy var btnSend: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didPressSend), for: .touchUpInside)
        btn.setTitle(Strings.RegisterScreen.sendBtn, for: .normal)
        btn.backgroundColor = .inactiveButton
        btn.layer.cornerRadius = 5
        btn.isEnabled = false
        return btn
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        addingSubViews()
        setupComponentsView()
        
        view.backgroundColor = .colorBackground
    }
    
    
    @objc func didPressBack() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func didPressSend() {
        Loader.sharedInstance.showIndicator(view: self)
        presenter?.receiveUserData(user: txtUserName.text!, password: txtPassword.text!)
    }
    
    @objc func updateTextField(_ textField: UITextField) {
        let isValid = txtPassword.text!.count > 0 && txtUserName.text!.count > 0
        btnSend.isEnabled = isValid
        btnSend.backgroundColor = isValid ? .activeButton : .inactiveButton
    }

}
