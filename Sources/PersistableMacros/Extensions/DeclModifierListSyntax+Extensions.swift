//
//  DeclModifierListSyntax+Extensions.swift
//  PersistableMacro
//
//  Created by MaTooSens on 22/03/2025.
//

import SwiftSyntax

extension DeclModifierListSyntax {
    // static
    static let overrideModifiers = Self { .overrideModifier }
    
    // variable
    var withFinal: Self { self + [.finalModifier] }
}

private extension DeclModifierSyntax {
    static let finalModifier = DeclModifierSyntax(name: .keyword(.final))
    static let overrideModifier = DeclModifierSyntax(name: .keyword(.override))
}
