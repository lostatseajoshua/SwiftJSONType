# SwiftJSONType
> Concrete JSON Type in Swift. 

Swift is missing a concrete json object to create dictionaries and collections with mixed json codable objects.

## Usage

```swift
// create JSONType with any value that is encodable
let jsonType = JSONType(value: [1])

// Literals are supported as well for boolean, dictionary, array, nil, float, and string
let jsonLiteralType: JSONType = 1
let stringJsonType: JSONType = "hello"

// Get the value of the json type
jsonType.value // Optional(1)
if let num: Int = jsonType.getValue() {
  // casted as Int
}

// create [String: JSONType] collections
let dictionary: [String: JSONType] = ["baz": 100, "rect": JSONType(CGRect(x: 12, y: 12, width: 12, height: 12)), "bar": true]

// use JSONType with codable

class Bar: Codable {
    let baz: Int?
    let rect: CGRect
    let bar true

    init() {
        self.baz = baz
        self.rect = .zero
        self.bar = false
    }
}

let encodedData = try! JSONEncoder().encode(dictionary)
let bar = try! JSONDecoder().decode(Bar.self, from: encodedData)
print(bar.rect) // x: 12, y: 12, width: 12, height: 12
```

## Install

With [Swift Package Manager](https://swift.org/package-manager/)

```
// add to your dependncies in Package.swift

import PackageDescription

let package = Package(
    name: "YourProject",
    targets: [],
    dependencies: [
        // add this dependency
        .Package(url: "https://github.com/lostatseajoshua/SwiftJSONType.git"),
    ]
)

> run swift build, swift test or swift package generate-xcodeproj
```

## License

This project is released under the [MIT license](https://github.com/lostatseajoshua/SwiftJSONType/blob/master/LICENSE).
