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
    var username: String
    
    var password: String = "password"
    
    enum CodingKeys: String, CodingKey {
        case id
        case username
    }
    
    /// Creates a new `User`.
    init(id: Int? = nil, username: String, password: String) {
        self.id = id
        self.username = username
        self.password = password
    }
    
    init(username: String, password: String) {
        self.id = nil
        self.username = username
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
    static var usernameKey: UsernameKey { return \User.username }
    static var passwordKey: PasswordKey { return \User.password }
}

extension User {
    struct AuthenticatedUser: Content {
        var username: String
        var id: Int?
    }
    
    struct LoginRequest: Content {
        var username: String
        var password: String
    }
}

