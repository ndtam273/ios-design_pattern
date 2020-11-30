import UIKit

// MARK: - Singleton
let app = UIApplication.shared
//let app2 = UIApplication(). ~> Compiler error

public class MySingleton {
    // shared
    static let shared = MySingleton()
    // private init
    private init() {}
}

let mySingleton = MySingleton.shared
//let mySingleton2 = MySingleton() ~> Compiler error

// MARK: - Singleton Plus
let defaultFileManager = FileManager.default
let customFileManager = FileManager()

public class MySingletonPlus {
    // shared (default)
    static let shared = MySingletonPlus()
    // public init
    public init() {}
}
let singletonPlus = MySingletonPlus.shared
let singletonPlus2 = MySingletonPlus()

