//
//  CodeBlockItemSyntax+Extensions.swift
//  PersistableMacro
//
//  Created by MaTooSens on 23/03/2025.
//

import SwiftSyntax

extension CodeBlockItemSyntax {
    static let superInit = CodeBlockItemSyntax(item: .expr(ExprSyntax(stringLiteral: "super.init()")))
    
    static func propertyAssignment(
        propertyName: some SyntaxProtocol,
        fromSource sourceName: TokenSyntax
    ) -> CodeBlockItemSyntax {
        CodeBlockItemSyntax(item:
                .expr(ExprSyntax(stringLiteral: "self.\(propertyName) = \(sourceName).\(propertyName)"))
        )
    }
    
    static func propertyDefaultAssignment(
        propertyName: some SyntaxProtocol,
        defaultValue: String
    ) -> CodeBlockItemSyntax {
        CodeBlockItemSyntax(item:
                .expr(ExprSyntax(stringLiteral: "self.\(propertyName) = \(defaultValue)"))
        )
    }
}
