import UIKit
// MARK: - Address
public struct Address {
    public var street: String
    public var city: String
    public var state: String
    public var zipcode: String
}

// MARK - AddressView
public final class AddressView : UIView {
    @IBOutlet public var streetTextField: UITextField!
    @IBOutlet public var cityTextField: UITextField!
    @IBOutlet public var stateTextField: UITextField!
    @IBOutlet public var zipcodeTextField: UITextField!
}

// MARK - AddressViewController
public final class AddressViewController: UIViewController {
    
    // MARK: - Properties
    public var address: Address?
    public var addressView: AddressView? {
        guard isViewLoaded else { return nil }
        return (view as! AddressView)
    }
    
}

