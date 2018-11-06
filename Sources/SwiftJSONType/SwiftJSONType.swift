public struct JSONType: Encodable {
    public typealias JSONValue = Encodable

    public let value: JSONValue?

    public init(value: JSONValue?) {
        self.value = value
    }

    public init(_ value: JSONValue?) {
        self.value = value
    }

    public func encode(to encoder: Encoder) throws {
        try value?.encode(to: encoder)
    }
}
