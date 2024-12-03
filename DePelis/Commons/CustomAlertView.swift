//
//  CustomAlertView.swift
//  DePelis
//
//  Created by Mario Vargas on 09/11/24.
//

import UIKit

class CustomAlertView: UIViewController {
    
    var completionCancel: (() -> Void)?
    var completionOk: (() -> Void)?
    var twoOptions: Bool = true
    
    var blurView: UIView = {
        let view = UIView()
        view.frame = UIScreen.main.bounds
        view.backgroundColor = .colorBackground
        view.alpha = 0.5
        return view
    }()
    
    var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .colorBackground
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.colorNavigation.cgColor
        return view
    }()
    
    var icon: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = UIImage(systemName: Strings.Icons.personIcon)
        imgView.tintColor = .blue
        return imgView
    }()
    
    var lblTile: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var lblMessage: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.textAlignment = .justified
        return lbl
    }()
    
    var shadowView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .colorNavigation
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return view
    }()
    
    lazy var btnCancel: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(Strings.CustomAlert.cancel, for: .normal)
        btn.backgroundColor = .colorPrimaryButton
        btn.addTarget(self, action: #selector(didPressCancel), for: .touchUpInside)
        btn.layer.cornerRadius = 8
        return btn
    }()
    
    lazy var btnOk: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(Strings.CustomAlert.accept, for: .normal)
        btn.backgroundColor = .colorSecondaryButton
        btn.addTarget(self, action: #selector(didPressOk), for: .touchUpInside)
        btn.layer.cornerRadius = 8
        
        return btn
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func addingSubViews(){
        view.addSubview(blurView)
        view.addSubview(containerView)
        containerView.addSubview(icon)
        containerView.addSubview(lblTile)
        containerView.addSubview(lblMessage)
        containerView.addSubview(shadowView)
        shadowView.addSubview(btnOk)
        if twoOptions{shadowView.addSubview(btnCancel)}
    }
    
    func setupComponentsView(){
        setContainerConstraints()
        setIconConstraints()
        setLblTitleConstraints()
        setLblMessageConstraints()
        setShadowConstraints()
        setBtnOkConstarints()
        if twoOptions{setBtnCancelConstraints()}
    }
    
    
    
    convenience init(alertTitle: String? = Strings.CustomAlert.titleAlert, alertMessage: String? = Strings.CustomAlert.messageAlert, twoButtons: Bool = true, completionOk: (() -> Void)? = nil,  completionCancel: (() -> Void)? = nil ) {
        
        self.init()
        
        
        self.twoOptions = twoButtons
        self.completionOk = completionOk
        self.completionCancel = completionCancel
        self.lblTile.text = alertTitle
        self.lblMessage.text = alertMessage
        
        self.addingSubViews()
        self.setupComponentsView()
    }
    
    @objc
    func didPressCancel() {
        completionCancel!()
    }
    
    @objc
    func didPressOk() {
        completionOk!()
    }
    
    
    func setContainerConstraints() {
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: blurView.leadingAnchor, constant: 20),
            containerView.centerXAnchor.constraint(equalTo: blurView.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: blurView.centerYAnchor),
        ])
    }
    
    func setIconConstraints() {
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            icon.heightAnchor.constraint(equalToConstant: 40),
            icon.widthAnchor.constraint(equalToConstant: 40),
            icon.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
        ])
    }
    
    func setLblTitleConstraints() {
        NSLayoutConstraint.activate([
            lblTile.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 10),
            lblTile.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            lblTile.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
        ])
    }
    
    func setLblMessageConstraints() {
        NSLayoutConstraint.activate([
            lblMessage.topAnchor.constraint(equalTo: lblTile.bottomAnchor, constant: 10),
            lblMessage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            lblMessage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
        ])
    }
    
    func setShadowConstraints() {
        NSLayoutConstraint.activate([
            shadowView.topAnchor.constraint(equalTo: lblMessage.bottomAnchor, constant: 10),
            shadowView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            shadowView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            shadowView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
        ])
    }
    
    func setBtnOkConstarints() {
        NSLayoutConstraint.activate([
            btnOk.topAnchor.constraint(equalTo: shadowView.topAnchor, constant: 12),
            btnOk.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor, constant: 8),
            shadowView.bottomAnchor.constraint(equalTo: btnOk.bottomAnchor, constant: 12),
        ])
        if !twoOptions { btnOk.centerXAnchor.constraint(equalTo: shadowView.centerXAnchor).isActive = true }
    }
    
    func setBtnCancelConstraints() {
        NSLayoutConstraint.activate([
            btnCancel.topAnchor.constraint(equalTo: shadowView.topAnchor, constant: 12),
            btnCancel.leadingAnchor.constraint(equalTo: btnOk.trailingAnchor, constant: 4),
            shadowView.trailingAnchor.constraint(equalTo: btnCancel.trailingAnchor, constant: 8),
            btnCancel.widthAnchor.constraint(equalTo: btnOk.widthAnchor),
        ])
    }
     
    
    
}
