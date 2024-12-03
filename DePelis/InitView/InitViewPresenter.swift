//
//  InitViewPresenter.swift
//  DePelis
//
//  Created by Mario Vargas on 09/11/24.
//

import Foundation


protocol ProtocolInitViewPresenter {
    var view: ProtocolInitViewController? { get set }
    var interactor: ProtocolInitViewInteractor? { get set }
    var router: ProtocolInitRouter? { get set }
    
    func invokeTopRatedService(forPage: Int)
    func receiveTopRateMovies(movies: [Results])
}


class InitViewPresenter: ProtocolInitViewPresenter {
    var view: (any ProtocolInitViewController)?
    var interactor: (any ProtocolInitViewInteractor)?
    var router: (any ProtocolInitRouter)?
    
    
    func invokeTopRatedService(forPage: Int) {
        interactor?.getTopRatedMovies(page: forPage)
    }
    
    func receiveTopRateMovies(movies: [Results]) {
        view?.receiveMovies(movies: movies)
    }
}
