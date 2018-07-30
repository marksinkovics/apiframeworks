import Vapor
import Crypto

/// Controls basic CRUD operations on `User`s.
final class UserController {
    /// Returns a list of all `User`s.
    func index(_ req: Request) throws -> Future<[User.AuthenticatedUser]> {
        return User.query(on: req).all().map(to: [User.AuthenticatedUser].self, { (authUsers) -> [User.AuthenticatedUser] in
            return authUsers.map { User.AuthenticatedUser(name: $0.name, id: $0.id) }
        })
    }

    /// Saves a decoded `User` to the database.
    func create(_ req: Request) throws -> Future<User.AuthenticatedUser> {
        return try req.content.decode(User.self).flatMap { user in
            let hasher = try req.make(BCryptDigest.self)
            let passwordHashed = try hasher.hash(user.password)
            let newUser = User(name: user.name, password: passwordHashed)
            return newUser.save(on: req).map(to: User.AuthenticatedUser.self) { authedUser in
                return try User.AuthenticatedUser(name: authedUser.name, id: authedUser.requireID())
            }
        }
    }

    /// Deletes a parameterized `User`.
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(User.self).flatMap { user in
            return user.delete(on: req)
        }.transform(to: .ok)
    }
    
    func show(_ req: Request) throws -> Future<User> {
        return try req.parameters.next(User.self)
    }
}
