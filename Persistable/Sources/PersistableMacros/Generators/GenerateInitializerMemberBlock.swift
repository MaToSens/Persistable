//
//  GenerateInitializerMemberBlock.swift
//  PersistableMacro
//
//  Created by MaTooSens on 22/03/2025.
//

import SwiftSyntax

func generateInitializerMemberBlock(
    persistableContext: PersistableContext,
    sourceParamName: TokenSyntax,
    includeSuperInit: Bool = false
) -> [MemberBlockItemSyntax] {
    let signature = generateFunctionSignature(
        sourceParamName: sourceParamName,
        sourceType: persistableContext.tokens.daoType
    )
    
    let body = generateCodeBlockSyntax(
        properties: persistableContext.properties,
        sourceParamName: sourceParamName,
        includeSuperInit: includeSuperInit
    )
    
    let initDecl = InitializerDeclSyntax(
        modifiers: persistableContext.structDecl.modifiers,
        signature: signature,
        body: body
    )
    
    return [.init(decl: DeclSyntax(initDecl))]
}

private func generateFunctionSignature(
    sourceParamName: TokenSyntax,
    sourceType: TypeSyntax
) -> FunctionSignatureSyntax {
    FunctionSignatureSyntax(
        parameterClause: FunctionParameterClauseSyntax(
            parameters: FunctionParameterListSyntax(
                generateFunctionParameter(
                    sourceParamName: sourceParamName,
                    sourceType: sourceType
                )
            )
        )
    )
}

private func generateFunctionParameter(
    sourceParamName: TokenSyntax,
    sourceType: TypeSyntax
) -> [FunctionParameterSyntax] {
    [
        FunctionParameterSyntax(
            firstName: .from,
            secondName: sourceParamName,
            type: sourceType
        )
    ]
}

private func generateCodeBlockSyntax(
    properties: [Property],
    sourceParamName: TokenSyntax,
    includeSuperInit: Bool
) -> CodeBlockSyntax {
    CodeBlockSyntax(
        statements: CodeBlockItemListSyntax {
            if includeSuperInit { CodeBlockItemSyntax.superInit }
            
            properties.map {
                CodeBlockItemSyntax.propertyAssignment(propertyName: $0.name, fromSource: sourceParamName)
            }
        }
    )
}
