//
//  Database.swift
//  Application
//
//  Created by Mark Sinkovics on 2018. 07. 26..
//

import Foundation


/// This class was created for demonstration puposes
/// in order to present this server functionalities.
/// In a real life situation it can be replaced by
/// other database providers. (MongoDB, MySQL, etc.)
class Database {
    
    static let shared = Database()
    
    private var _users :[UserModel] = []
    public private(set) var counter: Int = 1
    
    init() {
        self._users = []
    }
    
    
    /// Get all users from the database
    ///
    /// - Returns: an array of users
    func users() -> [UserModel] {
        return self._users
    }

    
    /// Get a user with a certain id
    ///
    /// - Parameter id: unique identifier of a user
    /// - Returns: return that certain user or nil
    func get(userById id: String) -> UserModel? {
        return self._users.first(where: { $0.id == id})
    }
    
    
    /// Add new user to the database
    ///
    /// - Parameter user: a UserModel instance
    func add(user: UserModel) {
        counter += 1
        self._users.append(user)
    }
    
    
    /// Remove user from the database
    ///
    /// - Parameter user: a UserModel instance
    func remove(user: UserModel) {
        self._users.removeAll(where: {$0.id == user.id})
    }
}
