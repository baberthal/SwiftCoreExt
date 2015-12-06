//
//  DebugMacros.swift
//  CoreExtensions
//
//  Created by Morgan Lieberthal on 12/5/15.
//  Copyright © 2015 Morgan Lieberthal. All rights reserved.
//

import Foundation
import Cocoa

public func dLog(@autoclosure message: () -> String, filename: String = __FILE__, function: StaticString = __FUNCTION__, line: UInt = __LINE__, column: UInt = __COLUMN__) {
#if DEBUG
    var path: String!
    if let fname = NSURL(string: filename) {
        path = fname.lastPathComponent
    } else {
        path = filename
    }
    NSLog("[\(path):\(line):\(column)] \(function) -- %@", message())
#endif
}

public func uLog(error: NSError, filename: String = __FILE__, function: StaticString = __FUNCTION__, line: UInt = __LINE__, column: UInt = __COLUMN__) {
#if DEBUG
    let alert = NSAlert(error: error)
    alert.runModal()
    NSLog("[\(filename):\(line):\(column)] \(function) -- %@", error)
#endif
}

public func aLog(@autoclosure message: () -> String, filename: String = __FILE__, function: StaticString = __FUNCTION__, line: UInt = __LINE__, column: UInt = __COLUMN__) {
    var path: String!
    if let fname = NSURL(string: filename) {
        path = fname.lastPathComponent
    } else {
        path = filename
    }
    NSLog("[\(path):\(line):\(column)] \(function) -- %@", message())
}

public func eLog(@autoclosure message: () -> String, error: NSError, filename: String = __FILE__, function: StaticString = __FUNCTION__, line: UInt = __LINE__, column: UInt = __COLUMN__) {
    var path: String!
    if let fname = NSURL(string: filename) {
        path = fname.lastPathComponent
    } else {
        path = filename
    }
    NSLog("[\(path):\(line):\(column)] \(function) -- %@", message())
    NSLog("An error occurred: %@", error)
}