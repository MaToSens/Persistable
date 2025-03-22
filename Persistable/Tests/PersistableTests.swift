//
//  PersistableTests.swift
//  Persistable
//
//  Created by MaTooSens on 21/03/2025.
//

import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest
import PersistableMacroMacros


let testMacros: [String: Macro.Type] = [
    "Persistable" : PersistableMacro.self
]

final class PersistableMacroTests: XCTestCase {
    func testMacro() throws {
        assertMacroExpansion(
        """
         @Persistable(name: "Test")
         public struct User {
             public let id: String
             public let name: String
             public let email: Int
             public let number: Double
             public let salesChannel: SalesChannel
         }
         """, expandedSource:
        """
         
         
         """,macros: testMacros
        )
    }
}

