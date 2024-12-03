//
//  FavoritesViewFacade.swift
//  DePelis
//
//  Created by Mario Vargas on 13/11/24.
//

import Foundation
import UIKit



extension FavoritesView {
    func addingSubViews() {
        view.addSubview(safeView)
        view.addSubview(tblFavMovies)
        
    }
    
    func setupComponentsView() {
        setSafeViewConstraints()
        
        setFavMoviesConstraints()
    }
    
    func setSafeViewConstraints() {
        NSLayoutConstraint.activate([
            safeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            safeView.topAnchor.constraint(equalTo: view.topAnchor),
            safeView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            safeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 41),
        ])
    }
    
    func setFavMoviesConstraints() {
        NSLayoutConstraint.activate([
            tblFavMovies.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tblFavMovies.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tblFavMovies.topAnchor.constraint(equalTo: safeView.bottomAnchor, constant: 8),
            tblFavMovies.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
}
