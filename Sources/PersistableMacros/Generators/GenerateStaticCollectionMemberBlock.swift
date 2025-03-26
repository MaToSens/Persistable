//
//  generateStaticCollectionMemberBlock.swift
//  PersistableMacro
//
//  Created by MaTooSens on 26/03/2025.
//

import SwiftSyntax

func generateStaticCollectionMemberBlock(from structDecl: StructDeclSyntax) -> [MemberBlockItemSyntax] {
    let label = extractSchemaName(from: structDecl)
    
    let bindings = PatternBindingListSyntax {
        PatternBindingSyntax(
            pattern: IdentifierPatternSyntax(identifier: .collection),
            typeAnnotation: TypeAnnotationSyntax(type: IdentifierTypeSyntax(name: .string)),
            initializer: InitializerClauseSyntax(value: ExprSyntax(literal: "\(label.text.lowercased())"))
        )
    }
    
    let staticVar = VariableDeclSyntax(
        modifiers: structDecl.modifiers.withStatic,
        bindingSpecifier: .keyword(.let),
        bindings: bindings,
        trailingTrivia: .newlines(2)
    )
    
    return [MemberBlockItemSyntax(decl: staticVar)]
}

private func extractSchemaName(from structDecl: StructDeclSyntax) -> TokenSyntax {
    guard
        let attributes = structDecl.attributes.first?.as(AttributeSyntax.self),
        let arguments = attributes.arguments?.as(LabeledExprListSyntax.self),
        let expression = arguments.first?.expression.as(StringLiteralExprSyntax.self),
        let segment = expression.segments.first,
        let content = segment.as(StringSegmentSyntax.self)?.content
    else {
        return TokenSyntax(stringLiteral: "")
    }
    
    return content
}
