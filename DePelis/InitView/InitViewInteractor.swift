//
//  InitViewInteractor.swift
//  DePelis
//
//  Created by Mario Vargas on 09/11/24.
//

import Foundation




protocol ProtocolInitViewInteractor {
    var presenter: ProtocolInitViewPresenter? { get set }
    
    func getTopRatedMovies(page: Int)
}

class InitViewInteractor: ProtocolInitViewInteractor {
    var presenter: (any ProtocolInitViewPresenter)?
    
    
    func getTopRatedMovies(page: Int) {
        let url = String(format: "%@%@&language=en-US&page=%i", URL_FOR_TOP_RATED_MOVIES, API_KEY, page)
        invokeServerForOperation(operation: OPERATION_TOP_RATED_MOVIES, url: url)
    }
    
    
    
    
    func invokeServerForOperation(operation: Int, url: String) {
        Server.sharedInstance.simpleService(fromUrlString: url, operationCode: operation) { (operationCode, result) in
            Loader.sharedInstance.hideIndicator()
            switch operationCode {
            case OPERATION_TOP_RATED_MOVIES:
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                    break
                case .success(let data):
//                    print("fue exitoso")
//                    if let str = String(data: data, encoding: .utf8) {
//                        print("Successfully decoded: \(str)")
//                    }
                    
                    do {
                        let decoder = JSONDecoder()
                        let response = try decoder.decode(TopRateMovies.self,from: data)
                        self.presenter?.receiveTopRateMovies(movies: response.results)
                    } catch {
                        print( Strings.General.wrongMessage + error.localizedDescription)
                    }
                }
                break
            default:
                print(Strings.General.invalidOp)
            }
        }
    }
}
