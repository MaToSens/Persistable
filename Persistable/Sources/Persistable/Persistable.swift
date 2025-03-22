
/*
 StructDeclSyntax
 ├─attributes: AttributeListSyntax
 │ ╰─[0]: AttributeSyntax
 │   ├─atSign: atSign
 │   ├─attributeName: IdentifierTypeSyntax
 │   │ ╰─name: identifier("Persistable")
 │   ├─leftParen: leftParen
 │   ├─arguments: LabeledExprListSyntax
 │   │ ╰─[0]: LabeledExprSyntax
 │   │   ├─label: identifier("name")
 │   │   ├─colon: colon
 │   │   ╰─expression: StringLiteralExprSyntax
 │   │     ├─openingQuote: stringQuote
 │   │     ├─segments: StringLiteralSegmentListSyntax
 │   │     │ ╰─[0]: StringSegmentSyntax
 │   │     │   ╰─content: stringSegment("Test")
 │   │     ╰─closingQuote: stringQuote
 │   ╰─rightParen: rightParen
 ├─modifiers: DeclModifierListSyntax
 │ ╰─[0]: DeclModifierSyntax
 │   ╰─name: keyword(SwiftSyntax.Keyword.public)
 ├─structKeyword: keyword(SwiftSyntax.Keyword.struct)
 ├─name: identifier("User")
 ╰─memberBlock: MemberBlockSyntax
   ├─leftBrace: leftBrace
   ├─members: MemberBlockItemListSyntax
   │ ├─[0]: MemberBlockItemSyntax
   │ │ ╰─decl: VariableDeclSyntax
   │ │   ├─attributes: AttributeListSyntax
   │ │   ├─modifiers: DeclModifierListSyntax
   │ │   │ ╰─[0]: DeclModifierSyntax
   │ │   │   ╰─name: keyword(SwiftSyntax.Keyword.public)
   │ │   ├─bindingSpecifier: keyword(SwiftSyntax.Keyword.let)
   │ │   ╰─bindings: PatternBindingListSyntax
   │ │     ╰─[0]: PatternBindingSyntax
   │ │       ├─pattern: IdentifierPatternSyntax
   │ │       │ ╰─identifier: identifier("id")
   │ │       ╰─typeAnnotation: TypeAnnotationSyntax
   │ │         ├─colon: colon
   │ │         ╰─type: IdentifierTypeSyntax
   │ │           ╰─name: identifier("String")
   │ ├─[1]: MemberBlockItemSyntax
   │ │ ╰─decl: VariableDeclSyntax
   │ │   ├─attributes: AttributeListSyntax
   │ │   ├─modifiers: DeclModifierListSyntax
   │ │   │ ╰─[0]: DeclModifierSyntax
   │ │   │   ╰─name: keyword(SwiftSyntax.Keyword.public)
   │ │   ├─bindingSpecifier: keyword(SwiftSyntax.Keyword.let)
   │ │   ╰─bindings: PatternBindingListSyntax
   │ │     ╰─[0]: PatternBindingSyntax
   │ │       ├─pattern: IdentifierPatternSyntax
   │ │       │ ╰─identifier: identifier("name")
   │ │       ╰─typeAnnotation: TypeAnnotationSyntax
   │ │         ├─colon: colon
   │ │         ╰─type: IdentifierTypeSyntax
   │ │           ╰─name: identifier("String")
   │ ├─[2]: MemberBlockItemSyntax
   │ │ ╰─decl: VariableDeclSyntax
   │ │   ├─attributes: AttributeListSyntax
   │ │   ├─modifiers: DeclModifierListSyntax
   │ │   │ ╰─[0]: DeclModifierSyntax
   │ │   │   ╰─name: keyword(SwiftSyntax.Keyword.public)
   │ │   ├─bindingSpecifier: keyword(SwiftSyntax.Keyword.let)
   │ │   ╰─bindings: PatternBindingListSyntax
   │ │     ╰─[0]: PatternBindingSyntax
   │ │       ├─pattern: IdentifierPatternSyntax
   │ │       │ ╰─identifier: identifier("email")
   │ │       ╰─typeAnnotation: TypeAnnotationSyntax
   │ │         ├─colon: colon
   │ │         ╰─type: IdentifierTypeSyntax
   │ │           ╰─name: identifier("Int")
   │ ├─[3]: MemberBlockItemSyntax
   │ │ ╰─decl: VariableDeclSyntax
   │ │   ├─attributes: AttributeListSyntax
   │ │   ├─modifiers: DeclModifierListSyntax
   │ │   │ ╰─[0]: DeclModifierSyntax
   │ │   │   ╰─name: keyword(SwiftSyntax.Keyword.public)
   │ │   ├─bindingSpecifier: keyword(SwiftSyntax.Keyword.let)
   │ │   ╰─bindings: PatternBindingListSyntax
   │ │     ╰─[0]: PatternBindingSyntax
   │ │       ├─pattern: IdentifierPatternSyntax
   │ │       │ ╰─identifier: identifier("number")
   │ │       ╰─typeAnnotation: TypeAnnotationSyntax
   │ │         ├─colon: colon
   │ │         ╰─type: IdentifierTypeSyntax
   │ │           ╰─name: identifier("Double")
   │ ├─[4]: MemberBlockItemSyntax
   │ │ ╰─decl: VariableDeclSyntax
   │ │   ├─attributes: AttributeListSyntax
   │ │   ├─modifiers: DeclModifierListSyntax
   │ │   │ ╰─[0]: DeclModifierSyntax
   │ │   │   ╰─name: keyword(SwiftSyntax.Keyword.private)
   │ │   ├─bindingSpecifier: keyword(SwiftSyntax.Keyword.var)
   │ │   ╰─bindings: PatternBindingListSyntax
   │ │     ╰─[0]: PatternBindingSyntax
   │ │       ├─pattern: IdentifierPatternSyntax
   │ │       │ ╰─identifier: identifier("privateVariable")
   │ │       ├─typeAnnotation: TypeAnnotationSyntax
   │ │       │ ├─colon: colon
   │ │       │ ╰─type: IdentifierTypeSyntax
   │ │       │   ╰─name: identifier("Int")
   │ │       ╰─initializer: InitializerClauseSyntax
   │ │         ├─equal: equal
   │ │         ╰─value: IntegerLiteralExprSyntax
   │ │           ╰─literal: integerLiteral("42")
   │ ├─[5]: MemberBlockItemSyntax
   │ │ ╰─decl: VariableDeclSyntax
   │ │   ├─attributes: AttributeListSyntax
   │ │   ├─modifiers: DeclModifierListSyntax
   │ │   │ ╰─[0]: DeclModifierSyntax
   │ │   │   ├─name: keyword(SwiftSyntax.Keyword.private)
   │ │   │   ╰─detail: DeclModifierDetailSyntax
   │ │   │     ├─leftParen: leftParen
   │ │   │     ├─detail: identifier("set")
   │ │   │     ╰─rightParen: rightParen
   │ │   ├─bindingSpecifier: keyword(SwiftSyntax.Keyword.var)
   │ │   ╰─bindings: PatternBindingListSyntax
   │ │     ╰─[0]: PatternBindingSyntax
   │ │       ├─pattern: IdentifierPatternSyntax
   │ │       │ ╰─identifier: identifier("privateSetVariable")
   │ │       ├─typeAnnotation: TypeAnnotationSyntax
   │ │       │ ├─colon: colon
   │ │       │ ╰─type: IdentifierTypeSyntax
   │ │       │   ╰─name: identifier("Double")
   │ │       ╰─initializer: InitializerClauseSyntax
   │ │         ├─equal: equal
   │ │         ╰─value: FloatLiteralExprSyntax
   │ │           ╰─literal: floatLiteral("3.14")
   │ ├─[6]: MemberBlockItemSyntax
   │ │ ╰─decl: VariableDeclSyntax
   │ │   ├─attributes: AttributeListSyntax
   │ │   ├─modifiers: DeclModifierListSyntax
   │ │   ├─bindingSpecifier: keyword(SwiftSyntax.Keyword.var)
   │ │   ╰─bindings: PatternBindingListSyntax
   │ │     ╰─[0]: PatternBindingSyntax
   │ │       ├─pattern: IdentifierPatternSyntax
   │ │       │ ╰─identifier: identifier("toast")
   │ │       ├─typeAnnotation: TypeAnnotationSyntax
   │ │       │ ├─colon: colon
   │ │       │ ╰─type: IdentifierTypeSyntax
   │ │       │   ╰─name: identifier("Bool")
   │ │       ╰─accessorBlock: AccessorBlockSyntax
   │ │         ├─leftBrace: leftBrace
   │ │         ├─accessors: CodeBlockItemListSyntax
   │ │         │ ╰─[0]: CodeBlockItemSyntax
   │ │         │   ╰─item: ReturnStmtSyntax
   │ │         │     ├─returnKeyword: keyword(SwiftSyntax.Keyword.return)
   │ │         │     ╰─expression: BooleanLiteralExprSyntax
   │ │         │       ╰─literal: keyword(SwiftSyntax.Keyword.true)
   │ │         ╰─rightBrace: rightBrace MISSING
   │ ╰─[7]: MemberBlockItemSyntax
   │   ╰─decl: VariableDeclSyntax
   │     ├─attributes: AttributeListSyntax
   │     ├─modifiers: DeclModifierListSyntax
   │     │ ╰─[0]: DeclModifierSyntax
   │     │   ├─unexpectedBeforeName: UnexpectedNodesSyntax
   │     │   │ ╰─[0]: rightParen
   │     │   ╰─name: keyword(SwiftSyntax.Keyword.static)
   │     ├─bindingSpecifier: keyword(SwiftSyntax.Keyword.let)
   │     ╰─bindings: PatternBindingListSyntax
   │       ╰─[0]: PatternBindingSyntax
   │         ├─pattern: IdentifierPatternSyntax
   │         │ ╰─identifier: identifier("staticConstant")
   │         ├─typeAnnotation: TypeAnnotationSyntax
   │         │ ├─colon: colon
   │         │ ╰─type: IdentifierTypeSyntax
   │         │   ╰─name: identifier("String")
   │         ╰─initializer: InitializerClauseSyntax
   │           ├─equal: equal
   │           ╰─value: StringLiteralExprSyntax
   │             ├─openingQuote: stringQuote
   │             ├─segments: StringLiteralSegmentListSyntax
   │             │ ╰─[0]: StringSegmentSyntax
   │             │   ╰─content: stringSegment("Static Constant")
   │             ╰─closingQuote: stringQuote
   ╰─rightBrace: rightBrace
 
 
 │ ╰─decl: VariableDeclSyntax
│ │   ├─attributes: AttributeListSyntax
│ │   ├─modifiers: DeclModifierListSyntax
│ │   │ ╰─[0]: DeclModifierSyntax
│ │   │   ╰─name: keyword(SwiftSyntax.Keyword.private)
│ │   ├─bindingSpecifier: keyword(SwiftSyntax.Keyword.var)
 
 ╰─decl: VariableDeclSyntax
 │     ├─attributes: AttributeListSyntax
 │     ├─modifiers: DeclModifierListSyntax
 │     │ ╰─[0]: DeclModifierSyntax
 │     │   ├─unexpectedBeforeName: UnexpectedNodesSyntax
 │     │   │ ╰─[0]: rightParen
 │     │   ╰─name: keyword(SwiftSyntax.Keyword.static)
 */
