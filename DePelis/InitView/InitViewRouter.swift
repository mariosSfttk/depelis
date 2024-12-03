//
//  InitViewRouter.swift
//  DePelis
//
//  Created by Mario Vargas on 09/11/24.
//

import Foundation
import UIKit


protocol ProtocolInitRouter {
    var view: (UIViewController & ProtocolInitViewController)? { get set}
    static func start() -> ProtocolInitRouter
}



class InitViewRouter: ProtocolInitRouter {
    var view: (any UIViewController & ProtocolInitViewController)?
    
    static func start() -> any ProtocolInitRouter {
        let router = InitViewRouter()
        
        var view: ProtocolInitViewController = InitViewController()
        var presenter: ProtocolInitViewPresenter = InitViewPresenter()
        var interactor: ProtocolInitViewInteractor = InitViewInteractor()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.view = view as? (UIViewController & ProtocolInitViewController)
        
        return router
    }
    
    
}
