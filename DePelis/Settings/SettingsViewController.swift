//
//  SettingsViewController.swift
//  DePelis
//
//  Created by Mario Vargas on 13/11/24.
//

import UIKit

class SettingsViewController: UIViewController {
    let lateralView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.maskedCorners = [.layerMinXMinYCorner]
        view.backgroundColor = .colorNavigation
        return view
    }()
    
    lazy var userImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: Strings.Icons.personIcon)
        return image
    }()
    
    lazy var lblUserName: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = Strings.SettingsScreen.welcome
        lbl.textAlignment = .center
        return lbl
    }()
    
    var lblAbout: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = Strings.SettingsScreen.about
        lbl.textAlignment = .left
        return lbl
    }()
    
    var lblTyC: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = Strings.SettingsScreen.tyc
        lbl.textAlignment = .left
        return lbl
    }()
    
    var lblQuestions: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = Strings.SettingsScreen.questions
        lbl.textAlignment = .left
        return lbl
    }()
    
    
    lazy var btnExit: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didPressLogout), for: .touchUpInside)
        btn.setImage(UIImage(systemName: Strings.Icons.exitIcon )?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        btn.setTitle(Strings.SettingsScreen.btnExit, for: .normal)
        btn.layer.cornerRadius = 5
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .colorBackground
        addingSubViews()
        setupComponentsView()
    }
    
    func addingSubViews() {
        view.addSubview(lateralView)
        lateralView.addSubview(userImage)
        lateralView.addSubview(lblUserName)
        lateralView.addSubview(lblAbout)
        lateralView.addSubview(lblTyC)
        lateralView.addSubview(lblQuestions)
        lateralView.addSubview(btnExit)
    }
    
    func setupComponentsView() {
        setLateralViewConstraints()
        setUserImageConstraints()
        setLblUserNameConstraints()
        setLblAboutConstraints()
        setLblTyCConstraints()
        setLblQuestionsConstraints()
        setBtnExitConstraints()
    }
    
    func setLateralViewConstraints() {
        NSLayoutConstraint.activate([
            lateralView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            view.trailingAnchor.constraint(equalTo: lateralView.trailingAnchor),
            lateralView.topAnchor.constraint(equalTo: view.topAnchor),
            lateralView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setUserImageConstraints() {
        NSLayoutConstraint.activate([
            userImage.leadingAnchor.constraint(greaterThanOrEqualTo: lateralView.leadingAnchor, constant: 10),
            userImage.centerXAnchor.constraint(equalTo: lateralView.centerXAnchor),
            userImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            userImage.widthAnchor.constraint(equalToConstant: 80),
            userImage.heightAnchor.constraint(equalToConstant: 80),
        ])
    }
    
    func setLblUserNameConstraints() {
        NSLayoutConstraint.activate([
            lblUserName.leadingAnchor.constraint(equalTo: lateralView.leadingAnchor, constant: 10),
            lblUserName.centerXAnchor.constraint(equalTo: lateralView.centerXAnchor),
            lblUserName.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 20),
        ])
    }
    
    func setLblAboutConstraints(){
        NSLayoutConstraint.activate([
            lblAbout.leadingAnchor.constraint(equalTo: lateralView.leadingAnchor, constant: 10),
            lblAbout.centerXAnchor.constraint(equalTo: lateralView.centerXAnchor),
            lblAbout.topAnchor.constraint(equalTo: lblUserName.bottomAnchor, constant: 60),
        ])
    }
    
    func setLblTyCConstraints(){
        NSLayoutConstraint.activate([
            lblTyC.leadingAnchor.constraint(equalTo: lateralView.leadingAnchor, constant: 10),
            lblTyC.centerXAnchor.constraint(equalTo: lateralView.centerXAnchor),
            lblTyC.topAnchor.constraint(equalTo: lblAbout.bottomAnchor, constant: 20),
        ])
    }
    
    func setLblQuestionsConstraints(){
        NSLayoutConstraint.activate([
            lblQuestions.leadingAnchor.constraint(equalTo: lateralView.leadingAnchor, constant: 10),
            lblQuestions.centerXAnchor.constraint(equalTo: lateralView.centerXAnchor),
            lblQuestions.topAnchor.constraint(equalTo: lblTyC.bottomAnchor, constant: 20),
        ])
    }
    
    func setBtnExitConstraints() {
        NSLayoutConstraint.activate([
            btnExit.leadingAnchor.constraint(equalTo: lateralView.leadingAnchor, constant: 10),
            btnExit.centerXAnchor.constraint(equalTo: lateralView.centerXAnchor),
            btnExit.topAnchor.constraint(equalTo: lblQuestions.bottomAnchor, constant: 50),
        ])
    }
    
    
    @objc
    func didPressLogout() {
        navigationController?.popViewController(animated: true)
    }
    
}
