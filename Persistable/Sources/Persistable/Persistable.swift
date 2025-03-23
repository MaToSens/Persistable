@_exported import RealmSwift

@attached(peer, names: suffixed(DAO))
@attached(extension, conformances: Persistable, names: named(init(from:)))
public macro Persistable() = #externalMacro(module: "PersistableMacros", type: "PersistableMacro")
