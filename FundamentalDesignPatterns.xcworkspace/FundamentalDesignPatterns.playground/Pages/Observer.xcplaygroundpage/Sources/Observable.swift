import Foundation
public class Observable<Type> {
    
    // MARK: - Callback
    fileprivate class Callback {
        fileprivate weak var observer: AnyObject?
        fileprivate let options: [ObservableOptions]
        fileprivate let closure: (Type, ObservableOptions) -> Void
        
        fileprivate init(
            observer: AnyObject,
            options: [ObservableOptions],
            closure: @escaping (Type, ObservableOptions) -> Void) {
            self.observer = observer
            self.options = options
            self.closure = closure
        }
    }
    
    // MARK: - Properties
    public var value: Type {
      // 1
    didSet { // 2
        removeNilObserverCallbacks()
    // 3
    notifyCallbacks(value: oldValue, option: .old)
    notifyCallbacks(value: value, option: .new) }
    }
    private func removeNilObserverCallbacks() {
    callbacks = callbacks.filter { $0.observer != nil } }
    private func notifyCallbacks(value: Type,
                                 option: ObservableOptions) {
    let callbacksToNotify = callbacks.filter {
    $0.options.contains(option) }
    callbacksToNotify.forEach { $0.closure(value, option) } }
    // MARK: - Object Lifecycle
    public init(_ value: Type) {
    self.value = value }
    
    // MARK: - Managing Observers
    // 1
    private var callbacks: [Callback] = []
    // 2
    public func addObserver(
    _ observer: AnyObject,
    removeIfExists: Bool = true,
    options: [ObservableOptions] = [.new],
    closure: @escaping (Type, ObservableOptions) -> Void) {
    // 3
      if removeIfExists {
        removeObserver(observer)
      }
    // 4
      let callback = Callback(observer: observer,
                              options: options,
                              closure: closure)
    callbacks.append(callback)
    // 5
    if options.contains(.initial) {
    closure(value, .initial) }
    }
    // 6
    public func removeObserver(_ observer: AnyObject) { // 7
    callbacks = callbacks.filter { $0.observer !== observer } }
}

// MARK: - ObservableOptions

public struct ObservableOptions: OptionSet {
    public static let initial = ObservableOptions(rawValue: 1 << 0)
    public static let old = ObservableOptions(rawValue: 1 << 1)
    public static let new = ObservableOptions(rawValue: 1 << 2)
    
    public var rawValue: Int
    
    public init(rawValue : Int) {
        self.rawValue = rawValue
    }
    
}


