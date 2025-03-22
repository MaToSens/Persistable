//
//  ExtractProperties.swift
//  PersistableMacro
//
//  Created by MaTooSens on 22/03/2025.
//

import SwiftSyntax

struct Property {
    let modifiers: DeclModifierListSyntax
    let bindings: PatternBindingListSyntax
    let name: PatternSyntax
    let type: TypeSyntax
}

func extractProperties(from structDecl: StructDeclSyntax) throws -> [Property] {
    let properties: [Property] = structDecl.memberBlock.members
        .compactMap { $0.decl.as(VariableDeclSyntax.self) }
        .filter(isValidProperty)
        .compactMap(createProperty)
    
    guard properties.contains(where: {$0.name.isIdProperty } ) else {
        throw PersistableError.missingIdProperty
    }
    
    return properties
}

private func createProperty(from variableDecl: VariableDeclSyntax) -> Property? {
    guard
        let variablesName = variableDecl.bindings.first?.pattern,
        let variablesType = variableDecl.bindings.first?.typeAnnotation?.type
    else { return nil }
    
    return Property(
        modifiers: variableDecl.modifiers,
        bindings: variableDecl.bindings,
        name: variablesName,
        type: variablesType
    )
}

private func isValidProperty(_ variableDecl: VariableDeclSyntax) -> Bool {
    !hasAnyForbiddenModifier(for: variableDecl) && !hasComputedProperty(for: variableDecl)
}

private func hasAnyForbiddenModifier(for variableDecl: VariableDeclSyntax) -> Bool {
    let keywords: [Keyword] = [.private, .static, .fileprivate]
    
    return keywords.contains { keyword in
        variableDecl.modifiers.contains { $0.name.tokenKind == .keyword(keyword) }
    }
}

private func hasComputedProperty(for variableDecl: VariableDeclSyntax) -> Bool {
    variableDecl.bindings.first?.accessorBlock != nil
}
