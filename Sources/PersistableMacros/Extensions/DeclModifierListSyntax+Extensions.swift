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
    static let staticModifier = Self { .staticModifier }
    static let publicModifier = Self { .publicModifier }
    
    // variable
    var withFinal: Self { self + [.finalModifier] }
    var withStatic: Self { self + [.staticModifier] }
}

private extension DeclModifierSyntax {
    static let finalModifier = DeclModifierSyntax(name: .keyword(.final))
    static let overrideModifier = DeclModifierSyntax(name: .keyword(.override))
    static let staticModifier = DeclModifierSyntax(name: .keyword(.static))
    static let publicModifier = DeclModifierSyntax(name: .keyword(.public))
}
