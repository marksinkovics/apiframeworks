//
//  Authentication.swift
//  Application
//
//  Created by Mark Sinkovics on 2018. 07. 26..
//

import Credentials
import CredentialsHTTP

class Authentication {
    let credentials = Credentials()
    
    init() {
        let basicCredentials = CredentialsHTTPBasic(verifyPassword: self.verifyPassword)
        credentials.register(plugin: basicCredentials)
    }
    
    func verifyPassword(username: String, password: String, callback: @escaping (UserProfile?) -> Void) {
        if let user = Database.shared.users().first(where: {$0.username == username}), user.validate(password: password) {
            callback(UserProfile(id: username, displayName: username, provider: "HTTPBasic"))
        } else {
            callback(nil)
        }
    }

}


