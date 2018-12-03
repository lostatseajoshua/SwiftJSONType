public struct JSONType {
    public typealias JSONValue = Encodable

    public let value: JSONValue?

    public init(value: JSONValue?) {
        self.value = value
    }

    public init(_ value: JSONValue?) {
        self.value = value
    }

    public func getValue<T>() -> T? {
      return value as? T
    }
}

// MARK: - Encodable
extension JSONType: Encodable {
    public func encode(to encoder: Encoder) throws {
        if let value = value {
            try value.encode(to: encoder)
        } else {
            var singleValueContainerEncoder = encoder.singleValueContainer()
            try singleValueContainerEncoder.encodeNil()
        }
    }
}

public typealias JT = JSONType
public typealias JSON = JSONType
public typealias Json = JSONType
