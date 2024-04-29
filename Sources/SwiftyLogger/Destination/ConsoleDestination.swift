//
//  ConsoleDestination.swift
//  SwiftyLogger
//
//  Created by devonly on 2024/04/29.
//  Copyright © 2024 Magi, Corporation. All rights reserved.
//

import Foundation
@_implementationOnly import SwiftyBeaver

extension ConsoleDestination {
    convenience init(format: String = "$DHH:mm:ss$d $L: $M") {
        self.init()
        self.format = format
        self.minLevel = .verbose
    }
}
