//
//  GenerateVariableMemberBlock.swift
//  PersistableMacro
//
//  Created by MaTooSens on 23/03/2025.
//

import SwiftSyntax

func generateVariableMemberBlock(from properties: [Property]) -> [MemberBlockItemSyntax] {
    properties.map {
        let variableDecl = VariableDeclSyntax(
            attributes: .persistenceAttributes(for: $0),
            modifiers: $0.modifiers.trimmed,
            bindingSpecifier: .keyword(.var),
            bindings: $0.bindings
        )
        
        return .init(decl: DeclSyntax(variableDecl))
    }
}
    

private extension AttributeListSyntax {
    static func persistenceAttributes(for property: Property) -> AttributeListSyntax {
        AttributeListSyntax {
            AttributeSyntax(
                attributeName: IdentifierTypeSyntax(
                    name: property.name.isIdProperty ? .persistedPrimaryKey : .persisted
                )
            )
        }
    }
}
