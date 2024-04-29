//
//  FileDestination.swift
//  SwiftyLogger
//
//  Created by devonly on 2024/04/29.
//  Copyright © 2024 Magi, Corporation. All rights reserved.
//

import Foundation
@_implementationOnly import SwiftyBeaver

extension FileDestination {
    convenience init(
        format: String = "$DHH:mm:ss$d $L: $M",
        url: URL? = nil,
        logFileAmount: Int = 10,
        logFileMaxSize: Int = 1 * 1_024 * 1_024,
        minLevel: SwiftyBeaver.Level = {
#if targetEnvironment(simulator) || DEBUG
            return .debug
#else
            return .warning
#endif
        }()
    ) {
        self.init()
        self.logFileURL = url
        self.logFileAmount = logFileAmount
        self.logFileMaxSize = logFileAmount
        self.format = format
        self.minLevel = minLevel
    }
}
