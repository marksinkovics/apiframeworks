//
//  User.swift
//  App
//
//  Created by Mark Sinkovics on 2018. 10. 01..
//

import FluentSQLite
import Vapor
import Authentication

/// A single entry of a User list.
final class User: SQLiteModel {
    /// The unique identifier for this `User`.
    var id: Int?
    
    /// A title describing what this `User` entails.
    var name: String
    
    var password: String
    
    /// Creates a new `User`.
    init(id: Int? = nil, name: String, password: String) {
        self.id = id
        self.name = name
        self.password = password
    }
    
    init(name: String, password: String) {
        self.id = nil
        self.name = name
        self.password = password
    }

}

/// Allows `User` to be used as a dynamic migration.
extension User: Migration { }

/// Allows `User` to be encoded to and decoded from HTTP messages.
extension User: Content { }

/// Allows `User` to be used as a dynamic parameter in route definitions.
extension User: Parameter { }

extension User: BasicAuthenticatable {
    static var usernameKey: UsernameKey { return \User.name }
    static var passwordKey: PasswordKey { return \User.password }
}

extension User {
    struct AuthenticatedUser: Content {
        var name: String
        var id: Int?
    }
    
    struct LoginRequest: Content {
        var name: String
        var password: String
    }
}

