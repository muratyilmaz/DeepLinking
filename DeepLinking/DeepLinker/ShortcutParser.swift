//
//  ShortcutParser.swift
//  DeepLinking
//
//  Created by test on 28/12/2017.
//  Copyright © 2017 Grey. All rights reserved.
//

import Foundation
import UIKit

enum ShortcutKey: String {
    case activity = "com.grey.activity"
    case messages = "com.grey.messages"
}

class ShortcutParser {

    static let shared = ShortcutParser()
    
    private init(){}
    
    func handleShortcut(_ shortcut: UIApplicationShortcutItem) -> DeepLinkType? {
        switch shortcut.type {
        case ShortcutKey.activity.rawValue:
            return .activity
        case ShortcutKey.messages.rawValue:
            return .messages
        default:
            return nil
        }
    }
    
    
    func registerShortcuts() {
        let activityIcon = UIApplicationShortcutIcon(type: UIApplicationShortcutIconType.alarm)
        let activityShortcutItem = UIApplicationShortcutItem(type: ShortcutKey.activity.rawValue, localizedTitle: "Recent Activity", localizedSubtitle: nil, icon: activityIcon, userInfo: nil)
        
        let messageIcon = UIApplicationShortcutIcon(type: UIApplicationShortcutIconType.alarm)
        let messageShortcutItem = UIApplicationShortcutItem(type: ShortcutKey.messages.rawValue, localizedTitle: "Messages", localizedSubtitle: nil, icon: messageIcon, userInfo: nil)
        
        UIApplication.shared.shortcutItems = [ activityShortcutItem, messageShortcutItem]
    }
}
