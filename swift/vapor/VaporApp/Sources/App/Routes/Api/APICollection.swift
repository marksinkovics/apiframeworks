import Foundation

import Vapor
import HTTP
import Routing

class ApiCollection: RouteCollection {
    func boot(router: Router) throws {
        let api = router.grouped("api")
        let v1 = V1Collection()
        try api.register(collection: v1)
    }
}
