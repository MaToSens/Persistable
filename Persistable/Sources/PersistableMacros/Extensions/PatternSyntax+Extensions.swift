//
//  PatternSyntax+Extensions.swift
//  PersistableMacro
//
//  Created by MaTooSens on 22/03/2025.
//

import SwiftSyntax

extension PatternSyntax {
    
    var isIdProperty: Bool {
        self
            .as(IdentifierPatternSyntax.self)?
            .identifier
            .text == "id"
    }
    
}
