//
//  LoginViewController.swift
//  DeepLinking
//
//  Created by test on 28/12/2017.
//  Copyright © 2017 Grey. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        title = "Login Screen"
        let loginButton = UIBarButtonItem(title: "Log In", style: UIBarButtonItemStyle.plain, target: self, action: #selector(login))
        navigationItem.setLeftBarButton(loginButton, animated: true)
    }
    
    @objc func login() {
        UserDefaults.standard.set(true, forKey: "LOGGED_IN")
        AppDelegate.shared.rootViewController.switchToMainScreen()
    }
}
