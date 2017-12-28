//
//  RootViewController.swift
//  DeepLinking
//
//  Created by test on 28/12/2017.
//  Copyright © 2017 Grey. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    var deeplink: DeepLinkType? {
        didSet {
            handleDeeplink()
        }
    }
    
    private var current: UIViewController
    
    init() {
        current = SplashViewController()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        addChildViewController(current)
        current.view.frame = view.bounds
        view.addSubview(current.view)
        current.didMove(toParentViewController: self)
    }
    
    private func handleDeeplink() {
        if let mainNavController = current as? MainNavigationController, let deeplink = deeplink {
            
            switch deeplink {
            case .activity:
                
                mainNavController.popViewController(animated: false)
                if let topVC = mainNavController.topViewController as? MainViewController {
                    topVC.showActivityScreen()
                }
                
            default:
                
                break
            }
            
            self.deeplink = nil
        }
    }
    
    func showLoginScreen() {
        let new = UINavigationController(rootViewController: LoginViewController())
        
        addChildViewController(new)
        new.view.frame = view.bounds
        view.addSubview(new.view)
        new.didMove(toParentViewController: self)
        
        current.willMove(toParentViewController: nil)
        current.view.removeFromSuperview()
        current.removeFromParentViewController()
        
        current = new
    }
    
    func switchToMainScreen() {
        let new = MainNavigationController(rootViewController: MainViewController())
        animateFadeTransition(to: new) { [weak self] in
            self?.handleDeeplink()
        }
    }
    
    func switchToLogout() {
        let logoutScreen = UINavigationController(rootViewController: LoginViewController())
        animateDismissTransition(to: logoutScreen)
    }
    
    private func animateDismissTransition(to new: UIViewController, completion: (()->Void)? = nil ) {
        
        let initialFrame = CGRect(x: -view.bounds.width, y: 0, width: view.bounds.width, height: view.bounds.height)
        
        current.willMove(toParentViewController: nil)
        addChildViewController(new)
        
        new.view.frame = initialFrame
        transition(from: current, to: new, duration: 0.3, options: [], animations: {
            new.view.frame = self.view.bounds
        }) { completed in
            self.current.removeFromParentViewController()
            new.didMove(toParentViewController: self)
            self.current = new
            completion?()
        }
    }
    
    private func animateFadeTransition(to new: UIViewController, completion: (()->Void)? = nil ) {
        current.willMove(toParentViewController: nil)
        addChildViewController(new)
        
        transition(from: current, to: new, duration: 0.3, options: [.transitionCrossDissolve, .curveEaseOut], animations: {}) { completed in
            self.current.removeFromParentViewController()
            new.didMove(toParentViewController: self)
            self.current = new
            completion?()
        }
    }

}
