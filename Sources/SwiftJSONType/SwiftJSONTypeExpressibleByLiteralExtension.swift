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

extension JSONType: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: BooleanLiteralType) {
        self.init(value)
    }
}

extension JSONType: ExpressibleByDictionaryLiteral {
    public typealias Key = String
    public typealias Value = Encodable

    public init(dictionaryLiteral elements: (String, Encodable)...) {
        var dictionary = [String: JSONType]()

        for (key, value) in elements {
            dictionary[key] = JSONType(value: value)
        }

        self.init(dictionary)
    }
}

extension JSONType: ExpressibleByFloatLiteral {
    public init(floatLiteral value: FloatLiteralType) {
        self.init(value)
    }
}

extension JSONType: ExpressibleByExtendedGraphemeClusterLiteral {
    public init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
        self.init(value)
    }
}

extension JSONType: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: IntegerLiteralType) {
        self.init(value)
    }
}

extension JSONType: ExpressibleByNilLiteral {
    public init(nilLiteral: ()) {
        self.init(nil)
    }
}

