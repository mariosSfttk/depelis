//
//  FavoritesPresenter.swift
//  DePelis
//
//  Created by Mario Vargas on 12/11/24.
//

import Foundation


protocol ProtocolFavoritesPresenter {
    var view: ProtocolFavoritesView? { get set }
    var interactor: ProtocolFavoritesInteractor? { get set }
    var router: ProtocolFavoritesRouter? { get set }
}


class FavoritesPresenter: ProtocolFavoritesPresenter {
    var view: (any ProtocolFavoritesView)?
    var interactor: (any ProtocolFavoritesInteractor)?
    var router: (any ProtocolFavoritesRouter)?
    
    
}
