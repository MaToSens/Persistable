//
//  DeclModifierListSyntax+Extensions.swift
//  PersistableMacro
//
//  Created by MaTooSens on 22/03/2025.
//

import SwiftSyntax

// TODO: Sprawdzić które są faktycznie potrzebne
// Prawdopodobnie publicModifiers wylatuje
extension DeclModifierListSyntax {
    static let publicModifiers = Self { .publicModifier }
    static let publicFinalModifiers = Self { [.publicModifier, .finalModifier] }
    static let publicOverrideModifiers = Self { [.overrideModifier, .publicModifier] }
}

private extension DeclModifierSyntax {
    static let publicModifier = DeclModifierSyntax(name: .keyword(.public))
    static let finalModifier = DeclModifierSyntax(name: .keyword(.final))
    static let overrideModifier = DeclModifierSyntax(name: .keyword(.override))
}
