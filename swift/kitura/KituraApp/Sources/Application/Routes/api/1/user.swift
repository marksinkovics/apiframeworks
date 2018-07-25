//
//  User.swift
//  Application
//
//  Created by Mark Sinkovics on 2018. 07. 24..
//

import Foundation
import Kitura

extension API.V1 {
    class User {
        public let router = Router()
        init() throws {
            router.get("/:id+") { req, res, next in
                let id = req.parameters["id"] ?? ""
                if let user = Database.shared.users().first(where: {$0.id == id}) {
                    try res.send(json: user).end()
                } else {
                    res.status(.notFound)
                }
            }
            
            router.get("") { req, res, next in
                try res.send(json: Database.shared.users()).end()
            }
            
            router.put("/:id+") { req, res, next in
                let id = req.parameters["id"] ?? ""
                let updatedUser = try req.read(as: UserModel.self)
                //TODO: validate username
                if let user = Database.shared.get(userById: id) {
                    if user.update(withUser: updatedUser) {
                        try res.status(.created).end()
                    } else {
                        try res.status(.badRequest).end()
                    }
                }
            }
            
            router.post("") { req, res, next in
                let user = try req.read(as: UserModel.self)
                //TODO: validate username
                user.id = "id\(Database.shared.counter)"
                Database.shared.add(user: user)
                try res.status(.created).end()
            }
        }
    }
}
