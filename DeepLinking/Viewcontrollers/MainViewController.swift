//
//  MainViewController.swift
//  DeepLinking
//
//  Created by test on 28/12/2017.
//  Copyright © 2017 Grey. All rights reserved.
//

import UIKit
import UserNotifications

class MainNavigationController: UINavigationController {}



class MainViewController: UIViewController {
    
    let uncenter = UNUserNotificationCenter.current()
    
    private lazy var registerLNButton: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Register Local Notification", for: UIControlState.normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        title = "Main Screen"
        
        let logoutButton = UIBarButtonItem(title: "Log Out", style: UIBarButtonItemStyle.plain, target: self, action: #selector(logout))
        navigationItem.setLeftBarButton(logoutButton, animated: true)
        
        let activityButton = UIBarButtonItem(title: "Activity", style: UIBarButtonItemStyle.plain, target: self, action: #selector(showActivityScreen) )
        navigationItem.setRightBarButton(activityButton, animated: true)
        
        view.addSubview(registerLNButton)
        NSLayoutConstraint.activate([
            registerLNButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            registerLNButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            registerLNButton.widthAnchor.constraint(equalToConstant: 150),
            registerLNButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        registerLNButton.addTarget(self, action: #selector(registerButtonTapped), for: UIControlEvents.touchUpInside)
    }
    
    @objc func registerButtonTapped() {
        
        uncenter.getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .authorized:
                self.registerNotification()
            case .denied:
                print("local notification denied. Go settings")
            case .notDetermined:
                print("local notification not determined")
                self.requestAuthorization()
                break
            }
        }
    }
    
    private func registerNotification() {
        print("register notification")
        
        uncenter.removeDeliveredNotifications(withIdentifiers: ["FiveSecond"])
        
        let url = Bundle.main.url(forResource: "milk", withExtension: "jpeg")
        let attachment = try! UNNotificationAttachment(identifier: "FiveSecond", url: url!, options: .none)
        
        let content = UNMutableNotificationContent()
        content.title = "Don't forget"
        content.subtitle = "Please"
        content.body = "Buy some milk"
        content.sound = UNNotificationSound.default()
        content.attachments = [attachment]
        content.categoryIdentifier = "emojiNot"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 4, repeats: false)
        let request = UNNotificationRequest(identifier: "FiveSecond", content: content, trigger: trigger)
        uncenter.add(request, withCompletionHandler: nil)
    }
    
    private func requestAuthorization() {
        print("request Authorization for ln")
        uncenter.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            if granted {
                print("user granted")
                self.registerNotification()
            }else {
                print("user not granted")
            }
        }
    }
    
    @objc func logout() {
        UserDefaults.standard.set(false, forKey: "LOGGED_IN")
        AppDelegate.shared.rootViewController.switchToLogout()
    }


    @objc func showActivityScreen(animated: Bool = true) {
        print(animated)
        let activityController = ActivityViewController()
        navigationController?.pushViewController(activityController, animated: true)
    }
}
