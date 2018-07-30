import Foundation

import Vapor
import HTTP
import Routing
import Authentication
import Crypto

class AdminCollection: RouteCollection {
    func boot(router: Router) throws {

        let basicAuthMiddleware = User.basicAuthMiddleware(using: BCrypt)
        let guardAuthMiddleware = User.guardAuthMiddleware()
        let basicAuthGroup = router.grouped([basicAuthMiddleware, guardAuthMiddleware])

        basicAuthGroup.get("admin") { request in
            return "Welcome to admin page!"
        }
    }
}
