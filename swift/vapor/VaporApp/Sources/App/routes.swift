import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    let api = ApiCollection()
    try router.register(collection: api)
    
    let admin = AdminCollection()
    try router.register(collection: admin)
}
