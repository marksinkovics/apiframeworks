import Foundation

import Vapor
import HTTP
import Routing

class UserCollection: RouteCollection {
    func boot(router: Router) throws {
        let userController = UserController()
        router.get("user", use: userController.index)
        router.get("user", User.parameter, use: userController.show)
        router.post("user", use: userController.create)
        router.put("user", User.parameter, use: userController.update)
        router.delete("user", User.parameter, use: userController.delete)
    }
}
