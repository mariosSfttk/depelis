//
//  RegisterViewFacade.swift
//  DePelis
//
//  Created by Mario Vargas on 12/11/24.
//

import Foundation
import UIKit



extension RegisterView {
    
    func addingSubViews(){
        view.addSubview(safeView)
        safeView.addSubview(btnBack)
        safeView.addSubview(lblTitleHeader)
        
        view.addSubview(lblDescription)
        view.addSubview(lblName)
        view.addSubview(txtUserName)
        view.addSubview(lblPassword)
        view.addSubview(txtPassword)
        view.addSubview(btnSend)
        
    }
    
    func setupComponentsView(){
        setSafeViewConstraints()
        setBtnBackConstraints()
        setLblTitleHeaderConstraints()
        
        setLblDescriptionConstraints()
        setLblNameConstraints()
        setTxtUserNameConstraint()
        setLblPasswordConstraints()
        setTxtPasswordConstraints()
        setBtnSendConstraints()
    }
    
    
    
    func setSafeViewConstraints(){
        NSLayoutConstraint.activate([
            safeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            safeView.topAnchor.constraint(equalTo: view.topAnchor),
            safeView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            safeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 41),
        ])
    }
    
    func setBtnBackConstraints(){
        NSLayoutConstraint.activate([
            btnBack.leadingAnchor.constraint(equalTo: safeView.leadingAnchor, constant: 12),
            btnBack.topAnchor.constraint(equalTo: safeView.safeAreaLayoutGuide.topAnchor, constant: 0),
            btnBack.heightAnchor.constraint(equalToConstant: 41),
        ])
    }
    func setLblTitleHeaderConstraints() {
        NSLayoutConstraint.activate([
            lblTitleHeader.leadingAnchor.constraint(equalTo: btnBack.trailingAnchor, constant: 8),
            lblTitleHeader.centerYAnchor.constraint(equalTo: btnBack.centerYAnchor),
        ])
    }
    
    func setLblDescriptionConstraints() {
        NSLayoutConstraint.activate([
            lblDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lblDescription.topAnchor.constraint(equalTo: safeView.bottomAnchor, constant: 20),
            lblDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func setLblNameConstraints() {
        NSLayoutConstraint.activate([
            lblName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lblName.topAnchor.constraint(equalTo: lblDescription.bottomAnchor, constant: 40),
            lblName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func setTxtUserNameConstraint() {
        NSLayoutConstraint.activate([
            txtUserName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            txtUserName.topAnchor.constraint(equalTo: lblName.bottomAnchor, constant: 6),
            txtUserName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            txtUserName.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    func setLblPasswordConstraints() {
        NSLayoutConstraint.activate([
            lblPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lblPassword.topAnchor.constraint(equalTo: txtUserName.bottomAnchor, constant: 16),
            lblPassword.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func setTxtPasswordConstraints() {
        NSLayoutConstraint.activate([
            txtPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            txtPassword.topAnchor.constraint(equalTo: lblPassword.bottomAnchor, constant: 6),
            txtPassword.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            txtPassword.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    func setBtnSendConstraints() {
        NSLayoutConstraint.activate([
            btnSend.leadingAnchor.constraint(equalTo: txtPassword.leadingAnchor),
            btnSend.widthAnchor.constraint(equalTo: txtPassword.widthAnchor),
            btnSend.topAnchor.constraint(equalTo: txtPassword.bottomAnchor, constant: 40),
            btnSend.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
}
