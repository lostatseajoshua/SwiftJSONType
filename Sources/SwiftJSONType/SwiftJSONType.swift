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
        try value?.encode(to: encoder)
    }
}

public typealias JT = JSONType
public typealias JSON = JSONType
public typealias Json = JSONType
