//
//  FavoritesInteractor.swift
//  DePelis
//
//  Created by Mario Vargas on 12/11/24.
//

import Foundation


protocol ProtocolFavoritesInteractor {
    var presenter: ProtocolFavoritesPresenter? { get set }
}

class FavoritesInteractor: ProtocolFavoritesInteractor {
    var presenter: (any ProtocolFavoritesPresenter)?
    
    
}
