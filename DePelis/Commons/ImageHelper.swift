//
//  ImageHelper.swift
//  DePelis
//
//  Created by Mario Vargas on 09/11/24.
//

import Foundation
import UIKit




func getImage(forUrl: String, completion: @escaping(_ myImage: UIImage) -> Void) {
    DispatchQueue.global(qos: .background).async {
        let completeUrl = URL_FOR_IMAGE + forUrl
        
        let imgUrl = URL( string: completeUrl)
        let imageData = NSData(contentsOf: imgUrl! as URL)
        
        DispatchQueue.main.async {
            
            if let imgData = imageData as? Data {
                let auxImg = UIImage.init(data: imgData)
                completion(auxImg!)
            }
        }
    }
}
