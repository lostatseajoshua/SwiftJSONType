public struct JSONType: Encodable {
    public typealias Value = Encodable

    public let value: Value?

    public init(value: Value?) {
        self.value = value
    }

    public init(_ value: Value?) {
        self.value = value
    }

    public func encode(to encoder: Encoder) throws {
        try value?.encode(to: encoder)
    }
}
