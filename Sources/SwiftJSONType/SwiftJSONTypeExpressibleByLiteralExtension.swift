//
//  SwiftJSONTypeExpressibleByLiteralExtension.swift
//  SwiftJSONType
//
//  Created by Joshua Alvarado on 11/4/18.
//


extension JSONType: ExpressibleByArrayLiteral {
    public typealias ArrayLiteralElement = Encodable

    public init(arrayLiteral elements: Encodable...) {
        self.init(elements as? JSONType.JSONValue)
    }
}

