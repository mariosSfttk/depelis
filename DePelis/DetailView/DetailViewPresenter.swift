//
//  DetailViewPresenter.swift
//  DePelis
//
//  Created by Mario Vargas on 09/11/24.
//

import Foundation
import UIKit


protocol ProtocolDetailViewPresenter {
    var view: ProtocolDetailView? { get set }
    var interactor: ProtocolDetailViewInteractor? { get set }
    var router: ProtocolDetailViewRouter? { get set }
    
    func invokeImageService()
}


class DetailViewPresenter: ProtocolDetailViewPresenter {
    var view: (any ProtocolDetailView)?
    var interactor: (any ProtocolDetailViewInteractor)?
    var router: (any ProtocolDetailViewRouter)?
    
    
    func invokeImageService() {
        interactor?.getImageService()
    }
}
