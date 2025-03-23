import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

@main
struct PersistablePlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        PersistableMacro.self
    ]
}

enum PersistableError: CustomStringConvertible, Error {
    case onlyApplicableToStruct
    case missingIdProperty
    
    var description: String {
        switch self {
        case .onlyApplicableToStruct: return "@Persistable can only be applied to struct declarations"
        case .missingIdProperty: return "Struct must have an 'id' property to conform to 'Identifiable' protocol"
        }
    }
}

public struct PersistableMacro: ExtensionMacro, PeerMacro {
    
    public static func expansion(
        of node: SwiftSyntax.AttributeSyntax,
        attachedTo declaration: some SwiftSyntax.DeclGroupSyntax,
        providingExtensionsOf type: some SwiftSyntax.TypeSyntaxProtocol,
        conformingTo protocols: [SwiftSyntax.TypeSyntax],
        in context: some SwiftSyntaxMacros.MacroExpansionContext
    ) throws -> [SwiftSyntax.ExtensionDeclSyntax] {
        let persistableContext = try generatePersistableContext(
            from: declaration,
            conformingTo: [.persistable]
        )
        
        let initializerMemberBlock = generateInitializerMemberBlock(
            persistableContext: persistableContext,
            sourceParamName: .dao
        )
        
        let memberBlock = generateMemberBlock(with: initializerMemberBlock)
        
        let persistableExtension = ExtensionDeclSyntax(
            extendedType: type,
            inheritanceClause: persistableContext.inheritanceClause,
            memberBlock: memberBlock
        )
        
        return [persistableExtension]
    }
    
    public static func expansion(
        of node: SwiftSyntax.AttributeSyntax,
        providingPeersOf declaration: some SwiftSyntax.DeclSyntaxProtocol,
        in context: some SwiftSyntaxMacros.MacroExpansionContext
    ) throws -> [SwiftSyntax.DeclSyntax] {
        let persistableContext = try generatePersistableContext(
            from: declaration,
            conformingTo: [.realmObject, .localDAO]
        )
        
        let variablesMemberBlock = generateVariableMemberBlock(from: persistableContext.properties)
        
        let overrideInitializerMemberBlock = generateOverrideInitializerMemberBlock(persistableContext: persistableContext)
        
        let initializerMemberBlock = generateInitializerMemberBlock(
            persistableContext: persistableContext,
            sourceParamName: .model,
            sourceType: .entity
        )
        
        let memberBlockItems: [MemberBlockItemSyntax] = variablesMemberBlock + overrideInitializerMemberBlock + initializerMemberBlock
        let memberBlock = generateMemberBlock(with: memberBlockItems)
        
        let daoPersistenceClass = ClassDeclSyntax(
            modifiers: persistableContext.structDecl.modifiers.withFinal,
            name: persistableContext.tokens.daoToken,
            inheritanceClause: persistableContext.inheritanceClause,
            memberBlock: memberBlock
        )
        
        return [.init(DeclSyntax(daoPersistenceClass))]
    }
    
    private static func generateMemberBlock(with memberItems: [MemberBlockItemSyntax]) -> MemberBlockSyntax {
        MemberBlockSyntax(members: MemberBlockItemListSyntax(memberItems))
    }
}
