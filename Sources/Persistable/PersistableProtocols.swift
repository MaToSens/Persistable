//
//  PersistableProtocols.swift
//  PersistableMacro
//
//  Created by MaTooSens on 22/03/2025.
//

import Foundation
import RealmSwift

public protocol Persistable: Identifiable, Codable, Equatable, Hashable, Sendable {
    static var collection: String { get }
    
    associatedtype DAO: LocalDAO
    init(from model: DAO)
}

public protocol LocalDAO: Object {
    associatedtype Model: Persistable
    init(from dao: Model)
}
