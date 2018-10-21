//
//  Api.swift
//  Application
//
//  Created by Mark Sinkovics on 2018. 07. 24..
//

import Kitura

class API {
    let router = Router()
    init() throws {
        let v1Router = try V1()
        router.all("/1", middleware: v1Router.router)
    }
}
