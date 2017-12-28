//
//  ViewController.swift
//  DeepLinking
//
//  Created by test on 28/12/2017.
//  Copyright © 2017 Grey. All rights reserved.
//

import UIKit

enum ProfileType: String {
    case guest = "Guest"
    case host = "Host"
}

class ViewController: UIViewController {
    
    lazy var switchButton: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Switch Profile", for: UIControlState.normal)
        return button
    }()
    
    var currentProfile = ProfileType.guest

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        configureFor(profileType: currentProfile)
        
        NSLayoutConstraint.activate([
            switchButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            switchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            switchButton.widthAnchor.constraint(equalToConstant: 120),
            switchButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configureFor( profileType: ProfileType) {
        title = profileType.rawValue
    }
}

