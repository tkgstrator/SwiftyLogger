//
//  SwiftyLogger.swift
//  SwiftyLogger
//
//  Created by devonly on 2024/04/29.
//  Copyright © 2024 Magi, Corporation. All rights reserved.
//

import Foundation
@_implementationOnly import SwiftyBeaver
#if canImport(UIKit)
import UIKit
#endif

public enum SwiftyLogger {
    private static let logger: SwiftyBeaver.Type = SwiftyBeaver.self
    private static let manager: FileManager = .default
    private static let baseURL: URL = {
        guard let baseURL: URL = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        else {
            fatalError("Could not find a document directory.")
        }
        return baseURL
            .appendingPathComponent("logs", isDirectory: true)
            .appendingPathComponent("swiftylogger.log", isDirectory: false)
    }()
    
    public static func configure(
        format: String = "$DHH:mm:ss$d $L: $M",
        logFileAmount: Int = 10,
        logFileMaxSize: Int = 1 * 1_024 * 1_024
    ) {
        logger.addDestination(.file(baseURL: baseURL, minLevel: .debug))
#if targetEnvironment(simulator) || DEBUG
        logger.addDestination(.console)
#endif
    }
    
    @discardableResult
    public static func deleteLogFile() -> Bool {
        guard let destination: FileDestination = logger.destinations.compactMap({ $0 as? FileDestination }).first else {
            return false
        }
        return destination.deleteLogFile()
    }
    
    /// log something which you are really interested but which is not an issue or error (normal priority)
    public static func info(_ message: Any, context: Any? = nil) {
        logger.info(message, context: context)
    }
    
    /// log something which will keep you awake at night (highest priority)
    public static func error(_ message: Any, context: Any? = nil) {
        logger.error(message, context: context)
    }
    
    /// log something which help during debugging (low priority)
    public static func debug(_ message: Any, context: Any? = nil) {
        logger.debug(message, context: context)
    }
    
    /// log something which may cause big trouble soon (high priority)
    public static func warn(_ message: Any, context: Any? = nil) {
        logger.warning(message, context: context)
    }
    
    /// log something generally unimportant (lowest priority)
    public static func verbose(_ message: Any, context: Any? = nil) {
        logger.verbose(message, context: context)
    }
}
