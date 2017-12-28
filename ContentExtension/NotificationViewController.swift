//
//  NotificationViewController.swift
//  ContentExtension
//
//  Created by test on 28/12/2017.
//  Copyright © 2017 Grey. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var emojiLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func didReceive(_ notification: UNNotification) {
        print("did receive")
        if let attachment = notification.request.content.attachments.first {
            print("attachment is available")
            if attachment.url.startAccessingSecurityScopedResource() {
                print("attachment url \(attachment.url.path)")
                imageView.image = UIImage(contentsOfFile: attachment.url.path)
                attachment.url.stopAccessingSecurityScopedResource()
            }
        }
    }

}
