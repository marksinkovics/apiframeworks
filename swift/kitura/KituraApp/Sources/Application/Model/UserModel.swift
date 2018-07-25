//
//  User.swift
//  Application
//
//  Created by Mark Sinkovics on 2018. 07. 25..
//

class UserModel : Codable {
    
    init(id: String, username: String) {
        self.id = id
        self.username = username
    }
    
    var id: String?
    var username: String?
}

extension UserModel {
    func validate(password: String) -> Bool {
        // compare password with keychain stored one
        return (password == "password")
    }
}

extension UserModel {
    func update(withUser user: UserModel) -> Bool {
        if let username = user.username {
            self.username = username
        }
        return true
    }
}
