# 📦 Swift Persistable Macro

A Swift Macro that simplifies the creation of persistent data models with Realm.

## Overview 🔍

The `@Persistable` macro automates the creation of Realm database objects from your Swift models. By simply applying the `@Persistable` attribute to your struct, the macro will generate:

1. A corresponding `DAO` (Data Access Object) class that conforms to Realm's `Object` protocol
2. An extension to your struct that conforms to the `Persistable` protocol
3. Appropriate initializers and property mappings between your model and its DAO


# 📦 Swift Persistable Macro
A Swift Macro that simplifies the creation of persistent data models with Realm.
## Overview 🔍
The `@Persistable` macro automates the creation of Realm database objects from your Swift models. By simply applying the `@Persistable` attribute to your struct, the macro will generate:
1. A corresponding `DAO` (Data Access Object) class that conforms to Realm's `Object` protocol
2. An extension to your struct that conforms to the `Persistable` protocol
3. Appropriate initializers and property mappings between your model and its DAO

## Example Project 🚀
You can find a complete example project demonstrating how to use the `@Persistable` macro at:
(https://github.com/MaToSens/PersistableMacroExample.git)

The example project includes a simple Todo application that shows how to implement CRUD operations (Create, Read, Update, Delete) with the Persistable framework.

## Installation 📲

Add the package to your Swift Package Manager dependencies:

```swift
dependencies: [
    .package(url: "https://github.com/MaToSens/Persistable.git", from: "1.0.0")
]
```

Then add the dependency to your target:

```swift
.target(
    name: "YourTarget",
    dependencies: ["Persistable"]
)
```

## Usage 💻

### Basic Example

```swift
import Persistable

@Persistable
public struct User {
    public let id: String
    public let name: String
    public let age: Int
}
```

This will generate a `UserDAO` class that can be used with Realm:

```swift
public final class UserDAO: Object, LocalDAO {
    @Persisted(primaryKey: true) public var id: String
    @Persisted public var name: String
    @Persisted public var age: Int

    override public init() {
        super.init()
        self.name = ""
        self.age = 0
    }

    public init(from model: User) {
        super.init()
        self.id = model.id
        self.name = model.name
        self.age = model.age
    }
}
```

And an extension to your `User` struct:

```swift
extension User: Persistable {
    public init(from dao: UserDAO) {
        self.id = dao.id
        self.name = dao.name
        self.age = dao.age
    }
}
```

### Requirements ✅

- Your model must have a property named `id` which will be used as the primary key
- Properties must use Swift's native types or types that are compatible with Realm
- Currently supported types include: String, Bool, Int, Float, Double, Date, UUID, Data, URL, and more

## How It Works ⚙️

The macro analyzes your struct and:

1. Filters out `private`, `private(set)`, `fileprivate`, `static`, and `computed properties`
2. Creates a corresponding DAO class with Realm's `@Persisted` attributes
3. Generates initializers for converting between your model and the DAO
4. Sets appropriate default values for each property type

## Customization 🔧

By default, all public, non-static properties are included in the persistent model. Private, private(set), fileprivate, static, and computed properties are automatically excluded. Properties with custom getters or setters (computed properties) are also skipped.

## License 📄

[MIT License](LICENSE)
