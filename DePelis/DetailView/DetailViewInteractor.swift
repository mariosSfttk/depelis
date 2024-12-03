//
//  DetailViewInteractor.swift
//  DePelis
//
//  Created by Mario Vargas on 09/11/24.
//

import Foundation
import UIKit


protocol ProtocolDetailViewInteractor {
    var presenter: ProtocolDetailViewPresenter? { get set }
    
    func getImageService()
}


class DetailViewInteractor: ProtocolDetailViewInteractor {
    var presenter: (any ProtocolDetailViewPresenter)?
    
    func getImageService() {
        
    }
}
