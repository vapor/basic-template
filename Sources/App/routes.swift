import Fluent
import Vapor

/// Register your application's routes here.
public func routes(_ r: HTTPRoutes, _ c: Container) throws {
    let psql = try c.connectionPool(for: .psql)
    
    // Basic "It works" example
    r.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    r.get("hello") { req in
        return "Hello, world!"
    }

    // Example of configuring a controller
    let todoController = TodoController(db: psql)
    r.get("todos", use: todoController.index)
    r.post("todos", use: todoController.create)
    // r.delete("todos", Todo.parameter, use: todoController.delete)
}
