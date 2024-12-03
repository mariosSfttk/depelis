//
//  FavoritesRouter.swift
//  DePelis
//
//  Created by Mario Vargas on 12/11/24.
//

import Foundation
import UIKit
import CoreData

protocol ProtocolFavoritesRouter {
    var view: (UIViewController & ProtocolFavoritesView)? { get set}
    static func start() -> ProtocolFavoritesRouter
}


class FavoritesRouter: ProtocolFavoritesRouter {
    var view: (any UIViewController & ProtocolFavoritesView)?
    
    
    static func start() -> any ProtocolFavoritesRouter {
        let router = FavoritesRouter()
        
        var view: ProtocolFavoritesView = FavoritesView()
        var presenter: ProtocolFavoritesPresenter = FavoritesPresenter()
        var interactor: ProtocolFavoritesInteractor = FavoritesInteractor()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.view = view as? (UIViewController & ProtocolFavoritesView)
        
        return router
    }
    
}

