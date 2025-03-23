//
//  ExprSyntax+Extensions.swift
//  PersistableMacro
//
//  Created by MaTooSens on 22/03/2025.
//

import SwiftSyntax

extension ExprSyntax {
    static let superInit = ExprSyntax(stringLiteral: "super.init()")
    
    static func propertyAssignment(
        propertyName: some SyntaxProtocol,
        fromSource sourceName: TokenSyntax
    ) -> ExprSyntax {
        ExprSyntax(stringLiteral: "self.\(propertyName) = \(sourceName).\(propertyName)")
    }
}
