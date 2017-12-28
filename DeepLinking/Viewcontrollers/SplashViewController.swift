//
//  SplashViewController.swift
//  DeepLinking
//
//  Created by test on 28/12/2017.
//  Copyright © 2017 Grey. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    private let activityIndciator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(activityIndciator)
        activityIndciator.frame = view.bounds
        activityIndciator.backgroundColor = UIColor(white: 0, alpha: 0.4)
        
        makeServiceCall()
    }
    
    private func makeServiceCall() {
        activityIndciator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            self.activityIndciator.stopAnimating()
            
            if UserDefaults.standard.bool(forKey: "LOGGED_IN") {
                AppDelegate.shared.rootViewController.switchToMainScreen()
            }else {
                AppDelegate.shared.rootViewController.showLoginScreen()
            }
        }
    }

}
