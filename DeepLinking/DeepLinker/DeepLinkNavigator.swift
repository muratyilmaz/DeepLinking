//
//  DeepLinkNavigator.swift
//  DeepLinking
//
//  Created by test on 28/12/2017.
//  Copyright © 2017 Grey. All rights reserved.
//
/*
import Foundation
import UIKit

class DeepLinkNavigator {
    
    static let shared  = DeepLinkNavigator()
    
    private var alertController = UIAlertController()
    
    private init() {}
    
    func proceedToDeepLink(_ type: DeepLinkType) {
        switch type {
        case .activity:
            displayAlert(title: "Activity")
        case .messages(.root):
            displayAlert(title: "Messages Root")
        case .messages(DeepLinkType.Messages.details(id: let id)):
            displayAlert(title: "Messages Details \(id)")
        case .newListing:
            displayAlert(title: "New Listing")
        case .request(id: let id):
            displayAlert(title: "Request Details \(id)")
        }
    }
    
    private func displayAlert(title:String) {
        alertController = UIAlertController(title: title, message: nil, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        alertController.addAction(okAction)
        
        if let vc = UIApplication.shared.keyWindow?.rootViewController {
            vc.present(alertController, animated: true, completion: nil)
        }
    }
}*/
