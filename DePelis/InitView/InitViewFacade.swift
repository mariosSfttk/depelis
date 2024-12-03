//
//  InitViewFacade.swift
//  DePelis
//
//  Created by Mario Vargas on 09/11/24.
//

import Foundation
import UIKit



extension InitViewController {
    
    func addingSubViews() {
        view.addSubview(headerView)
        view.addSubview(txtSearch)
        view.addSubview(iconSearch)
        
        view.addSubview(tblMovies)
    }
    
    func setupComponentsView() {
        setHeaderConstraints()
        setIconSearchConstraints()
        setTxtSearchConstraints()
        setTableConstraints()
    }
    
    func setHeaderConstraints() {
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 41),
        ])
    }
    
    func setIconSearchConstraints() {
        NSLayoutConstraint.activate([
            iconSearch.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 15),
            iconSearch.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            iconSearch.trailingAnchor.constraint(equalTo: txtSearch.leadingAnchor, constant: 3),
            iconSearch.heightAnchor.constraint(equalToConstant: 36),
            iconSearch.widthAnchor.constraint(equalToConstant: 37),
        ])
    }
    
    func setTxtSearchConstraints() {
        NSLayoutConstraint.activate([
            txtSearch.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 16),
            view.trailingAnchor.constraint(equalTo: txtSearch.trailingAnchor, constant: 16)
        ])
    }
    
    func setTableConstraints() {
        NSLayoutConstraint.activate([
            tblMovies.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            view.trailingAnchor.constraint(equalTo: tblMovies.trailingAnchor, constant: 12),
            tblMovies.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 12),
            tblMovies.topAnchor.constraint(equalTo: txtSearch.bottomAnchor, constant: 20)
        ])
    }
}
