//
//  DetailViewFacade.swift
//  DePelis
//
//  Created by Mario Vargas on 09/11/24.
//

import Foundation
import UIKit



extension DetailViewController {
    func addingSubViews() {
        view.addSubview(safeView)
        safeView.addSubview(btnBack)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(lblTitleMovie)
        contentView.addSubview(posterView)
        contentView.addSubview(lblDescription)
        contentView.addSubview(lblDate)
        contentView.addSubview(lblRate)
        contentView.addSubview(blurView)
        contentView.addSubview(btnFavs)
    }
    
    func setupComponentsView() {
        setSafeViewConstraints()
        setBtnBackConstraints()
        setScrollViewConstraints()
        setContentViewConstraints()
        setLblTitleConstraints()
        setPosterConstraints()
        setLblDescriptionConstraints()
        setLblDateConstraints()
        setLblRateConstraints()
        setBlurConstraints()
        setBtnFavConstraints()
    }
    
    func setSafeViewConstraints() {
        NSLayoutConstraint.activate([
            safeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            safeView.topAnchor.constraint(equalTo: view.topAnchor),
            safeView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            safeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 41),
        ])
    }
    
    func setBtnBackConstraints() {
        NSLayoutConstraint.activate([
            btnBack.leadingAnchor.constraint(equalTo: safeView.leadingAnchor, constant: 12),
            btnBack.topAnchor.constraint(equalTo: safeView.safeAreaLayoutGuide.topAnchor, constant: 0),
            btnBack.heightAnchor.constraint(equalToConstant: 41),
        ])
    }
    
    func setScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: safeView.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func setContentViewConstraints() {
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
    }
    
    func setLblTitleConstraints() {
        NSLayoutConstraint.activate([
            lblTitleMovie.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            lblTitleMovie.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            lblTitleMovie.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }
    func setPosterConstraints() {
        NSLayoutConstraint.activate([
            posterView.topAnchor.constraint(equalTo: lblTitleMovie.bottomAnchor, constant: 8),
            posterView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            posterView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            posterView.heightAnchor.constraint(equalToConstant: 400),
        ])
    }
    
    func setBlurConstraints() {
        NSLayoutConstraint.activate([
            blurView.leadingAnchor.constraint(equalTo: posterView.leadingAnchor),
            blurView.centerXAnchor.constraint(equalTo: posterView.centerXAnchor),
            blurView.bottomAnchor.constraint(equalTo: posterView.bottomAnchor),
        ])
    }
    
    func setLblDescriptionConstraints() {
        NSLayoutConstraint.activate([
            lblDescription.topAnchor.constraint(equalTo: blurView.bottomAnchor, constant: 20),
            lblDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            lblDescription.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }
    
    func setLblDateConstraints() {
        NSLayoutConstraint.activate([
            lblDate.topAnchor.constraint(equalTo: blurView.topAnchor, constant: 20),
            lblDate.leadingAnchor.constraint(equalTo: blurView.leadingAnchor, constant: 20),
        ])
    }
    
    func setLblRateConstraints() {
        NSLayoutConstraint.activate([
            lblRate.topAnchor.constraint(equalTo: blurView.topAnchor, constant: 20),
            lblRate.leadingAnchor.constraint( greaterThanOrEqualTo: lblDate.trailingAnchor, constant: 20),
            blurView.trailingAnchor.constraint(equalTo: lblRate.trailingAnchor, constant: 20),
            blurView.bottomAnchor.constraint(greaterThanOrEqualTo: lblRate.bottomAnchor, constant: 20)
        ])
    }
    
    func setBtnFavConstraints() {
        NSLayoutConstraint.activate([
            btnFavs.topAnchor.constraint(equalTo: lblDescription.bottomAnchor, constant: 20),
            btnFavs.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            contentView.bottomAnchor.constraint(greaterThanOrEqualTo: btnFavs.bottomAnchor, constant: 30),
            
        ])
    }
    
    
}
