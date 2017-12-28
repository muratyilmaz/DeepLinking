//
//  DeeplinkParser.swift
//  DeepLinking
//
//  Created by test on 28/12/2017.
//  Copyright © 2017 Grey. All rights reserved.
//

import Foundation

class DeeplinkParser {
    static let shared = DeeplinkParser()
    private init(){}
    
    func parseDeeplink(_ url: URL) -> DeepLinkType? {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true), let host = components.host else {
            return nil
        }
        
        print("host: \(host)")
        var pathComponents = components.path.components(separatedBy: "/")
        pathComponents.removeFirst()
        
        print("pathComponents first: \(pathComponents.first ?? "without host paramters")")
        
        switch host {
        case "activity":
            return DeepLinkType.activity
            /*if let _ = pathComponents.first {
                
            }*/
        default:
            break
        }
        
        return nil
    }
}
