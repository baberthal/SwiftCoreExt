//
// Regex.swift
// CoreExtensions
//
// Created by Morgan Lieberthal on 12/5/15.
// Copyright © 2015 Morgan Lieberthal. All rights reserved.
//

import Foundation
import Swift

public struct Regex {
    public let pattern: String
    public var options: NSRegularExpressionOptions?

    private var effectiveOptions: NSRegularExpressionOptions {
        return self.options ?? []
    }

    private var matcher: NSRegularExpression? {
        return try! NSRegularExpression(
            pattern: self.pattern,
            options: effectiveOptions
        )
    }

    public init(pattern: String) {
        self.pattern = pattern
    }

    public init(pattern: String, options: NSRegularExpressionOptions) {
        self.pattern = pattern
        self.options = options
    }

    public func match(string: String, options: NSMatchingOptions = []) -> Bool {
        return(
            self.matcher!.numberOfMatchesInString(
                string,
                options: options,
                range: NSMakeRange(0, string.utf16.count)) != 0
        )
    }
}

extension Regex: StringLiteralConvertible {
    public typealias StringLiteralType = String
    public typealias ExtendedGraphemeClusterLiteralType = StringLiteralType
    public typealias UnicodeScalarLiteralType = Character

    public init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
        self.init(pattern: "\(value)")
    }

    public init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
        self.init(pattern: value)
    }

    public init(stringLiteral value: StringLiteralType) {
        self.init(pattern: value)
    }
}

public protocol RegexMatchable {
    func match(regex: Regex) -> Bool
}

infix operator =~ {associativity left precedence 130}
public func =~ <T:RegexMatchable> (left: T, right: Regex) -> Bool {
    return left.match(right)
}

extension String: RegexMatchable {
    public func match(regex: Regex) -> Bool {
        return regex.match(self)
    }
}