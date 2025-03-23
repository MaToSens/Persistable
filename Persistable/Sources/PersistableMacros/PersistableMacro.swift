import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros


// TODO: Przenieść do innego pliku
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
        
        
        // TODO: Generate member block
        let memberBlockList = MemberBlockItemListSyntax(initializerMemberBlock)
        let memberBlock = MemberBlockSyntax(members: memberBlockList)
        
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
        
        // TODO: Generate Variable
        
        
        // Init
        let initializerMemberBlock = generateInitializerMemberBlock(
            persistableContext: persistableContext,
            sourceParamName: .model,
            includeSuperInit: true
        )
        
        return []
    }
    
//    static func generateMemberBlock() -> MemberBlockSyntax {
//        
//    }
    
}
