import Persistable

@Persistable
struct User {
    let id: String
    let name: String
    let number: Int
}

@Persistable
public struct User2 {
    public let id: String
    public let name: String
    public let number: Int
}
