//
//  DeepLinkManager.swift
//  DeepLinking
//
//  Created by test on 28/12/2017.
//  Copyright © 2017 Grey. All rights reserved.
//

import Foundation
import UIKit

let DeepLinker = DeepLinkManager()

class DeepLinkManager {
    fileprivate init() {}
    
    private var deepLinkType: DeepLinkType?
    
    func checkDeepLink() {
        AppDelegate.shared.rootViewController.deeplink = deepLinkType
        self.deepLinkType = nil
    }
    
    @discardableResult
    func handleShortcut(item:UIApplicationShortcutItem ) -> Bool {
        print("Handle shortcut item")
        deepLinkType = ShortcutParser.shared.handleShortcut(item)
        return deepLinkType != nil
    }
    
    func handleDeeplink( url: URL ) -> Bool {
        deepLinkType = DeeplinkParser.shared.parseDeeplink(url)
        return deepLinkType != nil
    }
}
