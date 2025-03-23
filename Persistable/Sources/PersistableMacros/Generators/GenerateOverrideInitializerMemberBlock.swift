//
//  GenerateOverrideInitializerMemberBlock.swift
//  PersistableMacro
//
//  Created by MaTooSens on 23/03/2025.
//

import SwiftSyntax

func generateOverrideInitializerMemberBlock(persistableContext: PersistableContext) -> [MemberBlockItemSyntax] {
    let body = generateOverrideInitBody(from: persistableContext.properties)
    
    let initDecl = InitializerDeclSyntax(
        leadingTrivia: .newlines(2),
        modifiers: .overrideModifiers,
        signature: FunctionSignatureSyntax(parameterClause: FunctionParameterClauseSyntax(parameters: [])),
        body: body,
        trailingTrivia: .newlines(2)
    )
    
    return [.init(decl: DeclSyntax(initDecl))]
}

private func generateOverrideInitBody(from properties: [Property]) -> CodeBlockSyntax {
    CodeBlockSyntax(
        statements: CodeBlockItemListSyntax {
            CodeBlockItemSyntax.superInit
            
            for property in properties where !property.name.isIdProperty {
                if let defaultValue = DefaultValues.forType(property.type.trimmedDescription) {
                    CodeBlockItemSyntax.propertyDefaultAssignment(
                        propertyName: property.name,
                        defaultValue: defaultValue
                    )
                }
            }
        }
    )
}

enum DefaultValues {
    private static let typeMapping: [String: String] = [
        // Basic types
        "String": "\"\"",
        "Bool": "false",
        
        // Numeric types
        "Int": "0",
        "Int8": "0",
        "Int16": "0",
        "Int32": "0",
        "Int64": "0",
        "UInt": "0",
        "UInt8": "0",
        "UInt16": "0",
        "UInt32": "0",
        "UInt64": "0",
        "Double": "0",
        "Float": "0",
        "CGFloat": "0",
        
        // Complex types
        "Date": "Date()",
        "UUID": "UUID()",
        "Data": "Data()",
        "URL": "URL(string: \"https://www.google.com\")!",
        
        // Geometric types
        "CGPoint": "CGPoint()",
        "CGRect": "CGRect()",
        "CGSize": "CGSize()",
        "CGVector": "CGVector()"
    ]
    
    static func forType(_ type: String) -> String? {
        return typeMapping[type]
    }
}
