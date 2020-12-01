/*:
 [Previous](@previous)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Next](@next)
 
 # Observer
 - - - - - - - - - -
 ![Observer Diagram](Observer_Diagram.png)
 
 The observer pattern allows "observer" objects to register for and receive updates whenever changes are made to "subject" objects.
 
 This pattern allows us to define "one-to-many" relationships between many observers receiving updates from the same subject.
 
 ## Code Example
 */
import Foundation

// MARK: - KVO
// The subject
@objcMembers public class KVOUser: NSObject {
    // observed property
    dynamic var name: String
    // init
    public init(name: String) {
        self.name = name
    }
}

print("-- KVO example --")
let kvoUser = KVOUser(name: "Tam")

var kvoObserver: NSKeyValueObservation? = kvoUser.observe(\.name, options: [.initial, .new]) { (user, change) in
    print("User's name is \(user.name)")
}
kvoUser.name = "Tam Nguyen"
kvoObserver = nil
kvoUser.name = "Nothing"

// MARK: - Observable Example
public class User {
  public let name: Observable<String>
  public init(name: String) {
self.name = Observable(name) }
}
public class Observer { }

// 1
print("")
print("-- Observable Example--")
// 2
let user = User(name: "Madeline")
// 3
var observer: Observer? = Observer()
user.name.addObserver(observer!, options: [.initial, .new]) { (name, change) in
    print("User's name is \(name)")
}
