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
    let tokens: PersistableTypeTokens
}

struct PersistableTypeTokens {
    let entityToken: TokenSyntax
    let entityType: TypeSyntax
    let daoToken: TokenSyntax
    let daoType: TypeSyntax
}

func generatePersistableContext(
    from declaration: some DeclSyntaxProtocol,
    conformingTo protocols: [TokenSyntax]
) throws -> PersistableContext {
    guard let structDecl = declaration.as(StructDeclSyntax.self) else {
        throw PersistableError.onlyApplicableToStruct
    }
    
    let properties = try extractProperties(from: structDecl)
    let inheritanceClause = generateInheritanceClause(with: protocols)
    let persistableTypeTokens = generateTypeTokens(for: structDecl.name.text)
    
    return PersistableContext(
        structDecl: structDecl,
        properties: properties,
        inheritanceClause: inheritanceClause,
        tokens: persistableTypeTokens
    )
}

private func generateInheritanceClause(with protocols: [TokenSyntax]) -> InheritanceClauseSyntax {
    let inheritedTypes = protocols.map { InheritedTypeSyntax(type: IdentifierTypeSyntax(name: $0)) }
    return InheritanceClauseSyntax { inheritedTypes }
}

private func generateTypeTokens(for typeName: String) -> PersistableTypeTokens {
    let daoTypeName = "\(typeName)DAO"
    
    return PersistableTypeTokens(
        entityToken: TokenSyntax(stringLiteral: typeName),
        entityType: TypeSyntax(stringLiteral: typeName),
        daoToken: TokenSyntax(stringLiteral: daoTypeName),
        daoType: TypeSyntax(stringLiteral: daoTypeName)
    )
}
