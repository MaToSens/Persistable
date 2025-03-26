@_exported import RealmSwift

@attached(peer, names: suffixed(DAO))
@attached(extension, conformances: Persistable, names: named(init(from:)), named(collection))
public macro Persistable(_ collection: String = "") = #externalMacro(module: "PersistableMacros", type: "PersistableMacro")
