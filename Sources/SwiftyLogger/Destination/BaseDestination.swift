//
//  ConsoleDestination.swift
//  SwiftyLogger
//
//  Created by devonly on 2024/04/29.
//  Copyright © 2024 Magi, Corporation. All rights reserved.
//

import Foundation
@_implementationOnly import SwiftyBeaver

extension BaseDestination {
    static let console: ConsoleDestination = {
        .init()
    }()

    static func file(baseURL: URL, minLevel: SwiftyBeaver.Level) -> FileDestination {
        .init(url: baseURL, minLevel: minLevel)
    }
}
