//
//  TokenSyntax+Extensions.swift
//  PersistableMacro
//
//  Created by MaTooSens on 22/03/2025.
//

import SwiftSyntax

extension TokenSyntax {
    // Protocols
    static let persistable = identifier("Persistable")
    static let realmObject = identifier("Object")
    static let localDAO = identifier("LocalDAO")
        
    // Init
    static let from = identifier("from")
    static let model = identifier("model")
    static let dao = identifier("dao")
    
    // Attributes
    static let persisted = identifier("Persisted")
    static let persistedPrimaryKey = identifier("Persisted(primaryKey: true)")
}
