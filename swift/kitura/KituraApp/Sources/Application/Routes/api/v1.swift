//
//  v1.swift
//  Application
//
//  Created by Mark Sinkovics on 2018. 07. 24..
//

import Kitura

class V1 {
    let router = Router()
    init() throws {
        let userRouter = try User()
        router.all("/user", middleware: userRouter.router)
    }
}
