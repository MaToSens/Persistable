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
        
}
