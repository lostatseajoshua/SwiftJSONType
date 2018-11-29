public struct JSONType {
    public typealias JSONValue = Encodable

    public let value: JSONValue?

    public init(value: JSONValue?) {
        self.value = value
    }

    public init(_ value: JSONValue?) {
        self.value = value
    }

// MARK: - Encodable
extension JSONType: Encodable {
    public func encode(to encoder: Encoder) throws {
        try value?.encode(to: encoder)
    }
}
