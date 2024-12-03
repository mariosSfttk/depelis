//
//  Server.swift
//  DePelis
//
//  Created by Mario Vargas on 09/11/24.
//

import Foundation

class Server {
    
    public static let sharedInstance = Server()
    
    
    func simpleService(fromUrlString urlString: String, operationCode: Int, completion:  @escaping(_ operationCode: Int, Result<Data, Error>) -> Void ) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(operationCode, .failure(error))
                }
                
                if let data = data {
                    completion(operationCode, .success(data))
                }
            }
            urlSession.resume()
        }
    }
    func simplePostUrl(fromURLString urlString: String, parameters: [String: Any], operationCode: Int, completion: @escaping (_ opCode: Int, Result<Data, Error>) -> Void) {
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            let session = URLSession(configuration: .default)
            request.httpMethod = Strings.Server.methodPOST
            request.setValue(Strings.Server.appJson, forHTTPHeaderField: Strings.Server.contentType)
            request.addValue(Strings.Server.appJson, forHTTPHeaderField: Strings.Server.accept)
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
              } catch let error {
                print(error.localizedDescription)
                return
              }
            let task = session.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    completion(operationCode, .failure(error))
                }
                
                if let data = data {
                    completion(operationCode, .success(data))
                }
            }
            task.resume()
        }
    }
}
