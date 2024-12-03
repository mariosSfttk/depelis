//
//  AlertHelper.swift
//  DePelis
//
//  Created by Mario Vargas on 09/11/24.
//

import Foundation
import UIKit

class AlertHelpper {
    
    static func showAlert(parent: UIViewController, title: String = Strings.CustomAlert.titleAlert, message: String = Strings.CustomAlert.messageAlert, twoButtons: Bool = false, completionOk: (() -> Void)? = nil, completionCancel: (() -> Void)? = nil) {
        let alert = CustomAlertView(alertTitle: title, alertMessage: message, twoButtons: twoButtons) {
            completionOk!()
            parent.dismiss(animated: true)
        } completionCancel: {
            completionCancel!()
            parent.dismiss(animated: true)
        }
        
        alert.modalPresentationStyle = .overFullScreen
        alert.modalTransitionStyle = .crossDissolve
        DispatchQueue.main.async {
            parent.present(alert, animated: true)
        }
    }
    
}
