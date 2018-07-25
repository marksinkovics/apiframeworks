import Kitura
import CredentialsHTTP

public class App {
    
    let router = Router()
    
    public init() throws {
        
    }
    
    func postInit() throws {
        let api = try API()
        
        router.all("/api", middleware: api.router)
        
        let authentication = Authentication()
        router.all("/admin", middleware: authentication.credentials)
        router.get("/admin") { req, res, next in
            try res.send("Welcome to admin page!").end()
        }
    }

    public func run() throws {
        try postInit()
        Kitura.addHTTPServer(onPort: 8080, with: router)
        Kitura.run()
    }
}
