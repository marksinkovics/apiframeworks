import Foundation

import Vapor
import HTTP
import Routing

class V1Collection: RouteCollection {
    func boot(router: Router) throws {
        let v1 = router.grouped("1")
        let user = UserCollection()
        try v1.register(collection: user)
    }
}
