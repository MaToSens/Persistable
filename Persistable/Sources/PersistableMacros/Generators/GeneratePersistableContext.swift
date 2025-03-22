//
//  PersistableContext.swift
//  PersistableMacro
//
//  Created by MaTooSens on 22/03/2025.
//

import SwiftSyntax

struct PersistableContext {
    let structDecl: StructDeclSyntax
    let properties: [Property]
    let inheritanceClause: InheritanceClauseSyntax
    let structToken: TokenSyntax
    let classToken: TokenSyntax
}

func generatePersistableContext(
    from declaration: some DeclSyntaxProtocol,
    conformingTo protocols: [TokenSyntax]
) throws -> PersistableContext {
    guard let structDecl = declaration.as(StructDeclSyntax.self) else {
        throw PersistableError.onlyApplicableToStruct
    }
    
    let properties = try extractProperties(from: structDecl)
    let inheritanceClause = createInheritanceClause(with: protocols)
    let (structToken, classToken) = createTypeTokens(for: structDecl.name.text)
    
    return PersistableContext(
        structDecl: structDecl,
        properties: properties,
        inheritanceClause: inheritanceClause,
        structToken: structToken,
        classToken: classToken
    )
}

private func createInheritanceClause(with protocols: [TokenSyntax]) -> InheritanceClauseSyntax {
    let inheritedTypes = protocols.map { InheritedTypeSyntax(type: IdentifierTypeSyntax(name: $0)) }
    return InheritanceClauseSyntax { inheritedTypes }
}

private func createTypeTokens(for typeName: String) -> (structToken: TokenSyntax, daoToken: TokenSyntax) {
    (
        TokenSyntax(stringLiteral: typeName),
        TokenSyntax(stringLiteral: "\(typeName)DAO")
    )
}
