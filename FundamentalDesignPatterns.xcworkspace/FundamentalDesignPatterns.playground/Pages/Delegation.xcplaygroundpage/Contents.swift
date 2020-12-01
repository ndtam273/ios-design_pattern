/*:
 [Previous](@previous)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Next](@next)
 
 # Delegation
 - - - - - - - - - -
 ![Delegation Diagram](Delegation_Diagram.png)
 
 The delegation pattern allows an object to use a helper object to perform a task, instead of doing the task itself.
 
 This allows for code reuse through object composition, instead of inheritance.
 
 ## Code Example
 */
import UIKit

// Delegate protocol
public protocol MenuViewControllerDelegate: class {
    func menuViewController(_ menuViewController: MenuViewController, didSelectItemAtIndex index: Int)
}

// Object acting as Delegate and also an object need a delegate
public class MenuViewController: UIViewController {
    // Delegate
    public weak var delegate: MenuViewControllerDelegate?
    // View
    @IBOutlet public var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    // property
    private let items = ["Item 1", "Item 2", "Item 3"]
}


// MARK: - UITableViewDataSource
extension MenuViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
}

// MARK: - UITableViewDelegate
extension MenuViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // To do next.....
        delegate?.menuViewController(self, didSelectItemAtIndex: indexPath.row)
    }
}
